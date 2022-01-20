// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MFeedback _$MFeedbackFromJson(Map<String, dynamic> json) => MFeedback(
      json['id'] as String?,
      json['bookingId'] as String?,
      json['firstId'] as String?,
      json['secondId'] as String?,
      json['rating'] as num?,
      json['content'] as String?,
      json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      json['firstInfo'] == null
          ? null
          : User.fromJson(json['firstInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MFeedbackToJson(MFeedback instance) => <String, dynamic>{
      'id': instance.id,
      'bookingId': instance.bookingId,
      'firstId': instance.firstId,
      'secondId': instance.secondId,
      'rating': instance.rating,
      'content': instance.content,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'firstInfo': instance.firstInfo,
    };
