import 'package:flutter/material.dart';

import 'package:my_lettutor_app/home/course/course_detail_body.dart';
import 'package:my_lettutor_app/widgets/utils/number_above_text.dart';

import 'package:my_lettutor_app/models/course.dart';




class CourseDetail extends StatelessWidget {
  static const routeName = '/course-detail';
  final Course course;
  const CourseDetail({
    Key? key,
    required this.course,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 300,
                child: Stack(
                  children: [
                    Container(
                      height: 250,
                      color: Colors.blue,
                    ),
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: SizedBox(
                          height: 100,
                          width: 250,
                          child: Card(
                            elevation: 6,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 50,
                                vertical: 10,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  NumberAboveText(
                                    number: course.topics.length,
                                    text: 'topics',
                                    color: Colors.blue,
                                  ),
                                  const NumberAboveText(
                                    number: 1,
                                    text: 'tutors',
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: CourseDetailBody(course: course),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
