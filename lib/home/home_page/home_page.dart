import 'package:flutter/material.dart';

import '../teacher_list/tutors.dart';
import '../../models/teacher.dart';
import '../../widgets/teacher_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Home',
          style: Theme.of(context).textTheme.headline1,
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: CircleAvatar(
                child: Image.asset(
                  'assets/images/user.png',
                  cacheHeight: 32,
                  cacheWidth: 32,
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
                    onPressed: () {},
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
                      Navigator.of(context)
                          .pushReplacementNamed(Tutors.routeName);
                    },
                    // style:
                    //     TextButton.styleFrom(primary: const Color(0xFF0E78EF)),
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
                children: teacherList.map((teacher) {
                  return TeacherCard(teacher: teacher);
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
