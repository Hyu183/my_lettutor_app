import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BirthdayInput extends StatelessWidget {
  final Function(BuildContext) startDatePicker;
  final BuildContext ctx;
  final DateTime datetime;
  const BirthdayInput({
    Key? key,
    required this.startDatePicker,
    required this.ctx,
    required this.datetime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => startDatePicker(ctx),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Birthday',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 10,
              bottom: 20,
            ),
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 10,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: Colors.grey,
              ),
            ),
            child: Text(
              DateFormat('dd-MM-yyyy').format(datetime),
            ),
          ),
        ],
      ),
    );
  }
}
