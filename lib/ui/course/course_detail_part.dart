import 'package:flutter/material.dart';

class CourseDetailPart extends StatelessWidget {
  final String title;
  final Widget child;
  final bool hasPadding;
  const CourseDetailPart({
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
            style: Theme.of(context).textTheme.headline2!.copyWith(
                  fontSize: 25,
                ),
          ),
          const SizedBox(
            height: 10,
          ),
          hasPadding
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: SizedBox(width: double.infinity, child: child),
                )
              : SizedBox(width: double.infinity, child: child),
        ],
      ),
    );
  }
}
