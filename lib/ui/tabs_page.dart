import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:my_lettutor_app/providers/teachers.dart';
import 'package:provider/provider.dart';

import 'package:my_lettutor_app/ui/pages/home_page.dart';
import 'package:my_lettutor_app/ui/pages/messages_page.dart';
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
      {'title': 'Chats', 'page': MessagesPage()},
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
    //set data for teacher list;
    Provider.of<Teachers>(context, listen: false).setTeachers(teacherList);
    return Scaffold(
      body: _pages[_selectedIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).textTheme.headline2!.color!,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: (index) => _changeTab(index),
        items:  [
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.home,
            ),
            label: AppLocalizations.of(context)!.homeTabLabel,
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.question_answer,
            ),
            label: AppLocalizations.of(context)!.messageTabLabel,
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.schedule,
            ),
            label: AppLocalizations.of(context)!.upcomingTabLabel,
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.groups,
            ),
            label: AppLocalizations.of(context)!.tutorsTabLabel,
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.settings,
            ),
            label: AppLocalizations.of(context)!.settingsTabLabel,
          ),
        ],
      ),
    );
  }
}
