import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:my_lettutor_app/providers/teachers.dart';
import 'package:provider/provider.dart';

import 'package:my_lettutor_app/ui/pages/home_page.dart';
import 'package:my_lettutor_app/ui/pages/courses_page.dart';
import 'package:my_lettutor_app/ui/pages/settings_page.dart';
import 'package:my_lettutor_app/ui/pages/tutors_page.dart';
import 'package:my_lettutor_app/ui/pages/schedule_page.dart';

import 'package:my_lettutor_app/data/data.dart' show teacherList;

// typedef LoginCallback = void Function(int);

class TabsPage extends StatefulWidget {
//   final LoginCallback callback;
  const TabsPage({
    Key? key,
    // required this.callback,
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
      {'title': 'Courses', 'page': CoursePage()},
      {'title': 'Upcoming', 'page': SchedulePage()},
      {'title': 'Tutors', 'page': TutorsPage()},
      {
        'title': 'Settings',
        'page': SettingsPage(
            //   callback: widget.callback,
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
    final translator = AppLocalizations.of(context)!;
    //set data for teacher list;

    return Scaffold(
      body: _pages[_selectedIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).textTheme.headline2!.color!,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: (index) => _changeTab(index),
        items: [
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.home,
            ),
            label: translator.homeTabLabel,
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.question_answer,
            ),
            label: translator.coursesTabLabel,
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.schedule,
            ),
            label: translator.upcomingTabLabel,
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.groups,
            ),
            label: translator.tutorsTabLabel,
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.settings,
            ),
            label: translator.settingsTabLabel,
          ),
        ],
      ),
    );
  }
}
