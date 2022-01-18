// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_schedule_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserScheduleInfo _$UserScheduleInfoFromJson(Map<String, dynamic> json) =>
    UserScheduleInfo(
      json['date'] as String?,
      json['startTimestamp'] as int?,
      json['endTimestamp'] as int?,
      json['id'] as String?,
      json['tutorId'] as String?,
      json['startTime'] as String?,
      json['endTime'] as String?,
      json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      json['tutorInfo'] == null
          ? null
          : Tutor.fromJson(json['tutorInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserScheduleInfoToJson(UserScheduleInfo instance) =>
    <String, dynamic>{
      'date': instance.date,
      'startTimestamp': instance.startTimestamp,
      'endTimestamp': instance.endTimestamp,
      'id': instance.id,
      'tutorId': instance.tutorId,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'tutorInfo': instance.tutorInfo,
    };
