import 'package:flutter/material.dart';

class MyBadge extends StatelessWidget {
  final String data;
  final bool isSelected;
  const MyBadge({
    Key? key,
    required this.data,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 20,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        margin: const EdgeInsets.symmetric(horizontal: 2),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: isSelected ? const Color(0xFFDBE9FF) : Colors.grey[300],
            border: Border.all(
                color: isSelected ? const Color(0xffc4d7f5) : Colors.white,
                width: 1),
            borderRadius: const BorderRadius.all(Radius.circular(20.0))),
        child: Text(
          data,
          style: TextStyle(
              color: isSelected ? const Color(0xFF0071F0) : Colors.grey),
        ),
      ),
    );
  }
}
