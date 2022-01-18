
import 'package:json_annotation/json_annotation.dart';
import 'package:my_lettutor_app/models/user_schedule_info.dart';

part 'user_schedule_detail_info.g.dart';

@JsonSerializable()
class UserScheduleDetailInfo {
  int? startPeriodTimestamp;
  int? endPeriodTimestamp;
  String? id;
  String? scheduleId;
  String? startPeriod;
  String? endPeriod;
  String? createdAt;
  String? updatedAt;
  UserScheduleInfo? scheduleInfo;

  UserScheduleDetailInfo(
      this.startPeriodTimestamp,
      this.endPeriodTimestamp,
      this.id,
      this.scheduleId,
      this.startPeriod,
      this.endPeriod,
      this.createdAt,
      this.updatedAt,
      this.scheduleInfo);
  factory UserScheduleDetailInfo.fromJson(Map<String, dynamic> json) =>
      _$UserScheduleDetailInfoFromJson(json);
  Map<String, dynamic> toJson() => _$UserScheduleDetailInfoToJson(this);
}
