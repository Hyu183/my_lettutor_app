import 'package:flutter/material.dart';

import 'package:my_lettutor_app/widgets/speciality_badge.dart';

class SpecialityBadgeList extends StatelessWidget {
  final List<String> specialityList;
  const SpecialityBadgeList({Key? key, required this.specialityList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: specialityList.length,
        itemBuilder: (_, index) {
          return SpecialityBadge(speciality: specialityList[index]);
        },
      ),
    );
  }
}
