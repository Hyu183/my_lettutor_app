import 'package:flutter/material.dart';
import 'package:my_lettutor_app/providers/teachers.dart';
import 'package:provider/provider.dart';

import 'package:my_lettutor_app/home/pages/home_page.dart';
import 'package:my_lettutor_app/home/pages/messages_page.dart';
import 'package:my_lettutor_app/home/pages/settings_page.dart';
import 'package:my_lettutor_app/home/pages/tutors_page.dart';
import 'package:my_lettutor_app/home/pages/upcoming_page.dart';

import 'package:my_lettutor_app/data/data.dart' show teacherList;

typedef LoginCallback = void Function(int);

class TabsPage extends StatefulWidget {
  final LoginCallback callback;
  const TabsPage({
    Key? key,
    required this.callback,
  }) : super(key: key);

  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  int _selectedIndex = 0;
  late List<Map<String, Object>> _pages;
  @override
  void initState() {
    // TODO: implement initState
    _pages = [
      {
        'title': 'Home',
        'page': HomePage(
          navigatorFunc: _changeTab,
        )
      },
      {'title': 'Chats', 'page': MessagesPage()},
      {'title': 'Upcoming', 'page': UpcomingPage()},
      {'title': 'Tutors', 'page': TutorsPage()},
      {
        'title': 'Settings',
        'page': SettingsPage(
          callback: widget.callback,
        )
      },
    ];

    super.initState();
  }

  void _changeTab(index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    //set data for teacher list;
    Provider.of<Teachers>(context, listen: false).setTeachers(teacherList);
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
