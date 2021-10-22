import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:my_lettutor_app/widgets/speciality_badge_list.dart';

class TeacherListTile extends StatelessWidget {
  final String id = '';
  final String name;
  final double rating;
  final List<String> specialities;
  final String description;
  final String imageUrl = '';

  const TeacherListTile(
      {Key? key,
      required this.name,
      required this.rating,
      required this.specialities,
      required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 70,
          height: 60,
          child: CircleAvatar(
            // radius: 30,
            child: Image.asset(
              'assets/images/user.png',
              //   width: 30,
              //   height: 30,
              cacheHeight: 60,
              cacheWidth: 60,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          //   fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      RatingBar.builder(
                          itemSize: 20,
                          ignoreGestures: true,
                          initialRating: 5,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding: const EdgeInsets.only(right: 2.0),
                          itemBuilder: (ctx, _) {
                            return const Icon(Icons.star,
                                color: Colors.orangeAccent);
                          },
                          onRatingUpdate: (rating) {}),
                    ],
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite_border,
                        color: Color(0xFF0071F0),
                        size: 30,
                      )),
                ],
              ),
              SpecialityBadgeList(
                specialityList: specialities,
                readOnly: true,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
