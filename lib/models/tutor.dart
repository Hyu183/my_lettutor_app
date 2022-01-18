import 'package:json_annotation/json_annotation.dart';
import 'package:my_lettutor_app/models/feedback.dart';
import 'package:my_lettutor_app/models/user.dart';

part 'tutor.g.dart';

@JsonSerializable()
class Tutor {
  String? id;
  String? name;
  String? avatar;
  String? userId;
  String? video;
  String? bio;
  String? education;
  String? experience;
  String? profession;
  String? accent;
  String? targetStudent;
  String? interests;
  String? languages;
  String? specialties;
  String? resume;
  bool? isActivated;
  bool? isNative;
  String? createdAt;
  String? updatedAt;
  User? user;
  bool? isFavorite;
  double? avgRating;
  int? price;

  Tutor(
      this.id,
      this.name,
      this.avatar,
      this.userId,
      this.video,
      this.bio,
      this.education,
      this.experience,
      this.profession,
      this.accent,
      this.targetStudent,
      this.interests,
      this.languages,
      this.specialties,
      this.resume,
      this.isActivated,
      this.isNative,
      this.createdAt,
      this.updatedAt,
      this.user,
      this.isFavorite,
      this.avgRating,
      this.price);

  
  void  ToString() {
    print("id: $id");
    print("name $name");

    print("ava $avatar");
    print("userid $userId");
    print("video $video");
    print("bio $bio");
    print("edu $education");
    print("experi $experience");
    print("profess $profession");
    print("accent $accent");
    print("target $targetStudent");
    print("interest $interests");
    print("lang $languages");
    print("spec $specialties");
    print("resume $resume");
    print("isactive $isActivated");
    print("isNative $isNative");
    print("createdAt $createdAt");
    print("updatedAt $updatedAt");
    print("user $user");
    print(" isFavorite $isFavorite");
    print("avgRating $avgRating");
    print("price $price");
  }
//   String? id;
//   String? userId;
//   String? video;
//   String? bio;
//   String? education;
//   String? experience;
//   String? profession;
//   String? accent;
//   String? targetStudent;
//   String? interests;
//   String? languages;
//   String? specialties;
//   String? resume;
//   bool? isActivated;
//   bool? isNative;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   User? user;
//   bool? isFavorite;
//   double? avgRating;
//   int? price;

//   Tutor(
//       this.id,
//       this.userId,
//       this.video,
//       this.bio,
//       this.education,
//       this.experience,
//       this.profession,
//       this.accent,
//       this.targetStudent,
//       this.interests,
//       this.languages,
//       this.specialties,
//       this.resume,
//       this.isActivated,
//       this.isNative,
//       this.createdAt,
//       this.updatedAt,
//       this.user,
//       this.isFavorite,
//       this.avgRating,
//       this.price);

  factory Tutor.fromJson(Map<String, dynamic> json) => _$TutorFromJson(json);
  Map<String, dynamic> toJson() => _$TutorToJson(this);
}
