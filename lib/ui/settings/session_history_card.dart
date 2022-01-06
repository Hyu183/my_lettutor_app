import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:my_lettutor_app/ui/settings/session_tile.dart';
import 'package:my_lettutor_app/widgets/button/group_button.dart';

import 'package:my_lettutor_app/models/temp/session.dart';

class SessionHistoryCard extends StatelessWidget {
  final Session session;
  const SessionHistoryCard({
    Key? key,
    required this.session,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      elevation: 5,
      child: SizedBox(
        width: double.infinity,
        height: 170,
        child: Column(
          children: [
            Flexible(
              flex: 2,
              child: SessionTile(session: session),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(20.0),
            //   child: SessionTile(session: session),
            // ),
            // const SizedBox(height: 10),
            Flexible(
              flex: 1,
              child: GroupButton(
                textLeft: AppLocalizations.of(context)!.giveFeedbackBtn,
                textRight: AppLocalizations.of(context)!.seeTutorDetailsBtn,
                colorBackgroudLeft:
                    Theme.of(context).textTheme.headline2!.color!,
                colorTextLeft: Colors.white,
                colorTopBorder: Theme.of(context).textTheme.headline2!.color!,
                handlerLeft: () {},
                handlerRight: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
