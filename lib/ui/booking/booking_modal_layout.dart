import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BookingModalLayout extends StatelessWidget {
  final Widget child;
  const BookingModalLayout({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final translator = AppLocalizations.of(context)!;
    return SizedBox(
      //   height: MediaQuery.of(context).size.height * 0.8,
      child: Column(
        children: [
          Center(
            heightFactor: 2,
            child: Text(
              translator.pickYourTime,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Divider(),
          Expanded(
            child: child,
          ),
        ],
      ),
    );
  }
}
