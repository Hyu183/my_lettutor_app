// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tutor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tutor _$TutorFromJson(Map<String, dynamic> json) => Tutor(
      json['id'] as String?,
      json['name'] as String?,
      json['avatar'] as String?,
      json['userId'] as String?,
      json['video'] as String?,
      json['bio'] as String?,
      json['education'] as String?,
      json['experience'] as String?,
      json['profession'] as String?,
      json['accent'] as String?,
      json['targetStudent'] as String?,
      json['interests'] as String?,
      json['languages'] as String?,
      json['specialties'] as String?,
      json['resume'] as String?,
      json['isActivated'] as bool?,
      json['isNative'] as bool?,
      json['createdAt'] as String?,
      json['updatedAt'] as String?,
      json['User'] == null
          ? null
          : User.fromJson(json['User'] as Map<String, dynamic>),
      json['isFavorite'] as bool?,
      (json['avgRating'] as num?)?.toDouble(),
      json['price'] as int?,
    );

Map<String, dynamic> _$TutorToJson(Tutor instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'avatar': instance.avatar,
      'userId': instance.userId,
      'video': instance.video,
      'bio': instance.bio,
      'education': instance.education,
      'experience': instance.experience,
      'profession': instance.profession,
      'accent': instance.accent,
      'targetStudent': instance.targetStudent,
      'interests': instance.interests,
      'languages': instance.languages,
      'specialties': instance.specialties,
      'resume': instance.resume,
      'isActivated': instance.isActivated,
      'isNative': instance.isNative,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'user': instance.user,
      'isFavorite': instance.isFavorite,
      'avgRating': instance.avgRating,
      'price': instance.price,
    };
