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
    final user = authProvider.userToken.user!;
    final translator = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          translator.settingsTitle,
          style: const TextStyle(
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
              child: ListTile(
                leading: SizedBox(
                  width: 70,
                  height: 60,
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: user.avatar! !=
                            "https://www.alliancerehabmed.com/wp-content/uploads/icon-avatar-default.png"
                        ? ResizeImage(
                            NetworkImage(
                              user.avatar!,
                            ),
                            height: 60,
                            width: 60,
                          )
                        : const ResizeImage(
                            AssetImage(
                              'assets/images/user.png',
                            ),
                            height: 60,
                            width: 60,
                          ),
                  ),
                ),
                title: Text(
                  user.name!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                subtitle: Text(user.email!),
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
                  user.roles!.contains("tutor")
                      ? SettingCard(
                          icon: Icons.person_outline_rounded,
                          text: translator.viewFeedbackText,
                          routeName: ViewFeedbacks.routeName,
                        )
                      : SettingCard(
                          icon: Icons.approval_outlined,
                          text: translator.becomeTutorText,
                          routeName: ViewFeedbacks.routeName,
                        ),
                  SettingCard(
                    icon: Icons.list_outlined,
                    text: translator.bookingHistoryText,
                    routeName: BookingHistory.routeName,
                  ),
                  SettingCard(
                    icon: Icons.history_outlined,
                    text: translator.sessionHistoryText,
                    routeName: SessionHistory.routeName,
                  ),
                  SettingCard(
                    icon: Icons.settings_outlined,
                    text: translator.advancedSettingsText,
                    routeName: AdvancedSettings.routeName,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  SettingCard(
                    icon: Icons.language_outlined,
                    text: translator.ourWebsiteText,
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
                      Text(translator.versionText('1.0.0'),
                          style: const TextStyle(color: Colors.grey)),
                      LargeButton(
                        text: translator.logoutBtn,
                        handler: authProvider.logOut, //callback(0),
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
