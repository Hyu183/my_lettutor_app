import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:my_lettutor_app/models/user_schedule.dart';

// import 'package:my_lettutor_app/models/temp/session.dart';

class SessionTile extends StatelessWidget {
  final UserSchedule session;
  const SessionTile({
    Key? key,
    required this.session,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tutor = session.scheduleDetailInfo!.scheduleInfo!.tutorInfo!;
    final startTime = DateTime.fromMillisecondsSinceEpoch(
            session.scheduleDetailInfo!.startPeriodTimestamp!)
        .toLocal();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          width: 70,
          height: 60,
          child: CircleAvatar(
            radius: 30,
            backgroundImage: tutor.avatar !=
                    "https://www.alliancerehabmed.com/wp-content/uploads/icon-avatar-default.png"
                ? ResizeImage(
                    NetworkImage(
                      tutor.avatar!,
                    ),
                    height: 60,
                    width: 60,
                  )
                : const ResizeImage(
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
              tutor.name!,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Row(
              children: [
                const Icon(Icons.calendar_today_outlined, size: 17),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  DateFormat('HH:mm, dd/MM/yyyy').format(
                    startTime,
                  ),
                ),
              ],
            ),
            // Row(
            //   children: [
            //     const Icon(Icons.timer, size: 17),
            //     const SizedBox(
            //       width: 10,
            //     ),
            //     Text('4{session.length}'),
            //   ],
            // ),
            // Row(
            //   children: [
            //     const Icon(Icons.star_border_outlined, size: 17),
            //     const SizedBox(
            //       width: 10,
            //     ),
            //     Text(session.feedback),
            //   ],
            // ),
          ],
        ),
      ],
    );
  }
}
