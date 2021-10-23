import 'package:flutter/material.dart';

class ActiveStatusAvatar extends StatelessWidget {
  final bool isActive;
  final String imageUrl = '';
  const ActiveStatusAvatar({
    Key? key,
    required this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: 70,
          height: 60,
          child: CircleAvatar(
            radius: 30,
            child: Image.asset(
              'assets/images/user.png',
              cacheHeight: 60,
              cacheWidth: 60,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 4,
          child: Container(
            width: 17,
            height: 17,
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: isActive ? Colors.green : Colors.red,
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
