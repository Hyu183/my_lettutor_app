import 'package:flutter/material.dart';

import '../messages/message_list_tile.dart';
import '../../models/message.dart';
import '../../widgets/utils/search_bar.dart';

class Messages extends StatelessWidget {
//   final List<Message> messages = '';
  const Messages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Chats',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SearchBar(text: 'Search message'),
            Expanded(
              child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (_, i) {
                  return MessageListTile(message: messages[i]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
