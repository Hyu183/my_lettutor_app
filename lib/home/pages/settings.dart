import 'package:flutter/material.dart';

import './profile.dart';
import '../settings/advanced_settings.dart';
import '../settings/view_feedbacks.dart';
import '../settings/booking_history.dart';
import '../settings/session_history.dart';
import '../settings/setting_card.dart';

import '../../widgets/button/large_button.dart';

const String userName = 'Username';
const String email = '18120183@student.hcmus.edu.vn';

typedef LoginCallback = void Function(int);

class Settings extends StatelessWidget {
  final LoginCallback callback;
  const Settings({
    Key? key,
    required this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Settings',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(Profile.routeName);
              },
              child: const ListTile(
                leading: SizedBox(
                  width: 70,
                  height: 60,
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: ResizeImage(
                      AssetImage(
                        'assets/images/user.png',
                      ),
                      height: 60,
                      width: 60,
                    ),
                  ),
                ),
                title: Text(
                  userName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                subtitle: Text(email),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: 5,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                children: [
                  const SettingCard(
                    icon: Icons.person_outline_rounded,
                    text: 'View Feedbacks',
                    routeName: ViewFeedbacks.routeName,
                  ),
                  const SettingCard(
                    icon: Icons.list_outlined,
                    text: 'Booking History',
                    routeName: BookingHistory.routeName,
                  ),
                  const SettingCard(
                    icon: Icons.history_outlined,
                    text: 'Session History',
                    routeName: SessionHistory.routeName,
                  ),
                  const SettingCard(
                    icon: Icons.settings_outlined,
                    text: 'Advanced Settings',
                    routeName: AdvancedSettings.routeName,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const SettingCard(
                    icon: Icons.language_outlined,
                    text: 'Our Website',
                    routeName: '',
                    url: 'https://app.lettutor.com/',
                  ),
                  const SettingCard(
                    icon: Icons.facebook_outlined,
                    text: 'Facebook',
                    routeName: '',
                    url: 'https://facebook.com/',
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text('Version 1.0.0',
                          style: TextStyle(color: Colors.grey)),
                      LargeButton(
                        text: 'Log out',
                        handler: () => callback(0),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
