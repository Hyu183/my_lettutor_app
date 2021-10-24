import 'package:flutter/material.dart';

import './timer_clock.dart';

class Meetings extends StatelessWidget {
  const Meetings({Key? key}) : super(key: key);

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
