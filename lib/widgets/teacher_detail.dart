import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_lettutor_app/widgets/teacher_detail_body.dart';
// import 'package:my_lettutor_app/widgets/teacher_detail_tile.dart';

import '../../models/teacher.dart';

class TeacherDetail extends StatelessWidget {
  static const routeName = '/teacher-detail';
  final Teacher teacher;
  const TeacherDetail({
    Key? key,
    required this.teacher,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 250,
                  color: Colors.blue,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: TeacherDetailBody(teacher: teacher),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
