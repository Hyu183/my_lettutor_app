import 'package:my_lettutor_app/data/sharedpref/constants/preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemePreference {
  Future<bool> get isPinkMode async {
    final _sharedPreference = await SharedPreferences.getInstance();
    return _sharedPreference.getBool(Preferences.is_pink_mode) ?? false;
  }

  Future<void> changeTheme(bool value) async {
    final _sharedPreference = await SharedPreferences.getInstance();
    _sharedPreference.setBool(Preferences.is_pink_mode, value);
  }
}
