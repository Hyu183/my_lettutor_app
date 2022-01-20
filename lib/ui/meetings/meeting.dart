import 'package:flutter/material.dart';
import 'package:my_lettutor_app/models/user_schedule.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_lettutor_app/ui/meetings/timer_clock_decrease.dart';
import 'package:my_lettutor_app/ui/meetings/timer_clock_increase.dart';

class Meeting extends StatelessWidget {
  static const routeName = '/meeting';
  final UserSchedule userSchedule;
  const Meeting({Key? key, required this.userSchedule}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var remainTime = DateTime.fromMillisecondsSinceEpoch(
            userSchedule.scheduleDetailInfo!.startPeriodTimestamp!)
        .toLocal()
        .difference(DateTime.now())
        .inSeconds;
    remainTime = remainTime > 0 ? remainTime : 0;

     final translator = AppLocalizations.of(context)!;

    return Scaffold(
      body: Stack(
        alignment: remainTime == 0 ? Alignment.topLeft : Alignment.center,
        children: [
          const SizedBox(height: double.infinity, width: double.infinity),
          remainTime == 0
              ? Container(
                  width: 50,
                  height: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.black38,
                  ),
                  margin: const EdgeInsets.only(top: 40, left: 20),
                  child: Center(
                    child: TimerClockIncrease(
                      startTime: userSchedule
                          .scheduleDetailInfo!.startPeriodTimestamp!,
                    ),
                  ),
                )
              : Container(
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
                      children: [
                         Text(
                          translator.lessonWillStart,
                          style:const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        TimerClockDescrease(remainderInSeconds: remainTime),
                      ],
                    ),
                  )),
        ],
      ),
    );
  }
}
