import 'package:my_lettutor_app/data/sharedpref/constants/preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguagePreference {
  Future<String> get getCurrentLanguage async {
    final _sharedPreference = await SharedPreferences.getInstance();
    return _sharedPreference.getString(Preferences.current_language) ?? 'en';
  }

  Future<void> changeLanguage(String value) async {
    final _sharedPreference = await SharedPreferences.getInstance();
    _sharedPreference.setString(Preferences.current_language, value);
  }
}
