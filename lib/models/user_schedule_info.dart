import 'package:json_annotation/json_annotation.dart';
import 'package:my_lettutor_app/models/tutor.dart';

part 'user_schedule_info.g.dart';

@JsonSerializable()
class UserScheduleInfo {
  String? date;
  int? startTimestamp;
  int? endTimestamp;
  String? id;
  String? tutorId;
  String? startTime;
  String? endTime;
  DateTime? createdAt;
  DateTime? updatedAt;
  Tutor? tutorInfo;

  UserScheduleInfo(
      this.date,
      this.startTimestamp,
      this.endTimestamp,
      this.id,
      this.tutorId,
      this.startTime,
      this.endTime,
      this.createdAt,
      this.updatedAt,
      this.tutorInfo);

       factory UserScheduleInfo.fromJson(Map<String, dynamic> json) =>
      _$UserScheduleInfoFromJson(json);
  Map<String, dynamic> toJson() => _$UserScheduleInfoToJson(this);
}
