import 'package:flutter/material.dart';
import 'package:my_lettutor_app/models/tutor.dart';

import 'package:my_lettutor_app/ui/tutor/tutor_detail_body.dart';
import 'package:my_lettutor_app/ui/tutor/tutor_detail_tile.dart';

import 'package:my_lettutor_app/widgets/video/video_player.dart';


class TutorDetail extends StatelessWidget {
  static const routeName = '/tutor-detail';
  final Tutor tutor;
  const TutorDetail({
    Key? key,
    required this.tutor,
  }) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                MyVideoPlayer(videoUrl: tutor.video!),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: TutorDetailBody(tutor: tutor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
