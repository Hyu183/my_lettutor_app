import 'package:flutter/material.dart';

class AdvancedSettings extends StatefulWidget {
  static const routeName = 'advanced-settings';
  const AdvancedSettings({Key? key}) : super(key: key);

  @override
  State<AdvancedSettings> createState() => _AdvancedSettingsState();
}

class _AdvancedSettingsState extends State<AdvancedSettings> {
  String curLanguage = 'English';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Advanced Settings',
          style: TextStyle(
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
                setState(() {
                  curLanguage = val as String;
                });
              },
              child: ListTile(
                title: const Text(
                  'Language',
                  style: TextStyle(color: Colors.black),
                ),
                subtitle: Text(curLanguage),
              ),
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: ListTile(
                    leading: SizedBox(
                        height: 40,
                        width: 40,
                        child: Image.asset('assets/images/vietnam.png')),
                    title: const Text("Tiếng Việt"),
                  ),
                  value: "Tiếng Việt",
                ),
                PopupMenuItem(
                  child: ListTile(
                    leading: SizedBox(
                        height: 40,
                        width: 40,
                        child:
                            Image.asset('assets/images/united-kingdom.png')),
                    title: const Text("English"),
                  ),
                  value: "English",
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
