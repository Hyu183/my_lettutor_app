import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_lettutor_app/data/sharedpref/language_preference.dart';

class LanguageProvider extends ChangeNotifier {
  Map<String, Locale> localeMap = {
    'vi': const Locale('vi', 'VN'),
    'en': const Locale('en', 'US'),
  };
  String _languageCode = 'en';
  final LanguagePreference _langPreference = LanguagePreference();
  String get languageCode => _languageCode;
  Locale get getLocale => localeMap[_languageCode]!;

  set setLanguageCode(String value) {
    _languageCode = value;
    _langPreference.changeLanguage(value);
    Get.updateLocale(localeMap[_languageCode]!);
    notifyListeners();
  }

  Future<String> getCurrentLanguageCode() {
    return _langPreference.getCurrentLanguage;
  }
}
