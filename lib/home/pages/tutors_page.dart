import 'package:flutter/material.dart';
import 'package:my_lettutor_app/providers/favorite_teachers.dart';
import 'package:my_lettutor_app/providers/teachers.dart';
import 'package:provider/provider.dart';

import 'package:my_lettutor_app/home/teacher_list/teacher/teacher_card.dart';
import 'package:my_lettutor_app/widgets/badge/my_badge_list.dart';
import 'package:my_lettutor_app/widgets/utils/search_bar.dart';

import 'package:my_lettutor_app/data/data.dart' show specialities;

class TutorsPage extends StatefulWidget {
  static const routeName = '/tutors';
  const TutorsPage({Key? key}) : super(key: key);

  @override
  State<TutorsPage> createState() => _TutorsPageState();
}

class _TutorsPageState extends State<TutorsPage> {
  @override
  Widget build(BuildContext context) {

    final teachers = Provider.of<Teachers>(context).getTeachers();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Tutors',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            const SearchBar(
              text: 'Search Tutor',
            ),
            const SizedBox(
              height: 10,
            ),
            MyBadgeList(
              myList: specialities,
              readOnly: false,
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: teachers.length,
                itemBuilder: (_, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: TeacherCard(
                      key: ValueKey(teachers[index].id),
                      teacher: teachers[index],
                      version: 2,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
