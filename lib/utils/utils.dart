import 'package:my_lettutor_app/utils/string.dart';

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
}
