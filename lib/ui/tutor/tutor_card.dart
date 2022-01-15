import 'package:dio/src/dio.dart';
import 'package:flutter/material.dart';
import 'package:my_lettutor_app/data/network/dio_client.dart';
import 'package:my_lettutor_app/models/tutor.dart';
import 'package:my_lettutor_app/providers/auth_provider.dart';

import 'package:my_lettutor_app/ui/tutor/tutor_detail.dart';
import 'package:my_lettutor_app/ui/tutor/tutor_list_tile.dart';


import 'package:provider/src/provider.dart';

class TutorCard extends StatelessWidget {
  final Tutor tutor;
  final int version;
  final Function(Dio, String) reloadTutorList;
  const TutorCard({
    Key? key,
    required this.tutor,
    required this.version,
    required this.reloadTutorList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final accessToken =
        context.read<AuthProvider>().userToken.tokens!.access!.token!;
    final dio = DioClient.dio;
    return SizedBox(
      height: 200,
      child: Card(
        elevation: 6,
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: InkWell(
          onTap: () {
            Navigator.of(context)
                .pushNamed(
                  TutorDetail.routeName,
                  arguments: tutor,
                )
                .whenComplete(() => reloadTutorList(dio, accessToken));
          },
          splashColor: Theme.of(context).splashColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TutorListTile(
                  tutor: tutor,
                  version: version,
                ),
                SizedBox(
                  height: version == 1 ? 5 : 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      tutor.bio!,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 4,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
