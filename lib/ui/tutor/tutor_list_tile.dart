import 'package:flutter/material.dart';
import 'package:my_lettutor_app/data/network/dio_client.dart';

// import 'package:my_lettutor_app/home/teacher_list/teacher/teacher_tile_right_side.dart';

import 'package:my_lettutor_app/models/tutor.dart';
import 'package:my_lettutor_app/providers/auth_provider.dart';
import 'package:my_lettutor_app/utils/utils.dart';
import 'package:my_lettutor_app/widgets/badge/my_badge_list.dart';
import 'package:my_lettutor_app/widgets/my_rating_bar.dart';
import 'package:provider/src/provider.dart';

class TutorListTile extends StatefulWidget {
  final Tutor tutor;
  final int version;

  const TutorListTile({
    Key? key,
    required this.tutor,
    required this.version,
  }) : super(key: key);

  @override
  State<TutorListTile> createState() => _TutorListTileState();
}

class _TutorListTileState extends State<TutorListTile> {
  late bool isFavorite;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isFavorite = widget.tutor.isFavorite!;
  }

  void _onFavoriteHandler(String accessToken) async {
    var dio = DioClient.dio;
    try {
      dio.options.headers["Authorization"] = "Bearer $accessToken";
      var res = await dio.post('/user/manageFavoriteTutor',
          data: {"tutorId": widget.tutor.userId});
      setState(() {
        isFavorite = !isFavorite;
      });
    } catch (e) {
      print("Something went wrong");
    }
  }

  @override
  Widget build(BuildContext context) {
    final accessToken =
        context.read<AuthProvider>().userToken.tokens!.access!.token!;
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 5),
          child: CircleAvatar(
            radius: 30,
            backgroundImage: ResizeImage(
              NetworkImage(widget.tutor.user!.avatar!),
              height: 70,
              width: 70,
            ),
          ),
        ),
        Expanded(
            child: widget.version == 1
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.tutor.user!.name!,
                                style: const TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              MyRatingBar(
                                rating: widget
                                    .tutor.avgRating!, // tutor.avgRating!,
                                padding: 2,
                                ignoreGestures: true,
                                size: 20,
                              ),
                            ],
                          ),
                          isFavorite
                              ? IconButton(
                                  onPressed: () =>
                                      _onFavoriteHandler(accessToken),
                                  icon: Icon(
                                    Icons.favorite,
                                    color: Theme.of(context)
                                        .textTheme
                                        .headline2!
                                        .color!,
                                    size: 30,
                                  ))
                              : IconButton(
                                  onPressed: () =>
                                      _onFavoriteHandler(accessToken),
                                  icon: Icon(
                                    Icons.favorite_border,
                                    color: Theme.of(context)
                                        .textTheme
                                        .headline2!
                                        .color!,
                                    size: 30,
                                  )),
                        ],
                      ),
                      MyBadgeList(
                        myList:
                            Utils.parseSpecialties(widget.tutor.specialties!),
                        readOnly: true,
                      ),
                    ],
                  )
                : Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              widget.tutor.user!.name!,
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Text(
                            widget.tutor.avgRating!.toStringAsFixed(1),
                            style: TextStyle(
                              color: Colors.red[400],
                              fontSize: 18,
                            ),
                          ),
                          Image.asset(
                            'assets/images/star.png',
                            cacheHeight: 20,
                            cacheWidth: 20,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          SizedBox(
                            height: 30,
                            width: 30,
                            child: isFavorite
                                ? IconButton(
                                    splashColor: null,
                                    padding: const EdgeInsets.all(0),
                                    onPressed: () =>
                                        _onFavoriteHandler(accessToken),
                                    icon: Icon(
                                      Icons.favorite,
                                      color: Theme.of(context)
                                          .textTheme
                                          .headline2!
                                          .color!,
                                      size: 30,
                                    ))
                                : IconButton(
                                    splashColor: null,
                                    padding: const EdgeInsets.all(0),
                                    onPressed: () =>
                                        _onFavoriteHandler(accessToken),
                                    icon: Icon(
                                      Icons.favorite_border,
                                      color: Theme.of(context)
                                          .textTheme
                                          .headline2!
                                          .color!,
                                      size: 30,
                                    )),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      MyBadgeList(
                        myList:
                            Utils.parseSpecialties(widget.tutor.specialties!),
                        readOnly: true,
                      ),
                    ],
                  )),
      ],
    );
  }
}
