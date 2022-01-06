import 'package:flutter/material.dart';

import 'package:my_lettutor_app/ui/upcoming/schedule_tile.dart';

import 'package:my_lettutor_app/models/temp/upcoming.dart';
class BookingHistoryCard extends StatelessWidget {
  final Upcoming data;
  const BookingHistoryCard({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: ScheduleTile(
            name: data.name,
            date: data.date,
            startTime: data.startTime,
            endTime: data.endTime),
      ),
    );
  }
}
