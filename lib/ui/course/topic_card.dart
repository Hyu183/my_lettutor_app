import 'package:flutter/material.dart';

import 'package:my_lettutor_app/ui/course/topic_pdf_view.dart';

class TopicCard extends StatelessWidget {
  final int number;
  final String text;
  const TopicCard({
    Key? key,
    required this.number,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
           onTap: () {
        // Navigator.of(context)
        //     .pushNamed(TopicPDFView.routeName, arguments: text);
      },
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xFFA6AFFC),
                    ),
                  ),
                  Text(
                    '$number',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Text(
                  text,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
