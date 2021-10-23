import 'package:flutter/material.dart';

import 'package:my_lettutor_app/models/teacher.dart';
import 'package:my_lettutor_app/widgets/teacher_detail.dart';
import 'package:my_lettutor_app/widgets/teacher_list_tile.dart';

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
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(
            TeacherDetail.routeName,
            arguments: teacher,
          );
        },
        
        splashColor: Theme.of(context).splashColor,
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
                      teacher.description, overflow: TextOverflow.ellipsis,
                      maxLines: 4,
                      // teacher.description.length <= 172
                      //     ? teacher.description
                      //     : teacher.description.substring(0, 173) + '...',
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
