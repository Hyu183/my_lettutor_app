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
        const SizedBox(
          width: 70,
          height: 60,
          child: CircleAvatar(
            radius: 30,
            backgroundImage: ResizeImage(
              AssetImage(
                'assets/images/user.png',
              ),
              height: 60,
              width: 60,
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
