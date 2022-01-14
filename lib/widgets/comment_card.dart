import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:my_lettutor_app/widgets/my_rating_bar.dart';

// import 'package:my_lettutor_app/models/temp/comment.dart';
import 'package:my_lettutor_app/models/feedback.dart';

class FeedbackCard extends StatelessWidget {
  final MFeedback feedback;
  const FeedbackCard({
    Key? key,
    required this.feedback,
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
                    backgroundImage: ResizeImage(
                      NetworkImage(
                        feedback.firstInfo!.avatar!,
                      ),
                      height: 60,
                      width: 60,
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
                                feedback.firstInfo!.name!,
                                style: const TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            MyRatingBar(
                              rating: feedback.rating!.toDouble(),
                              padding: 0,
                              ignoreGestures: true,
                              size: 15,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(feedback.content!),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                DateFormat('HH:mm:ss, dd/MM/yyyy').format(feedback.createdAt!),
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
