import 'package:json_annotation/json_annotation.dart';
import 'package:my_lettutor_app/models/user.dart';

part 'feedback.g.dart';

@JsonSerializable()
class MFeedback {
  String? id;
  String? bookingId;
  String? firstId;
  String? secondId;
  int? rating;
  String? content;
  DateTime? createdAt;
  DateTime? updatedAt;
  User? firstInfo;

  MFeedback(
      this.id,
      this.bookingId,
      this.firstId,
      this.secondId,
      this.rating,
      this.content,
      this.createdAt,
      this.updatedAt,
      this.firstInfo);

    factory MFeedback.fromJson(Map<String, dynamic> json) => _$MFeedbackFromJson(json);
  Map<String, dynamic> toJson() => _$MFeedbackToJson(this);
}
