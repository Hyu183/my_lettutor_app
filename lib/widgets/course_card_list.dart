import 'package:flutter/material.dart';
import 'package:my_lettutor_app/models/course.dart';
import 'package:my_lettutor_app/widgets/course_card.dart';

class CourseCardList extends StatelessWidget {
  final List<Course> courses;
  const CourseCardList({
    Key? key,
    required this.courses,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //   width: 400,
      height: 300,
      padding: const EdgeInsets.all(4),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: courses.length,
        itemBuilder: (_, i) {
          return CourseCard(course: courses[i]);
        },
      ),
    );
  }
}
