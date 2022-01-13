import 'package:flutter/material.dart';

import 'package:my_lettutor_app/ui/course/course_detail_part.dart';
import 'package:my_lettutor_app/ui/course/topic_card.dart';

import 'package:my_lettutor_app/models/temp/course.dart';

class CourseDetailBody extends StatelessWidget {
  final Course course;
  const CourseDetailBody({
    Key? key,
    required this.course,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CourseDetailPart(
            title: 'About Course',
            child: Text(
              course.description,
              style: Theme.of(context).textTheme.subtitle1,
            ),
            hasPadding: false),
        CourseDetailPart(
          title: 'Overview',
          child: Column(
            children: [
              Row(
                children: const [
                  Icon(Icons.info),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Why you should learn this course?',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                course.overviews[0],
                style: Theme.of(context).textTheme.subtitle1,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: const [
                  Icon(Icons.info),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'What will you be able to do?',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                course.overviews[1],
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ],
          ),
          hasPadding: false,
        ),
        CourseDetailPart(
          title: 'Experience Level',
          child: Text(
            course.level,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          hasPadding: false,
        ),
        CourseDetailPart(
          title: 'Topic',
          child: Column(
            children: course.topics
                .map(
                  (topic) => TopicCard(
                    number: course.topics.indexOf(topic) + 1,
                    text: topic,
                  ),
                )
                .toList(),
          ),
          hasPadding: true,
        ),
      ],
    );
  }
}
