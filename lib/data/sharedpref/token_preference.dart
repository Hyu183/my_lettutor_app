import 'package:shared_preferences/shared_preferences.dart';

import 'constants/preferences.dart';

class TokensPreference {
  Future<String> get accessExpires async {
    final _sharedPreference = await SharedPreferences.getInstance();
    return _sharedPreference.getString(Preferences.access_expires) ?? '';
  }

  Future<String> get refreshExpires async {
    final _sharedPreference = await SharedPreferences.getInstance();
    return _sharedPreference.getString(Preferences.refresh_expires) ?? '';
  }

  Future<String> get accessToken async {
    final _sharedPreference = await SharedPreferences.getInstance();
    return _sharedPreference.getString(Preferences.access_token) ?? '';
  }

  Future<String> get refreshToken async {
    final _sharedPreference = await SharedPreferences.getInstance();
    return _sharedPreference.getString(Preferences.access_token) ?? '';
  }

  Future<void> setAccessToken(String value) async {
    final _sharedPreference = await SharedPreferences.getInstance();
    _sharedPreference.setString(Preferences.refresh_token, value);
  }

  Future<void> setRefreshToken(String value) async {
    final _sharedPreference = await SharedPreferences.getInstance();
    _sharedPreference.setString(Preferences.refresh_token, value);
  }

  void clearTokens() async {
    final _sharedPreference = await SharedPreferences.getInstance();
    _sharedPreference.remove(Preferences.access_token);
    _sharedPreference.remove(Preferences.refresh_token);
  }
}
