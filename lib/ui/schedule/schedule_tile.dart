import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_lettutor_app/models/user_schedule_detail_info.dart';

import 'package:my_lettutor_app/widgets/badge/time_badge.dart';

class ScheduleTile extends StatelessWidget {

  final UserScheduleDetailInfo scheduleDetailInfo;
  const ScheduleTile({
    Key? key,
    required this.scheduleDetailInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DateTime startTime = DateTime.fromMillisecondsSinceEpoch(
            scheduleDetailInfo.startPeriodTimestamp!)
        .toLocal();
    final DateTime endTime = DateTime.fromMillisecondsSinceEpoch(
            scheduleDetailInfo.endPeriodTimestamp!)
        .toLocal();

    return Row(
      children: [
        SizedBox(
          width: 70,
          height: 60,
          child: CircleAvatar(
            radius: 30,
            backgroundImage: ResizeImage(
              NetworkImage(scheduleDetailInfo.scheduleInfo!.tutorInfo!.avatar!),
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
              scheduleDetailInfo.scheduleInfo!.tutorInfo!.name!,
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
                  DateFormat('EEE, dd-MM-yyyy').format(startTime),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                TimeBadge(
                  hour: startTime.hour,
                  minute: startTime.minute,
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
                  hour: endTime.hour,
                  minute: endTime.minute,
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
