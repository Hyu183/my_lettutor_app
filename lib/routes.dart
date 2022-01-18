import 'package:flutter/material.dart';

import 'package:my_lettutor_app/models/temp/course.dart';
import 'package:my_lettutor_app/models/temp/teacher.dart';
import 'package:my_lettutor_app/models/tutor.dart';
import 'package:my_lettutor_app/models/user_schedule.dart';
import 'package:my_lettutor_app/ui/authentication/forgot_password.dart';
import 'package:my_lettutor_app/ui/authentication/signup.dart';
import 'package:my_lettutor_app/ui/course/course_detail.dart';
import 'package:my_lettutor_app/ui/meetings/meeting.dart';
import 'package:my_lettutor_app/ui/pages/profile_page.dart';
import 'package:my_lettutor_app/ui/settings/advanced_settings.dart';
import 'package:my_lettutor_app/ui/settings/booking_history.dart';
import 'package:my_lettutor_app/ui/settings/session_history.dart';
import 'package:my_lettutor_app/ui/settings/view_feedbacks.dart';
import 'package:my_lettutor_app/ui/tutor/tutor_detail.dart';

class Routes {
  Routes._();

  static final routes = <String, WidgetBuilder>{
    ForgotPassWord.routeName: (_) => ForgotPassWord(),
    Signup.routeName: (_) => Signup(),
    AdvancedSettings.routeName: (_) => const AdvancedSettings(),
    BookingHistory.routeName: (_) => const BookingHistory(),
    SessionHistory.routeName: (_) => const SessionHistory(),
    ViewFeedbacks.routeName: (_) => const ViewFeedbacks(),
    ProfilePage.routeName: (_) => const ProfilePage(),
  };

  static Route<dynamic>? onGenerateRoutes(settings) {
    if (settings.name == TutorDetail.routeName) {
      var tutorId = settings.arguments as String;
      return MaterialPageRoute(builder: (_) {
        return TutorDetail(
          tutorId: tutorId,
        );
      });
    } else if (settings.name == CourseDetail.routeName) {
      var course = settings.arguments as Course;
      return MaterialPageRoute(builder: (_) {
        return CourseDetail(course: course);
      });
    } else if (settings.name == Meeting.routeName) {
      var userSchedule = settings.arguments as UserSchedule;
      return MaterialPageRoute(builder: (_) {
        return Meeting(userSchedule: userSchedule);
      });
    }
  }
}
