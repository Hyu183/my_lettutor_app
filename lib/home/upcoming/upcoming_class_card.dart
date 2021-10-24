import 'package:flutter/material.dart';
import 'package:my_lettutor_app/widgets/button/group_button.dart';

import './schedule_tile.dart';
import '../../models/temp/upcoming_data.dart';

class UpcomingClassCard extends StatelessWidget {
  final UpcomingData upcomingData;
  const UpcomingClassCard({
    Key? key,
    required this.upcomingData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        elevation: 5,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ScheduleTile(
                name: upcomingData.name,
                date: upcomingData.date,
                startTime: upcomingData.startTime,
                endTime: upcomingData.endTime,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: GroupButton(
                textLeft: 'Cancel',
                textRight: 'Go to Meeting',
                colorBackgroudLeft: Colors.white,
                colorTextLeft: Colors.grey,
                colorTopBorder: Colors.grey ,
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
