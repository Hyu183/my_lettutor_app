import 'package:json_annotation/json_annotation.dart';
import 'package:my_lettutor_app/models/user_schedule_detail_info.dart';

part 'user_schedule.g.dart';

@JsonSerializable()
class UserSchedule {
  int? createdAtTimeStamp;
  int? updatedAtTimeStamp;
  String? id;
  String? userId;
  String? scheduleDetailId;
  String? tutorMeetingLink;
  String? studentMeetingLink;
  String? studentRequest;
  String? tutorReview;
  int? scoreByTutor;
  String? createdAt;
  String? updatedAt;
  String? recordUrl;
  bool? isDeleted;
  UserScheduleDetailInfo? scheduleDetailInfo;
  bool? showRecordUrl;
  List<dynamic>? studentMaterials;

  UserSchedule(
      this.createdAtTimeStamp,
      this.updatedAtTimeStamp,
      this.id,
      this.userId,
      this.scheduleDetailId,
      this.tutorMeetingLink,
      this.studentMeetingLink,
      this.studentRequest,
      this.tutorReview,
      this.scoreByTutor,
      this.createdAt,
      this.updatedAt,
      this.recordUrl,
      this.isDeleted,
      this.scheduleDetailInfo,
      this.showRecordUrl,
      this.studentMaterials);
      factory UserSchedule.fromJson(Map<String, dynamic> json) =>
      _$UserScheduleFromJson(json);
  Map<String, dynamic> toJson() => _$UserScheduleToJson(this);
      }