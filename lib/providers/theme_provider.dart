import 'package:flutter/material.dart';
// import 'package:my_lettutor_app/data/repository.dart';
import 'package:my_lettutor_app/data/sharedpref/theme_preference.dart';

class ThemeProvider with ChangeNotifier {
//   final Repository _repository;
  bool _pinkMode = false;
  final ThemePreference _themePreference = ThemePreference();

  bool get pinkMode => _pinkMode;

  set setTheme(bool value) {
    _pinkMode = value;
    _themePreference.changeTheme(value);
    notifyListeners();
  }

  Future<bool> getCurrentTheme() {
    return _themePreference.isPinkMode;
  }

//   ThemeProvider(Repository repository) : _repository = repository {
//     init();
//   }
//   Future changeBrightnessToPink(bool value) async {
//     _pinkMode = value;
//     await _repository.changeBrightnessToPink(value);
//     notifyListeners();
//   }

//   // general methods:-----------------------------------------------------------
//   Future init() async {
//     _pinkMode = _repository.isPinkMode;
//   }

//   bool isPlatformDark(BuildContext context) =>
//       MediaQuery.platformBrightnessOf(context) == Brightness.dark;

}
