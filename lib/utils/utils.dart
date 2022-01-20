import 'dart:convert';

import 'package:my_lettutor_app/constants/variables.dart';

class Utils {
  static List<int> getTotalTime(int time) {
    List<int> result = [];
    var hours = time ~/ 60;
    var minutes = time % 60;
    result.add(hours);
    result.add(minutes);
    return result;
  }

  static List<String> parseSpecialties(String specialties) {
    List<String> result = specialties
        .split(',')
        .map((item) => specialtiesMap[item] ?? item)
        .toList();
    return result;
  }

  static List<String> parseLanguages(String languages) {
    List<String> result =
        languages.split(',').map((lang) => languagesMap[lang] ?? lang).toList();
    return result;
  }

  static bool checkValidCancelClass(int startTimeStamp) {
    var timeStart = DateTime.fromMillisecondsSinceEpoch(startTimeStamp);

    return DateTime.now().difference(timeStart).abs().inMinutes > 120;
  }

  static String getLevelString(String lvl) {
    return levelMap[lvl]!;
  }

  static bool checkScheduleWithin7Days(int startTimeStamp, DateTime now) {
    var timeStart = DateTime.fromMillisecondsSinceEpoch(startTimeStamp);
    DateTime timeStartDay =
        DateTime(timeStart.year, timeStart.month, timeStart.day);
    DateTime nowDay = DateTime(now.year, now.month, now.day);
    var diff = timeStartDay.difference(nowDay).inDays;
    return diff >= 0 && diff <= 6;
  }

  static int testCheckScheduleWithin7Days(int startTimeStamp, DateTime now) {
    var timeStart = DateTime.fromMillisecondsSinceEpoch(startTimeStamp);
    DateTime timeStartDay =
        DateTime(timeStart.year, timeStart.month, timeStart.day);
    DateTime nowDay = DateTime(now.year, now.month, now.day);
    var diff = timeStartDay.difference(nowDay).inDays;
    return diff;
  }

  static DateTime getDate(int startTimeStamp) {
    var fulltime = DateTime.fromMillisecondsSinceEpoch(startTimeStamp);
    DateTime dateTime = DateTime(fulltime.year, fulltime.month, fulltime.day);

    return dateTime;
  }

  static DateTime getBirthDay(String timeString) {
    var times = timeString.split('-').map((e) => int.parse(e)).toList();
    DateTime day = DateTime(times[0], times[1], times[2]);
    return day;
  }
}
