import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_lettutor_app/ui/upcoming/upcoming_class_card.dart';

import 'package:my_lettutor_app/data/data.dart';


class UpcomingPage extends StatelessWidget {
  const UpcomingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title:  Text(
          AppLocalizations.of(context)!.upcomingTitle,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 20,
        ),
        child: ListView.builder(
          itemCount: upcomings.length,
          itemBuilder: (_, i) {
            return UpcomingClassCard(
              upcomingData: upcomings[i],
            );
          },
        ),
      ),
     
    );
  }
}
