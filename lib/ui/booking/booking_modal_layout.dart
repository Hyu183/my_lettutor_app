import 'package:flutter/material.dart';

class BookingModalLayout extends StatelessWidget {
  final Widget child;
  const BookingModalLayout({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //   height: MediaQuery.of(context).size.height * 0.8,
      child: Column(
        children: [
          const Center(
            heightFactor: 2,
            child: Text(
              'Pick your time!',
              style: TextStyle(
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
