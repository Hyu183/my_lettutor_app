import 'package:flutter/material.dart';
import 'package:my_lettutor_app/widgets/search_bar.dart';
import 'package:my_lettutor_app/widgets/speciality_badge_list.dart';

class Tutors extends StatelessWidget {
  static const routeName = '/tutors';
  Tutors({Key? key}) : super(key: key);

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
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SearchBar(),
            SpecialityBadgeList(specialityList: specialities),
          ],
        ),
      ),
      //   body: SizedBox(
      //     width: 500,
      //     child: Column(
      //       children: [
      //         SizedBox(
      //           width: 300,
      //           child: Row(
      //             children: [
      //               const Icon(Icons.search),
      //               TextField(
      //                 decoration:
      //                     InputDecoration(hintText: 'Enter a search term'),
      //               ),
      //             ],
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
    );
  }
}
