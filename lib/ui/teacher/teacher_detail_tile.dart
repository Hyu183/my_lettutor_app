import 'package:flutter/material.dart';

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
            child: const CircleAvatar(
              radius: 30,
              backgroundImage: ResizeImage(
                AssetImage(
                  'assets/images/user.png',
                ),
                height: 60,
                width: 60,
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
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
                          color: Colors.pink, 
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
