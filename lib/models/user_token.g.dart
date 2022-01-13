// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserToken _$UserTokenFromJson(Map<String, dynamic> json) => UserToken()
  ..user = json['user'] == null
      ? null
      : User.fromJson(json['user'] as Map<String, dynamic>)
  ..tokens = json['tokens'] == null
      ? null
      : Tokens.fromJson(json['tokens'] as Map<String, dynamic>);

Map<String, dynamic> _$UserTokenToJson(UserToken instance) => <String, dynamic>{
      'user': instance.user,
      'tokens': instance.tokens,
    };
