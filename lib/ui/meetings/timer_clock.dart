import 'dart:async';

import 'package:flutter/material.dart';

class TimerClock extends StatefulWidget {
  final int remainderInSeconds;
  const TimerClock({
    Key? key,
    required this.remainderInSeconds,
  }) : super(key: key);

  @override
  _TimerClockState createState() => _TimerClockState();
}

class _TimerClockState extends State<TimerClock> {
  late Duration duration;
  final unit = 1;
  Timer? timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    duration = Duration(seconds: widget.remainderInSeconds);
    startTimer();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    if (timer != null) timer!.cancel();
    super.dispose();
  }

  void decreaseTimer() {
    setState(() {
      final newVal = duration.inSeconds - unit;
      if (newVal < 0) {
        timer!.cancel();
      } else {
        duration = Duration(seconds: newVal);
      }
    });
  }

  void startTimer() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (_) => decreaseTimer(),
    );
  }

  @override
  Widget build(BuildContext context) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return Text(
      '$hours:$minutes:$seconds',
      style: const TextStyle(
        color: Colors.white,
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
