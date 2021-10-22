import 'package:flutter/material.dart';

class MyIconButton extends StatelessWidget {
  final String imageURI;
  const MyIconButton({
    Key? key,
    required this.imageURI,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 50,
        height: 50,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.blue, width: 2),
        ),
        child: Image.asset(
          imageURI,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
