import 'package:flutter/material.dart';
import 'package:my_lettutor_app/home/tabs_page.dart';

// import 'package:my_lettutor_app/pages/my_home_page.dart';

void main() {
  runApp(const MyApp());
}

const MaterialColor white = MaterialColor(
  0xFFFFFFFF,
  <int, Color>{
    50: Color(0xFFFFFFFF),
    100: Color(0xFFFFFFFF),
    200: Color(0xFFFFFFFF),
    300: Color(0xFFFFFFFF),
    400: Color(0xFFFFFFFF),
    500: Color(0xFFFFFFFF),
    600: Color(0xFFFFFFFF),
    700: Color(0xFFFFFFFF),
    800: Color(0xFFFFFFFF),
    900: Color(0xFFFFFFFF),
  },
);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LetTutor',
      theme: ThemeData(
        primarySwatch: white,
      ),
      home: const TabsPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
