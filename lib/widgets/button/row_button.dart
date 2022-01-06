import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:my_lettutor_app/widgets/button/icon_text_button.dart';

class RowButton extends StatelessWidget {
  const RowButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconTextButton(
          icon: Icons.message,
          text: AppLocalizations.of(context)!.messageTextBtn,
          handler: () {},
        ),
        IconTextButton(
          icon: Icons.report,
          text: AppLocalizations.of(context)!.reportTextBtn,
          handler: () {},
        ),
      ],
    );
  }
}
