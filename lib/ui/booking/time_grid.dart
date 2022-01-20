import 'package:flutter/material.dart';
import 'package:my_lettutor_app/models/schedule.dart';

import 'package:my_lettutor_app/ui/booking/time_slot.dart';



class TimeGrid extends StatelessWidget {
  final List<Schedule> schedules;
  const TimeGrid({Key? key, required this.schedules}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    schedules.sort((a, b) => a.startTimestamp!.compareTo(b.startTimestamp!));
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
        children: schedules.map((schedule) {
          return TimeSlot(
              key: ValueKey(schedule.createdAt),
            schedule: schedule,
          );
        }).toList(),
      ),
    );
  }
}
