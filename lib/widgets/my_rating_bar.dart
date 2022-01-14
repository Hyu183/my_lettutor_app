import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MyRatingBar extends StatelessWidget {
  final double rating;
  final double padding;
  final bool ignoreGestures;
  final double size;
  const MyRatingBar({
    Key? key,
    required this.rating,
    required this.padding,
    required this.ignoreGestures,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      itemSize: size,
      ignoreGestures: ignoreGestures,
      initialRating: rating,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemPadding: EdgeInsets.only(right: padding),
      itemBuilder: (ctx, _) {
        return Icon(Icons.star, color: Colors.yellow.shade600);
      },
      unratedColor: Colors.grey.shade300,
      onRatingUpdate: (rating) {},
    );
  }
}
