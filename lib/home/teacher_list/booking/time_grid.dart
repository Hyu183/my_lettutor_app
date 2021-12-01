import 'package:flutter/material.dart';

import 'package:my_lettutor_app/home/teacher_list/booking/time_slot.dart';

import 'package:my_lettutor_app/data/data.dart';
class TimeGrid extends StatelessWidget {
  TimeGrid({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15.0,
        vertical: 8,
      ),
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 5 / 1.5,
        children: timeList.map((timeItem) {
          return TimeSlot(
            isReserved: timeItem['isReserved'] as bool,
            startTime: timeItem['startTime'] as String,
            endTime: timeItem['endTime'] as String,
          );
        }).toList(),
      ),
    );
  }
}
