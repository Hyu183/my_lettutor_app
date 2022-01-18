import 'package:flutter/material.dart';
import 'package:my_lettutor_app/models/user_schedule.dart';

import 'package:my_lettutor_app/ui/meetings/timer_clock.dart';

class Meeting extends StatelessWidget {
    static const  routeName = '/meeting';
  final UserSchedule userSchedule;
  const Meeting({Key? key, required this.userSchedule}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          const SizedBox(height: double.infinity, width: double.infinity),
          Container(
              width: 260,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.black38,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    Text(
                      'Lesson will be started after',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    TimerClock(remainderInSeconds: 3605),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
