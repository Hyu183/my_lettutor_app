import 'package:flutter/cupertino.dart';

class FavoriteTeachers with ChangeNotifier {
  List<String> _favorites = ['1'];

  List<String> get favorites {
    return [..._favorites];
  }

  void addFavorite(String id) {
    _favorites.add(id);
    notifyListeners();
  }

  void removeFavorite(String id) {
    _favorites.remove(id);
    notifyListeners();
  }
}
