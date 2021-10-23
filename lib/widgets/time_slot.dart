import 'package:flutter/material.dart';

class TimeSlot extends StatelessWidget {
  final bool isReserved;
  final String startTime;
  final String endTime;
  const TimeSlot({
    Key? key,
    required this.isReserved,
    required this.startTime,
    required this.endTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isReserved
        ? ElevatedButton(
            onPressed: null,
            child: const Text(
              'Reserved',
            ),
            style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all(
                    Colors.grey[400],
                  ),
                  foregroundColor: MaterialStateProperty.all(
                    Colors.white70,
                  ),
                ),
          )
        : OutlinedButton(
            onPressed: () {},
            child: Text(
              startTime + ' - ' + endTime,
            ),
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              primary: Colors.blue,
              side: const BorderSide(color: Colors.blue),
            ),
          );
  }
}
