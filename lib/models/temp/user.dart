class User {
  final String id = '';
  final String name;
  final String email;
  final DateTime? birthday;
  final String? phoneNumber;
  final String? country;
  final String? level;
  final String? wannaLearn;
  User({
    required this.name,
    required this.email,
    this.birthday,
    this.phoneNumber,
    this.country,
    this.level,
    this.wannaLearn,
  });
}

