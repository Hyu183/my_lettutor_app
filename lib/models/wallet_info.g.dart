// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WalletInfo _$WalletInfoFromJson(Map<String, dynamic> json) => WalletInfo(
      json['id'] as String?,
      json['userId'] as String?,
      json['amount'] as String?,
      json['isBlocked'] as bool?,
      json['createdAt'] as String?,
      json['updatedAt'] as String?,
      json['bonus'] as int?,
    );

Map<String, dynamic> _$WalletInfoToJson(WalletInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'amount': instance.amount,
      'isBlocked': instance.isBlocked,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'bonus': instance.bonus,
    };
