import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:my_lettutor_app/ui/settings/booking_history_card.dart';

import 'package:my_lettutor_app/data/data.dart';

class BookingHistory extends StatelessWidget {
  static const routeName = 'booking-history';
  const BookingHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title:  Text(
          AppLocalizations.of(context)!.bookingHistoryTitle,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: upcomings.map((e) => BookingHistoryCard(data: e)).toList(),
        ),
      ),
    );
  }
}
