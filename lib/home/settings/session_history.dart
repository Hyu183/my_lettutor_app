import 'package:flutter/material.dart';

import './session_history_card.dart';
import '../../models/temp/session.dart';

class SessionHistory extends StatelessWidget {
  static const String routeName = 'session-history';
  const SessionHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Session History',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          children:
              sessions.map((e) => SessionHistoryCard(session: e)).toList(),
        ),
      ),
    );
  }
}
