import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:my_lettutor_app/ui/messages/message_list_tile.dart';
import 'package:my_lettutor_app/widgets/no_data.dart';
import 'package:my_lettutor_app/widgets/search_bar.dart';

import 'package:my_lettutor_app/data/data.dart';

class MessagesPage extends StatelessWidget {
//   final List<Message> messages = '';
  const MessagesPage({Key? key}) : super(key: key);

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
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            // const SearchBar(text: 'Search message'),
            Container(
              margin: const EdgeInsets.only(top: 8),
              child: CupertinoSearchTextField(
                  placeholder: 'Search message',
                  backgroundColor: Colors.grey[200],
                  onChanged: (value) {}),
            ),
            Expanded(
              child: messages.isNotEmpty
                  ? ListView.builder(
                      itemCount: messages.length,
                      itemBuilder: (_, i) {
                        return MessageListTile(message: messages[i]);
                      },
                    )
                  : const Padding(
                      padding: EdgeInsets.all(100.0),
                      child: NoData(),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
