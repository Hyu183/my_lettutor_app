import 'package:flutter/material.dart';

import './speciality_badge.dart';

class SpecialityBadgeList extends StatelessWidget {
  final List<String> specialityList;
  final bool readOnly;
  const SpecialityBadgeList({
    Key? key,
    required this.specialityList,
    required this.readOnly,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: specialityList.length,
        itemBuilder: (_, index) {
          return SpecialityBadge(
            speciality: specialityList[index],
            isSelected: readOnly,
          );
        },
      ),
    );
  }
}
