import 'package:flutter/material.dart';

class NoData extends StatelessWidget {
  const NoData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Image.asset(
            'assets/images/empty.png',
            cacheHeight: 60,
            cacheWidth: 60,
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'No Data',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          )
        ],
      ),
    );
  }
}
