import 'package:flutter/material.dart';

import '../teacher_list/teacher/teacher_card.dart';
import '../../models/teacher.dart';
import '../../widgets/utils/search_bar.dart';
import '../../widgets/badge/my_badge_list.dart';

class Tutors extends StatefulWidget {
  static const routeName = '/tutors';
  const Tutors({Key? key}) : super(key: key);

  @override
  State<Tutors> createState() => _TutorsState();
}

class _TutorsState extends State<Tutors> {
  List<String> specialities = [
    'All',
    'English for kids',
    'English for Business',
    'Conversational',
    'STARTERS',
    'MOVERS',
    'FLYERS',
    'KET',
    'PET',
    'IELTS',
    'TOEFL',
    'TOEIC',
  ];

  @override
  Widget build(BuildContext context) {
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
                itemCount: teacherList.length,
                itemBuilder: (_, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: TeacherCard(
                      teacher: teacherList[index],
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
