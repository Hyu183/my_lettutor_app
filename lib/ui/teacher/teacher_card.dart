import 'package:flutter/material.dart';

import 'package:my_lettutor_app/ui/teacher/teacher_detail.dart';
import 'package:my_lettutor_app/ui/teacher/teacher_list_tile.dart';

import 'package:my_lettutor_app/models/temp/teacher.dart';

class TeacherCard extends StatelessWidget {
  final Teacher teacher;
  final int version;
  const TeacherCard({
    Key? key,
    required this.teacher,
    required this.version,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Card(
        elevation: 6,
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(
              TeacherDetail.routeName,
              arguments: teacher,
            );
          },
          splashColor: Theme.of(context).splashColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TeacherListTile(
                  teacher: teacher,
                  version: version,
                ),
                SizedBox(
                  height: version == 1 ? 5 : 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      teacher.description,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 4,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
