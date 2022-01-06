import 'package:flutter/material.dart';

class TeacherDetailPart extends StatelessWidget {
  final String title;
  final Widget child;
  final bool hasPadding;
  const TeacherDetailPart({
    Key? key,
    required this.title,
    required this.child,
    required this.hasPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headline2,
          ),
          const SizedBox(
            height: 10,
          ),
          hasPadding
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: child,
                )
              : child,
        ],
      ),
    );
  }
}
