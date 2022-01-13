import 'package:flutter/material.dart';
import 'package:my_lettutor_app/data/sharedpref/token_preference.dart';
import 'package:my_lettutor_app/models/token.dart';
import 'package:my_lettutor_app/models/tokens.dart';
import 'package:my_lettutor_app/models/user_token.dart';

class AuthProvider extends ChangeNotifier {
  UserToken _userToken = UserToken();
  final TokensPreference _tokenPreference = TokensPreference();
  bool _isLoggedIn = false;

  UserToken get userToken => _userToken;

//   set setUserToken(UserToken userToken) {
//     _userToken = userToken;
//     // notifyListeners();
//   }

  bool get isLoggedIn => _isLoggedIn;
  set setIsLoggegIn(bool value) {
    _isLoggedIn = value;
    notifyListeners();
  }

  Future<bool> checkToken() async {
    var accessToken = await _tokenPreference.accessToken;
    if (accessToken.isEmpty) {
      return false;
    }
    var accessExpires = DateTime.parse(await _tokenPreference.accessExpires);
    if (DateTime.now().isAfter(accessExpires)) {
      return false;
    }

    return true;
  }

  void loadTokens() {
    Future.wait([
      _tokenPreference.accessToken,
      _tokenPreference.accessExpires,
      _tokenPreference.refreshToken,
      _tokenPreference.accessExpires
    ]).then((res) {
      _userToken.tokens = Tokens(Token(res[0], DateTime.parse(res[1])),
          Token(res[2], DateTime.parse(res[3])));
    });
  }

  void logIn(UserToken userToken, bool isLoggedIn) {
    _userToken = userToken;
    _isLoggedIn = isLoggedIn;
    notifyListeners();
  }

  void logOut() {
    _isLoggedIn = false;
    _tokenPreference.clearTokens();
    notifyListeners();
  }
}
