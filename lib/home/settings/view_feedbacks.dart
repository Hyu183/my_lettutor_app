import 'package:flutter/material.dart';

import 'package:my_lettutor_app/home/settings/feedback_card.dart';

import 'package:my_lettutor_app/data/data.dart';

const totalRating = 5.0;

class ViewFeedbacks extends StatelessWidget {
  static const routeName = 'view-feedbacks';
  const ViewFeedbacks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Feedback List',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '$totalRating',
                    style: const TextStyle(
                      color: Colors.redAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: Image.asset(
                      'assets/images/star.png',
                      cacheHeight: 50,
                      cacheWidth: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: feedbacks
                  .map((e) => FeedbackCard(
                        data: e,
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
