import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_lettutor_app/providers/auth_provider.dart';

import 'package:my_lettutor_app/ui/pages/profile_page.dart';
import 'package:my_lettutor_app/ui/settings/advanced_settings.dart';
import 'package:my_lettutor_app/ui/settings/booking_history.dart';
import 'package:my_lettutor_app/ui/settings/session_history.dart';
import 'package:my_lettutor_app/ui/settings/setting_card.dart';
import 'package:my_lettutor_app/ui/settings/view_feedbacks.dart';
import 'package:my_lettutor_app/widgets/button/large_button.dart';
import 'package:provider/src/provider.dart';

const String userName = 'Username';
const String email = '18120183@student.hcmus.edu.vn';

// typedef LoginCallback = void Function(int);

class SettingsPage extends StatelessWidget {
//   final LoginCallback callback;
  const SettingsPage({
    Key? key,
    // required this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
      final authProvider = context.read<AuthProvider>();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          AppLocalizations.of(context)!.settingsTitle,
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
                Navigator.of(context).pushNamed(ProfilePage.routeName);
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
                  SettingCard(
                    icon: Icons.approval_outlined,
                    text: AppLocalizations.of(context)!.becomeTutorText,
                    routeName: ViewFeedbacks.routeName,
                  ),
                  SettingCard(
                    icon: Icons.person_outline_rounded,
                    text: AppLocalizations.of(context)!.viewFeedbackText,
                    routeName: ViewFeedbacks.routeName,
                  ),
                  SettingCard(
                    icon: Icons.list_outlined,
                    text: AppLocalizations.of(context)!.bookingHistoryText,
                    routeName: BookingHistory.routeName,
                  ),
                  SettingCard(
                    icon: Icons.history_outlined,
                    text: AppLocalizations.of(context)!.sessionHistoryText,
                    routeName: SessionHistory.routeName,
                  ),
                  SettingCard(
                    icon: Icons.settings_outlined,
                    text: AppLocalizations.of(context)!.advancedSettingsText,
                    routeName: AdvancedSettings.routeName,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  SettingCard(
                    icon: Icons.language_outlined,
                    text: AppLocalizations.of(context)!.ourWebsiteText,
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
                      Text(AppLocalizations.of(context)!.versionText('1.0.0'),
                          style: TextStyle(color: Colors.grey)),
                      LargeButton(
                        text: AppLocalizations.of(context)!.logoutBtn,
                        handler: authProvider.logOut,//callback(0),
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
