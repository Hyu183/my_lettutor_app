import 'package:json_annotation/json_annotation.dart';
import 'package:my_lettutor_app/models/schedule_detail.dart';

part 'schedule.g.dart';

@JsonSerializable()
class Schedule {
  String? id;
  String? tutorId;
  String? startTime;
  String? endTime;
  int? startTimestamp;
  int? endTimestamp;
  String? createdAt;
  bool? isBooked;
  List<ScheduleDetail>? scheduleDetails;

  Schedule(
      this.id,
      this.tutorId,
      this.startTime,
      this.endTime,
      this.startTimestamp,
      this.endTimestamp,
      this.createdAt,
      this.isBooked,
      this.scheduleDetails);

    factory Schedule.fromJson(Map<String, dynamic> json) => _$ScheduleFromJson(json);
  Map<String, dynamic> toJson() => _$ScheduleToJson(this);
}