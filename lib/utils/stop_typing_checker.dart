import 'dart:async';

import 'package:flutter/material.dart';

class StopTypingChecker {
  final int milliseconds;

  Timer? _timer;

  StopTypingChecker({required this.milliseconds});

  void run(VoidCallback callback) {
    _timer?.cancel();

    _timer = Timer(Duration(milliseconds: milliseconds), callback);
  }
}
