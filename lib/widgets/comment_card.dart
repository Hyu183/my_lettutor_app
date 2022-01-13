import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:my_lettutor_app/widgets/my_rating_bar.dart';

import 'package:my_lettutor_app/models/temp/comment.dart';

class CommentCard extends StatelessWidget {
  final Comment comment;
  const CommentCard({
    Key? key,
    required this.comment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 5,
      ),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    child: Image.asset(
                      'assets/images/user.png',
                      cacheHeight: 60,
                      cacheWidth: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                comment.username,
                                style: const TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            MyRatingBar(
                              rating: comment.rating,
                              padding: 0,
                              ignoreGestures: true,
                              size: 15,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(comment.content),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                DateFormat('HH:mm:ss, dd/MM/yyyy').format(comment.date),
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
