import 'dart:async';

import 'package:flutter/material.dart';

class TimerClockIncrease extends StatefulWidget {
  final int startTime;
  const TimerClockIncrease({
    Key? key,
    required this.startTime,
  }) : super(key: key);

  @override
  _TimerClockIncreaseState createState() => _TimerClockIncreaseState();
}

class _TimerClockIncreaseState extends State<TimerClockIncrease> {
  late Duration duration;
  final unit = 1;
  Timer? timer;
// late DateTime timeLearned;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    duration = DateTime.now().difference(
        DateTime.fromMillisecondsSinceEpoch(widget.startTime).toLocal());
    // duration = Duration(seconds: widget.);
    startTimer();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    if (timer != null) timer!.cancel();
    super.dispose();
  }

  void increaseTimer() {
    setState(() {
      final newVal = duration.inSeconds + unit;

      duration = Duration(seconds: newVal);
    });
  }

  void startTimer() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (_) => increaseTimer(),
    );
  }

  @override
  Widget build(BuildContext context) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    // final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return Text(
      '$minutes:$seconds',
      style: const TextStyle(
        color: Colors.white,
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
