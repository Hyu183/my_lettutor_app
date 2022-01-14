import 'package:json_annotation/json_annotation.dart';
import 'package:my_lettutor_app/models/feedback.dart';
import 'package:my_lettutor_app/models/tutor.dart';
import 'package:my_lettutor_app/models/wallet_info.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  String? id;
  String? email;
  String? name;
  String? avatar;
  String? country;
  String? phone;
  List<String>? roles;
  String? language;
  String? birthday;
  bool? isActivated;
  WalletInfo? walletInfo;
  //List<Null>? courses;
  String? requireNote;
  String? level;
//   List<Null>? learnTopics;
//   List<Null>? testPreparations;
  bool? isPhoneActivated;
  int? timezone;
  Tutor? tutorInfo;
  List<MFeedback>? feedbacks;
  User(
      this.id,
      this.email,
      this.name,
      this.avatar,
      this.country,
      this.phone,
      this.roles,
      this.language,
      this.birthday,
      this.isActivated,
      this.walletInfo,
      //   this.courses,
      this.requireNote,
      this.level,
      //   this.learnTopics,
      //   this.testPreparations,
      this.isPhoneActivated,
      this.timezone,
      this.tutorInfo,this.feedbacks);
//   String? id;
//   String? email;
//   String? name;
//   String? avatar;
//   String? country;
//   String? phone;
//   List<String>? roles;
//   String? language;
//   DateTime? birthday;
//   bool? isActivated;
//   WalletInfo? walletInfo;
// //   List<Null>? courses;
//   String? requireNote;
//   String? level;
//   List<Feedback>? feedbacks;
//   //List<LearnTopics>? learnTopics;
//   //List<TestPreparations>? testPreparations;
//   bool? isPhoneActivated;
//   int? timezone;
//   Tutor? tutorInfo;
//   User(
//       this.id,
//       this.email,
//       this.name,
//       this.avatar,
//       this.country,
//       this.phone,
//       this.roles,
//       this.language,
//       this.birthday,
//       this.isActivated,
//       this.walletInfo,
//       //   this.courses,
//       this.requireNote,
//       this.level,
//       this.feedbacks,
//       //this.learnTopics,
//       //this.testPreparations,
//       this.isPhoneActivated,
//       this.timezone);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
