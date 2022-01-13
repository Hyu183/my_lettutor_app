import 'package:flutter/cupertino.dart';

import 'package:my_lettutor_app/models/temp/teacher.dart';

class Teachers with ChangeNotifier {
  List<Teacher> _teachers = [];

  void setTeachers(List<Teacher> teachers) {
    _teachers = [...teachers];
  }

  List<Teacher> getTeachers() {
    return [..._teachers];
  }

  void toggleFavorite() {}
}
