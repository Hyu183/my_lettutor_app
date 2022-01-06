import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:my_lettutor_app/widgets/badge/time_badge.dart';

class ScheduleTile extends StatelessWidget {
  final String imageUrl = '';
  final String name;
  final DateTime date;
  final String startTime;
  final String endTime;
  const ScheduleTile({
    Key? key,
    required this.name,
    required this.date,
    required this.startTime,
    required this.endTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 70,
          height: 60,
          child: CircleAvatar(
            radius: 30,
            backgroundImage: ResizeImage(
              AssetImage(
                'assets/images/user.png',
              ),
              height: 60,
              width: 60,
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  DateFormat('dd-MM-yyyy').format(date),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                TimeBadge(
                  time: startTime,
                  textColor: Colors.blue,
                  backgroundColor: Colors.blue[100]!,
                ),
                const SizedBox(
                  width: 5,
                ),
                const Text('-'),
                const SizedBox(
                  width: 5,
                ),
                TimeBadge(
                  time: endTime,
                  textColor: Colors.red,
                  backgroundColor: Colors.red[50]!,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
