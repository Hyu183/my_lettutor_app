import 'package:flutter/material.dart';

class TimeBadge extends StatelessWidget {
  final String time;
  final Color textColor;
  final Color backgroundColor;
  const TimeBadge({
    Key? key,
    required this.time,
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
        time,
        style: TextStyle(
          color: textColor,
          fontSize: 10,
        ),
      ),
    );
  }
}
