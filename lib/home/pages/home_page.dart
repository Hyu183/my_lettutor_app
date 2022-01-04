import 'package:flutter/material.dart';
import 'package:my_lettutor_app/providers/favorite_teachers.dart';
import 'package:provider/provider.dart';

import 'package:my_lettutor_app/home/pages/profile_page.dart';
import 'package:my_lettutor_app/home/teacher_list/teacher/teacher_card.dart';
import 'package:my_lettutor_app/providers/teachers.dart';

// import 'package:my_lettutor_app/data/data.dart';

class HomePage extends StatelessWidget {
  final void Function(int) navigatorFunc;
  const HomePage({
    Key? key,
    required this.navigatorFunc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final teachers = Provider.of<Teachers>(context).getTeachers();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Home',
          style: Theme.of(context).textTheme.headline1,
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(ProfilePage.routeName);
              },
              icon: const CircleAvatar(
                radius: 16,
                backgroundImage: ResizeImage(
                  AssetImage(
                    'assets/images/user.png',
                  ),
                  height: 32,
                  width: 32,
                ),
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              color: const Color(0xFF0A31C9),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Welcome to LetTutor!',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      navigatorFunc(3); //Navigate to Tutors page: index 3
                    },
                    child: const Text('Book a lesson',
                        style: TextStyle(color: Color(0xFF0E78EF))),
                    style: Theme.of(context)
                        .elevatedButtonTheme
                        .style!
                        .copyWith(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white)),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 4),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.grey, width: 2.0),
                      ),
                    ),
                    child: const Text('Recommended Tutors',
                        style: TextStyle(
                          fontSize: 16,
                        )),
                  ),
                  TextButton(
                    onPressed: () {
                      navigatorFunc(3); //Navigate to Tutors page: index 3
                    },
                    child: Row(
                      children: const [
                        Text('See all'),
                        Icon(Icons.arrow_forward_ios_rounded),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                children: teachers.map((teacher) {
                  return TeacherCard(
                    teacher: teacher,
                    version: 1,
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
