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
              color: Theme.of(context).textTheme.headline2!.color!,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              text,
              style: TextStyle(
                color: Theme.of(context).textTheme.headline2!.color!,
              ),
            )
          ],
        ),
      ),
    );
  }
}
