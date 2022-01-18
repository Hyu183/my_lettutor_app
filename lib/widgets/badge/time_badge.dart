import 'package:flutter/material.dart';

class TimeBadge extends StatelessWidget {
  final int hour;
  final int minute;
  final Color textColor;
  final Color backgroundColor;
  const TimeBadge({
    Key? key,
    required this.hour,
    required this.minute,
    required this.textColor,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: backgroundColor,
        border: Border.all(color: textColor),
      ),
      child: Text(
        "${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}",
        style: TextStyle(
          color: textColor,
          fontSize: 10,
        ),
      ),
    );
  }
}
