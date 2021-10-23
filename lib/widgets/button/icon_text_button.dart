import 'package:flutter/material.dart';

class IconTextButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback handler;
  const IconTextButton({
    Key? key,
    required this.icon,
    required this.text,
    required this.handler,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: handler,
      customBorder: const CircleBorder(),
      excludeFromSemantics: true,
      splashColor: Theme.of(context).splashColor,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Icon(
              icon,
              color: const Color(0XFF0071F0),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              text,
              style: const TextStyle(
                color: Color(0XFF0071F0),
              ),
            )
          ],
        ),
      ),
    );
  }
}
