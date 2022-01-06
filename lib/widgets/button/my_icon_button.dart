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
          border: Border.all(
              color: Theme.of(context).textTheme.headline2!.color!, width: 2),
        ),
        child: Image.asset(
          imageURI,
          cacheHeight: 30,
          cacheWidth: 30,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
