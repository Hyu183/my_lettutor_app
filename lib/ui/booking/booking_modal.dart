import 'package:flutter/material.dart';

import 'package:my_lettutor_app/ui/booking/booking_modal_layout.dart';
import 'package:my_lettutor_app/ui/booking/time_grid.dart';
import 'package:my_lettutor_app/widgets/button/large_button.dart';

import 'package:my_lettutor_app/data/data.dart';

class BookingModal extends StatelessWidget {
  BookingModal({Key? key}) : super(key: key);

  

  void _startTimeGrid(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        builder: (_) {
          return BookingModalLayout(
            child: TimeGrid(),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return BookingModalLayout(
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        itemCount: date.length,
        itemBuilder: (_, index) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: LargeButton(
              text: date[index],
              handler: () => _startTimeGrid(context),
            ),
          );
        },
      ),
    );
  }
}
