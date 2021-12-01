import 'package:flutter/material.dart';

import 'package:my_lettutor_app/authentication/forgot_password.dart';
import 'package:my_lettutor_app/authentication/login.dart';
import 'package:my_lettutor_app/authentication/signup.dart';
import 'package:my_lettutor_app/config/palette.dart';
import 'package:my_lettutor_app/home/course/course_detail.dart';
import 'package:my_lettutor_app/home/pages/profile_page.dart';
import 'package:my_lettutor_app/home/settings/advanced_settings.dart';
import 'package:my_lettutor_app/home/settings/booking_history.dart';
import 'package:my_lettutor_app/home/settings/session_history.dart';
import 'package:my_lettutor_app/home/settings/view_feedbacks.dart';
import 'package:my_lettutor_app/home/tabs_page.dart';
import 'package:my_lettutor_app/home/teacher_list/teacher/teacher_detail.dart';

import 'package:my_lettutor_app/models/course.dart';
import 'package:my_lettutor_app/models/teacher.dart';

void main() {
  runApp(const MyApp());
}

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
      return TabsPage(callback: loginCallback);
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
        primarySwatch: Palette.white,
        disabledColor: Colors.grey[50],
        textTheme: const TextTheme(
          headline1: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          headline2: TextStyle(
            color: Color(0XFF0071F0),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          bodyText1: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.normal,
            fontSize: 18,
          ),
          subtitle1: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.normal,
            fontSize: 16,
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
        ForgotPassWord.routeName: (_) => ForgotPassWord(),
        Signup.routeName: (_) => Signup(),
        AdvancedSettings.routeName: (_) => const AdvancedSettings(),
        BookingHistory.routeName: (_) => const BookingHistory(),
        SessionHistory.routeName: (_) => const SessionHistory(),
        ViewFeedbacks.routeName: (_) => const ViewFeedbacks(),
        ProfilePage.routeName: (_) => const ProfilePage(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == TeacherDetail.routeName) {
          var teacher = settings.arguments as Teacher;
          return MaterialPageRoute(builder: (_) {
            return TeacherDetail(
              teacher: teacher,
            );
          });
        } else if (settings.name == CourseDetail.routeName) {
          var course = settings.arguments as Course;
          return MaterialPageRoute(builder: (_) {
            return CourseDetail(course: course);
          });
        }
      },
      debugShowCheckedModeBanner: false,
    );
  }
}


// milestone 2 :
// favorite teacher
// booking to upcoming --save local
// search
// teacher list favorite first then rating
// adjust theme, language

// logout to login page
// admin 123-> login