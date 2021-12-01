import 'package:my_lettutor_app/models/comment.dart';
import 'package:my_lettutor_app/models/course.dart';

class Teacher {
  final String id = '';
  final String name;
  final double rating;
  final List<String> specialities;
  final List<String> languages;
  final String description;
  final String imageUrl = '';
  final String education;
  final String experience;
  final String interests;
  final String profession;
  final String country;
  final List<Comment>? comments;
  List<Course>? courses;

  Teacher({
    required this.name,
    required this.rating,
    required this.specialities,
    required this.description,
    required this.languages,
    required this.education,
    required this.experience,
    required this.interests,
    required this.profession,
    required this.country,
    this.comments,
    this.courses,
  });
}





