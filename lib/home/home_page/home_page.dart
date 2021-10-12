import 'package:flutter/material.dart';

import 'package:my_lettutor_app/models/teacher.dart';
import 'package:my_lettutor_app/widgets/teacher_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Home',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: CircleAvatar(
                child: Image.asset('assets/images/user.png'),
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
              //   alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Welcome to LetTutor!',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Book a lesson'),
                    ),
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
                  const Text('Recommended Tutors',
                      style: TextStyle(fontSize: 20)),
                  TextButton(
                    onPressed: () {},
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
