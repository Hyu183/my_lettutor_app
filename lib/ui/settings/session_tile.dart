import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import 'package:my_lettutor_app/models/temp/session.dart';



class SessionTile extends StatelessWidget {
  final Session session;
  const SessionTile({
    Key? key,
    required this.session,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
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
              session.name,
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
                  DateFormat('HH:mm:ss, dd/MM/yyyy').format(session.date),
                ),
              ],
            ),
            Row(
              children: [
                const Icon(Icons.timer, size: 17),
                const SizedBox(
                  width: 10,
                ),
                Text(session.length),
              ],
            ),
            Row(
              children: [
                const Icon(Icons.star_border_outlined, size: 17),
                const SizedBox(
                  width: 10,
                ),
                Text(session.feedback),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
