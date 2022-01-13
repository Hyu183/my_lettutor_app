// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      json['id'] as String?,
      json['email'] as String?,
      json['name'] as String?,
      json['avatar'] as String?,
      json['country'] as String?,
      json['phone'] as String?,
      (json['roles'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['language'] as String?,
      json['birthday'] == null
          ? null
          : DateTime.parse(json['birthday'] as String),
      json['isActivated'] as bool?,
      json['walletInfo'] == null
          ? null
          : WalletInfo.fromJson(json['walletInfo'] as Map<String, dynamic>),
      json['requireNote'] as String?,
      json['level'] as String?,
      json['isPhoneActivated'] as bool?,
      json['timezone'] as int?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'avatar': instance.avatar,
      'country': instance.country,
      'phone': instance.phone,
      'roles': instance.roles,
      'language': instance.language,
      'birthday': instance.birthday?.toIso8601String(),
      'isActivated': instance.isActivated,
      'walletInfo': instance.walletInfo,
      'requireNote': instance.requireNote,
      'level': instance.level,
      'isPhoneActivated': instance.isPhoneActivated,
      'timezone': instance.timezone,
    };
