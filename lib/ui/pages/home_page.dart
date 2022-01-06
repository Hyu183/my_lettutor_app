import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:my_lettutor_app/providers/favorite_teachers.dart';
import 'package:provider/provider.dart';

import 'package:my_lettutor_app/ui/pages/profile_page.dart';
import 'package:my_lettutor_app/ui/teacher/teacher_card.dart';
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
          AppLocalizations.of(context)!.homeTitle,
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
              width: double.infinity, //const Color(0xFF0A31C9)
              color: Theme.of(context)
                  .textTheme
                  .headline2!
                  .color!
                  .withOpacity(0.9),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                   Text(
                    AppLocalizations.of(context)!.welcomeText,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      navigatorFunc(3); //Navigate to Tutors page: index 3
                    },
                    child: Text(AppLocalizations.of(context)!.bookLessonBtn, //Color(0xFF0E78EF)
                        style: TextStyle(
                            color:
                                Theme.of(context).textTheme.headline2!.color!)),
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
                    child:  Text(AppLocalizations.of(context)!.recommendedTutors,
                        style: TextStyle(
                          fontSize: 16,
                        )),
                  ),
                  TextButton(
                    onPressed: () {
                      navigatorFunc(3); //Navigate to Tutors page: index 3
                    },
                    child: Row(
                      children:  [
                        Text(AppLocalizations.of(context)!.seeAllLink),
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
