import 'package:flutter/material.dart';

import '../../../widgets/badge/my_badge_list.dart';
import '../../../widgets/utils/my_rating_bar.dart';

class TeacherTileRightSide extends StatelessWidget {
  final String name;
  final List<String> specialities;
  final double rating;
  final int version; //1 homepage - 2 tutors
  const TeacherTileRightSide({
    Key? key,
    required this.name,
    required this.specialities,
    required this.version,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return version == 1
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
                        name,
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      MyRatingBar(
                        rating: rating,
                        padding: 2,
                        ignoreGestures: true,
                        size: 20,
                      ),
                    ],
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite_border,
                        color: Color(0xFF0071F0),
                        size: 30,
                      )),
                ],
              ),
              MyBadgeList(
                myList: specialities,
                readOnly: true,
              ),
            ],
          )
        : Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      name,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Text(
                    rating.toStringAsFixed(2),
                    style: TextStyle(
                      color: Colors.red[400],
                      fontSize: 18,
                    ),
                  ),
                  Image.asset(
                    'assets/images/star.png',
                    cacheHeight: 50,
                    cacheWidth: 50,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
              MyBadgeList(
                myList: specialities,
                readOnly: true,
              ),
            ],
          );
  }
}
