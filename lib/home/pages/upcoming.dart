import 'package:flutter/material.dart';
import 'package:my_lettutor_app/home/upcoming/upcoming_class_card.dart';

import '../../models/temp/upcoming_data.dart';

class Upcoming extends StatelessWidget {
  const Upcoming({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Upcoming',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 20,
        ),
        child: ListView.builder(
          itemCount: upcomings.length,
          itemBuilder: (_, i) {
            return UpcomingClassCard(
              upcomingData: upcomings[i],
            );
          },
        ),
      ),
     
    );
  }
}
