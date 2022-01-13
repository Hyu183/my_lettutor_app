class Course {
  final String id = '';
  final String title;
  final String description;
  final String level;
  final String imageUrl = '';
  final List<String> topics;
  final List<String> overviews;
  Course({
    required this.title,
    required this.description,
    required this.level,
    required this.topics,
    required this.overviews,
  });
}
