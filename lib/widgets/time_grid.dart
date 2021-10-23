import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_lettutor_app/widgets/time_slot.dart';

class TimeGrid extends StatelessWidget {
  TimeGrid({Key? key}) : super(key: key);
  final List<Map<String, Object>> timeList = [
    {
      'startTime': '19:30',
      'endTime': '19:55',
      'isReserved': true,
    },
    {
      'startTime': '19:30',
      'endTime': '19:55',
      'isReserved': false,
    },
    {
      'startTime': '20:30',
      'endTime': '20:55',
      'isReserved': true,
    },
    {
      'startTime': '20:30',
      'endTime': '20:55',
      'isReserved': false,
    },
    {
      'startTime': '21:30',
      'endTime': '21:55',
      'isReserved': false,
    },
  ];
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
