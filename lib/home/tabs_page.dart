import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:my_lettutor_app/home/pages/messages.dart';
import 'package:my_lettutor_app/home/pages/home_page.dart';
import 'package:my_lettutor_app/home/pages/settings.dart';
import 'package:my_lettutor_app/home/pages/tutors.dart';
import 'package:my_lettutor_app/home/pages/upcomming.dart';

class TabsPage extends StatefulWidget {
  const TabsPage({Key? key}) : super(key: key);

  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  int _selectedIndex = 0;

  final List<Map<String, Object>> _pages = [
    {'title': 'Home', 'page': HomePage()},
    {'title': 'Chats', 'page':  Messages()},
    {'title': 'Upcoming', 'page':  Upcomming()},
    {'title': 'Tutors', 'page': Tutors()},
    {'title': 'Settings', 'page':  Settings()},
  ];

  void _changeTab(index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFF0071F0),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: (index) => _changeTab(index),
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
