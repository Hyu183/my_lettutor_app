import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:my_lettutor_app/widgets/speciality_badge_list.dart';
import 'package:my_lettutor_app/widgets/teacher_tile_right_side.dart';

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
        SizedBox(
          width: 70,
          height: 60,
          child: CircleAvatar(
            // radius: 30,
            child: Image.asset(
              'assets/images/user.png',
              //   width: 30,
              //   height: 30,
              cacheHeight: 60,
              cacheWidth: 60,
              fit: BoxFit.cover,
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
