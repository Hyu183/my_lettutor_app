import 'package:flutter/material.dart';
import 'package:my_lettutor_app/data/sharedpref/language_preference.dart';

class LanguageProvider with ChangeNotifier {
   String _languageCode = 'en';
    final LanguagePreference _langPreference = LanguagePreference();
  String get languageCode => _languageCode;

    set setLanguageCode(String value) {
    _languageCode =value;
    _langPreference.changeLanguage(value);
    notifyListeners();
  }

  Future<String> getCurrentLanguageCode() {
      return  _langPreference.getCurrentLanguage;    
  }
}
