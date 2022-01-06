import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:my_lettutor_app/providers/favorite_teachers.dart';
import 'package:my_lettutor_app/providers/teachers.dart';
import 'package:my_lettutor_app/widgets/badge/my_badge.dart';
import 'package:provider/provider.dart';

import 'package:my_lettutor_app/ui/teacher/teacher_card.dart';
// import 'package:my_lettutor_app/widgets/badge/my_badge_list.dart';
// import 'package:my_lettutor_app/widgets/search_bar.dart';

import 'package:my_lettutor_app/data/data.dart' show specialities;

class TutorsPage extends StatefulWidget {
  static const routeName = '/tutors';
  const TutorsPage({Key? key}) : super(key: key);

  @override
  State<TutorsPage> createState() => _TutorsPageState();
}

class _TutorsPageState extends State<TutorsPage> {
  var _selectedSpecialityIndex = 0;

  void _onTapSpecialityHandler(int index) {
    setState(() {
      _selectedSpecialityIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final teachers = Provider.of<Teachers>(context).getTeachers();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title:  Text(
          AppLocalizations.of(context)!.tutorsTitle,
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
            Container(
              margin: const EdgeInsets.only(top: 8),
              child: CupertinoSearchTextField(
                placeholder: AppLocalizations.of(context)!.searchTutorPlaceholder,
                backgroundColor: Colors.grey[200],
                onChanged: (value) {},
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            // MyBadgeList(
            //   myList: specialities,
            //   readOnly: false,
            // ),
            Container(
              height: 30,
              margin: const EdgeInsets.symmetric(vertical: 5),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: specialities.length,
                itemBuilder: (_, index) {
                  return MyBadge(
                    data: specialities[index],
                    isSelected: _selectedSpecialityIndex == index,
                    index: index,
                    onTapHandler: _onTapSpecialityHandler,
                  );
                },
              ),
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
