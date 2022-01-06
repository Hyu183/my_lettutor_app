import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_lettutor_app/providers/language_provider.dart';
import 'package:my_lettutor_app/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class AdvancedSettings extends StatelessWidget {
  static const routeName = 'advanced-settings';
  const AdvancedSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context);
    final lang = Provider.of<LanguageProvider>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          AppLocalizations.of(context)!.advancedSettingsTitle,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const Divider(),
            PopupMenuButton(
              onSelected: (val) {
                lang.setLanguageCode = val as String;
              },
              child: ListTile(
                title: Text(
                  AppLocalizations.of(context)!.languageSettingText,
                  style: const TextStyle(color: Colors.black),
                ),
                subtitle: Text(lang.languageCode == 'vi'?'Tiếng Việt': 'English'),
              ),
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: ListTile(
                    leading: SizedBox(
                        height: 40,
                        width: 40,
                        child: Image.asset('assets/images/vietnam.png')),
                    title: Text(AppLocalizations.of(context)!.vietnamese),
                  ),
                  value: 'vi',
                ),
                PopupMenuItem(
                  child: ListTile(
                    leading: SizedBox(
                        height: 40,
                        width: 40,
                        child: Image.asset('assets/images/united-kingdom.png')),
                    title: Text(AppLocalizations.of(context)!.english),
                  ),
                  value: 'en',
                )
              ],
            ),
            PopupMenuButton(
              onSelected: (val) {
                theme.setTheme = val as bool;
              },
              child: ListTile(
                title: Text(
                  AppLocalizations.of(context)!.themeSettingText,
                  style: const TextStyle(color: Colors.black),
                ),
                subtitle: Text(theme.pinkMode == true
                    ? AppLocalizations.of(context)!.pinkThemeText
                    : AppLocalizations.of(context)!.lightThemeText),
              ),
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: Text(AppLocalizations.of(context)!.lightThemeText),
                  value: false,
                ),
                PopupMenuItem(
                  child: Text(AppLocalizations.of(context)!.pinkThemeText),
                  value: true,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
