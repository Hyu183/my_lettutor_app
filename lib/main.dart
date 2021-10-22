import 'package:flutter/material.dart';

import './authentication/forgot_password.dart';
import './authentication/signup.dart';
import './home/tabs_page.dart';
import './home/teacher_list/tutors.dart';
import './authentication/login.dart';

// import './pages/my_home_page.dart';

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

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int isLogin = 0;

  void loginCallback(int _isLogin) {
    setState(() {
      isLogin = _isLogin;
    });
  }

  Widget displayScreen() {
    if (isLogin == 1) {
      return const TabsPage();
    } else if (isLogin == 0) {
      return Login(callback: loginCallback);
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LetTutor',
      theme: ThemeData(
        primarySwatch: white,
        textTheme: const TextTheme(
          headline1: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            primary: const Color(0xFF0E78EF),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: const Color(0XFF0071F0),
            onPrimary: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Colors.blue,
          selectionHandleColor: Colors.blue,
        ),
      ),
      home: displayScreen(),
      routes: {
        Tutors.routeName: (_) => Tutors(),
        ForgotPassWord.routeName: (_) => ForgotPassWord(),
        Signup.routeName: (_) => Signup(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
