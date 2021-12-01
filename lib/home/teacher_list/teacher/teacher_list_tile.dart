import 'package:flutter/material.dart';

import 'package:my_lettutor_app/home/teacher_list/teacher/teacher_tile_right_side.dart';

class TeacherListTile extends StatelessWidget {
  final String id = '';
  final String name;
  final double rating;
  final List<String> specialities;
  final String description;
  final String imageUrl = '';
  final int version;

  const TeacherListTile({
    Key? key,
    required this.name,
    required this.rating,
    required this.specialities,
    required this.description,
    required this.version,
  }) : super(key: key);

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
          child: TeacherTileRightSide(
            name: name,
            specialities: specialities,
            rating: 5,
            version: version,
          ),
        ),
      ],
    );
  }
}
