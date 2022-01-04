import 'package:flutter/material.dart';

// import 'package:my_lettutor_app/home/teacher_list/teacher/teacher_tile_right_side.dart';

import 'package:my_lettutor_app/models/teacher.dart';
import 'package:my_lettutor_app/widgets/badge/my_badge_list.dart';
import 'package:my_lettutor_app/widgets/utils/my_rating_bar.dart';

class TeacherListTile extends StatelessWidget {
  final Teacher teacher;
  final int version;

  const TeacherListTile({
    Key? key,
    required this.teacher,
    required this.version,
  }) : super(key: key);

  void _onFavoriteHandler() {}

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 70,
          height: 60,
          child: CircleAvatar(
            radius: 30,
            backgroundImage: ResizeImage(
              AssetImage(
                'assets/images/user.png',
              ),
              height: 60,
              width: 60,
            ),
          ),
        ),
        Expanded(
            child: version == 1
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
                                teacher.name,
                                style: const TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              MyRatingBar(
                                rating: teacher.rating,
                                padding: 2,
                                ignoreGestures: true,
                                size: 20,
                              ),
                            ],
                          ),
                          teacher.isFavorite == true
                              ? IconButton(
                                  onPressed: _onFavoriteHandler,
                                  icon: const Icon(
                                    Icons.favorite,
                                    color: Colors.pink,
                                    size: 30,
                                  ))
                              : IconButton(
                                  onPressed: _onFavoriteHandler,
                                  icon: const Icon(
                                    Icons.favorite_border,
                                    color: Color(0xFF0071F0),
                                    size: 30,
                                  )),
                        ],
                      ),
                      MyBadgeList(
                        myList: teacher.specialities,
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
                              teacher.name,
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Text(
                            teacher.rating.toStringAsFixed(2),
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
                            child: teacher.isFavorite == true
                                ? IconButton(
                                    splashColor: null,
                                    padding: const EdgeInsets.all(0),
                                    onPressed: _onFavoriteHandler,
                                    icon: const Icon(
                                      Icons.favorite,
                                      color: Colors.pink,
                                      size: 30,
                                    ))
                                : IconButton(
                                    splashColor: null,
                                    padding: const EdgeInsets.all(0),
                                    onPressed: _onFavoriteHandler,
                                    icon: const Icon(
                                      Icons.favorite_border,
                                      color: Color(0xFF0071F0),
                                      size: 30,
                                    )),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      MyBadgeList(
                        myList: teacher.specialities,
                        readOnly: true,
                      ),
                    ],
                  )),
      ],
    );
  }
}
