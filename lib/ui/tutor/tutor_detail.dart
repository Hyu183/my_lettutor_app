import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:my_lettutor_app/data/network/dio_client.dart';
import 'package:my_lettutor_app/models/tutor.dart';
import 'package:my_lettutor_app/providers/auth_provider.dart';

import 'package:my_lettutor_app/ui/tutor/tutor_detail_body.dart';
import 'package:my_lettutor_app/ui/tutor/tutor_detail_tile.dart';

import 'package:my_lettutor_app/widgets/video/video_player.dart';
import 'package:provider/src/provider.dart';

class TutorDetail extends StatefulWidget {
  static const routeName = '/tutor-detail';
  final String tutorId;
  const TutorDetail({
    Key? key,
    required this.tutorId,
  }) : super(key: key);

  @override
  State<TutorDetail> createState() => _TutorDetailState();
}

class _TutorDetailState extends State<TutorDetail> {
  bool isLoading = true;
  late Tutor tutor;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTutorDetail();
  }

  void getTutorDetail() {
    var dio = DioClient.dio;
    var accessToken = "";
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      accessToken =
          context.read<AuthProvider>().userToken.tokens!.access!.token!;
      //   print(accessToken);
      dio.options.headers["Authorization"] = "Bearer $accessToken";
      try {
        var res = await dio.get('/tutor/${widget.tutorId}');

        setState(() {
          tutor = Tutor.fromJson(res.data);
          isLoading = false;
        });
      } on DioError catch (e) {
        print(e);
        print(e.response!.data['message']);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading?Scaffold(
        appBar: AppBar(
              elevation: 0,
              title: const Text(
                "Loading",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            body: const Center(child: CircularProgressIndicator(),),
    ) : Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              title: Text(
                tutor.user!.name!,
                style: Theme.of(context).textTheme.headline1,
              ),
              centerTitle: true,
              forceElevated: innerBoxIsScrolled,
            ),
          ];
        },
        body: Container(
          margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  child: TutorDetailTile(
                    id: tutor.userId!,
                    name: tutor.user!.name!,
                    rating: tutor.avgRating!,
                    country: tutor.user!.country!,
                    imageUrl: tutor.user!.avatar!,
                    isFavorite: tutor.isFavorite!,
                  ),
                ),
                MyVideoPlayer(videoUrl:tutor.video!),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: TutorDetailBody(tutor:tutor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
