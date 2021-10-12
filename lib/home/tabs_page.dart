import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:my_lettutor_app/home/chat/messages.dart';
import 'package:my_lettutor_app/home/home_page/home_page.dart';
import 'package:my_lettutor_app/home/profile/settings.dart';
import 'package:my_lettutor_app/home/teacher_list/tutors.dart';
import 'package:my_lettutor_app/home/upcoming/upcomming.dart';

class TabsPage extends StatefulWidget {
  const TabsPage({Key? key}) : super(key: key);

  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  int _selectedIndex = 0;

  final List<Map<String, Object>> _pages = [
    {'title': 'Home', 'page': const HomePage()},
    {'title': 'Chats', 'page': const Messages()},
    {'title': 'Upcoming', 'page': const Upcomming()},
    {'title': 'Tutors', 'page': const Tutors()},
    {'title': 'Settings', 'page': const Settings()},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFF0071F0),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.question_answer,
            ),
            label: 'Message',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.schedule,
            ),
            label: 'Upcoming',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.groups,
            ),
            label: 'Tutors',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
            ),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
