import 'package:flutter/material.dart';

class SpecialityBadge extends StatelessWidget {
  final String speciality;
  const SpecialityBadge({Key? key, required this.speciality}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      margin: const EdgeInsets.symmetric(horizontal: 2),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: const Color(0xFFDBE9FF),
          border: Border.all(color: const Color(0xffc4d7f5), width: 1),
          borderRadius: const BorderRadius.all(Radius.circular(20.0))),
      child: Text(
        speciality,
        style: const TextStyle(color: Color(0xFF0071F0)),
      ),
    );
  }
}
