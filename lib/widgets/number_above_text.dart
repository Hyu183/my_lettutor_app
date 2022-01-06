import 'package:flutter/material.dart';

class NumberAboveText extends StatelessWidget {
  final int number;
  final String text;
  final Color color;
  const NumberAboveText({
    Key? key,
    required this.number,
    required this.text,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '$number',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: color,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 22,
            color: color,
          ),
        ),
      ],
    );
  }
}
