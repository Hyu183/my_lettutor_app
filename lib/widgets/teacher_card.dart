import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:my_lettutor_app/models/teacher.dart';

class TeacherCard extends StatelessWidget {
  final Teacher teacher;

  const TeacherCard({required this.teacher});

  @override
  Widget build(BuildContext context) {
    Widget TeacherListTile = Row(
      children: [
        SizedBox(
          width: 60,
          child: CircleAvatar(
            child: Image.asset(
              'assets/images/user.png',
            ),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                teacher.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              //   Icon(Icons.star),
              RatingBar.builder(
                  itemSize: 20,
                  ignoreGestures: true,
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (ctx, _) {
                    return const Icon(Icons.star, color: Colors.orange);
                  },
                  onRatingUpdate: (rating) {}),
              Text(teacher.specialities[0]),
            ],
          ),
        ),
        IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border)),
      ],
    );
    return Card(
      elevation: 6,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TeacherListTile,
            const SizedBox(
              height: 5,
            ),
            Text(teacher.description),
          ],
        ),
      ),
    );
  }
}
