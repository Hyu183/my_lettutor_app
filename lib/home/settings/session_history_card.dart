import 'package:flutter/material.dart';

import './session_tile.dart';
import '../../models/temp/session.dart';
import '../../widgets/button/group_button.dart';

class SessionHistoryCard extends StatelessWidget {
  final Session session;
  const SessionHistoryCard({
    Key? key,
    required this.session,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      elevation: 5,
      child: SizedBox(
        width: double.infinity,
        height: 170,
        child: Column(
          children: [
            Flexible(
              flex: 2,
              child: SessionTile(session: session),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(20.0),
            //   child: SessionTile(session: session),
            // ),
            // const SizedBox(height: 10),
            Flexible(
              flex: 1,
              child: GroupButton(
                textLeft: 'Give Feedback',
                textRight: 'See Tutor Details',
                colorBackgroudLeft: Colors.blue,
                colorTextLeft: Colors.white,
                colorTopBorder: Colors.blue,
                handlerLeft: () {},
                handlerRight: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
