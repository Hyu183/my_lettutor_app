import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: Card(
        elevation: 4,
        child: Column(
          children: [
            ListTile(
              leading: SizedBox(
                width: 70,
                height: 60,
                child: CircleAvatar(
                  radius: 30,
                  backgroundImage: feedback.firstInfo!.avatar! !=
                          "https://www.alliancerehabmed.com/wp-content/uploads/icon-avatar-default.png"
                      ? ResizeImage(
                          NetworkImage(
                            feedback.firstInfo!.avatar!,
                          ),
                          height: 60,
                          width: 60,
                        )
                      : const ResizeImage(
                          AssetImage(
                            'assets/images/user.png',
                          ),
                          height: 60,
                          width: 60,
                        ),
                ),
              ),
              title: Text(feedback.firstInfo!.name!),
              subtitle: Text(
                DateFormat('HH:mm:ss, dd/MM/yyyy').format(feedback.updatedAt!),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${feedback.rating}',
                  style: const TextStyle(
                    color: Colors.redAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 5),
                  child: Image.asset(
                    'assets/images/star.png',
                    cacheHeight: 20,
                    cacheWidth: 20,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 15,
              ),
              child: Card(
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(feedback.content!),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
