import 'package:flutter/material.dart';


import './authentication/forgot_password.dart';
import './authentication/signup.dart';
import './authentication/login.dart';
import './home/pages/profile.dart';
import './home/tabs_page.dart';
import './home/teacher_list/teacher/teacher_detail.dart';
import './home/course/course_detail.dart';
import './home/settings/booking_history.dart';
import './home/settings/advanced_settings.dart';
import './home/settings/session_history.dart';


import './models/course.dart';
import './models/teacher.dart';
import 'home/settings/view_feedbacks.dart';

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
  int isLogin = 1;

  void loginCallback(int _isLogin) {
    setState(() {
      isLogin = _isLogin;
    });
  }

  Widget displayScreen() {
    if (isLogin == 1) {
      return  TabsPage(callback: loginCallback);
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
        // Tutors.routeName: (_) => Tutors(),
        ForgotPassWord.routeName: (_) => ForgotPassWord(),
        Signup.routeName: (_) => Signup(),
        AdvancedSettings.routeName: (_)=>AdvancedSettings(),
        BookingHistory.routeName: (_) => BookingHistory(),
        SessionHistory.routeName: (_)=>SessionHistory(),
        ViewFeedbacks.routeName: (_)=>ViewFeedbacks(),
        Profile.routeName: (_)=>Profile(),
        // Login.routeName: (_) => Login(callback: loginCallback),
        // TeacherDetail.routeName: (_) => TeacherDetail(),
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
        //  else if (settings.name == TopicPDFView.routeName) {
        //   var topicName = settings.arguments as String;
        //   return MaterialPageRoute(builder: (_) {
        //     return TopicPDFView(topicName: topicName);
        //   });
        // }

        // return MaterialPageRoute(builder: (_){
        //     return Unko
        // });
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
