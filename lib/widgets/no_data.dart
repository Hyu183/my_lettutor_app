import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NoData extends StatelessWidget {
 
  const NoData({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final translator = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/empty.png',
          cacheHeight: 60,
          cacheWidth: 60,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          translator.noDataText,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        )
      ],
    );
  }
}
