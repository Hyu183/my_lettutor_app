import 'package:flutter/material.dart';

import './booking_modal_layout.dart';
import './time_grid.dart';
import '../../../widgets/button/large_button.dart';



class BookingModal extends StatelessWidget {
  BookingModal({Key? key}) : super(key: key);

  final List<String> _date = [
    '2021-10-23',
    '2021-10-24',
    '2021-10-23',
    '2021-10-25',
    '2021-10-26',
    '2021-10-27',
  ];

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
        itemCount: _date.length,
        itemBuilder: (_, index) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: LargeButton(
              text: _date[index],
              handler: () => _startTimeGrid(context),
            ),
          );
        },
      ),
    );
  }
}
