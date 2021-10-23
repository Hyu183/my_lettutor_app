import 'package:flutter/material.dart';

import './my_badge.dart';

class MyBadgeList extends StatelessWidget {
  final List<String> myList;
  final bool readOnly;
  const MyBadgeList({
    Key? key,
    required this.myList,
    required this.readOnly,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: myList.length,
        itemBuilder: (_, index) {
          return MyBadge(
            data: myList[index],
            isSelected: readOnly,
          );
        },
      ),
    );
  }
}
