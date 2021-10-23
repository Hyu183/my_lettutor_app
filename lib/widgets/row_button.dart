import 'package:flutter/material.dart';
import 'package:my_lettutor_app/widgets/icon_text_button.dart';

class RowButton extends StatelessWidget {
  const RowButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconTextButton(
          icon: Icons.message,
          text: 'Message',
          handler: () {},
        ),
        IconTextButton(
          icon: Icons.report,
          text: 'Report',
          handler: () {},
        ),
      ],
    );
  }
}
