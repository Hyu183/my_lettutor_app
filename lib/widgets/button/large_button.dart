import 'package:flutter/material.dart';

class LargeButton extends StatelessWidget {
  final String text;
  final VoidCallback handler;
  const LargeButton({
    Key? key,
    required this.text,
    required this.handler,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: handler,
      child: Text(text),
      style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
            minimumSize: MaterialStateProperty.all(
              const Size(double.infinity, 50),
            ),
            textStyle: MaterialStateProperty.all(
              const TextStyle(
                fontSize: 18,
              ),
            ),
          ),
    );
  }
}
