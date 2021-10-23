import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:my_lettutor_app/widgets/my_rating_bar.dart';

class TeacherDetailTile extends StatelessWidget {
  final String name;
  final String imageUrl = '';
  final double rating;
  final String country;
  const TeacherDetailTile({
    Key? key,
    required this.name,
    required this.rating,
    required this.country,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            width: 100,
            height: 100,
            margin: const EdgeInsets.only(right: 5),
            child: CircleAvatar(
              // radius: 30,
              child: Image.asset(
                'assets/images/user.png',
                //   width: 30,
                //   height: 30,
                cacheHeight: 90,
                cacheWidth: 90,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              //   mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        name,
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    MyRatingBar(
                      rating: rating,
                      padding: 0,
                      ignoreGestures: true,
                      size: 20,
                    ),
                  ],
                ),
                Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(
                      child: Text(
                        'Teacher',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.favorite_border,
                          color: Colors.pink, //Color(0xFF0071F0),
                          size: 30,
                        )),
                  ],
                ),
                Text(country),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
