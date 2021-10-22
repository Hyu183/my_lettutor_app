import 'package:flutter/material.dart';

import 'package:my_lettutor_app/models/teacher.dart';
import 'package:my_lettutor_app/widgets/teacher_list_tile.dart';

class TeacherCard extends StatelessWidget {
  final Teacher teacher;

  const TeacherCard({required this.teacher});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Card(
        elevation: 6,
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TeacherListTile(
                name: teacher.name,
                rating: teacher.rating,
                specialities: teacher.specialities,
                description: teacher.description,
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(teacher.description),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
