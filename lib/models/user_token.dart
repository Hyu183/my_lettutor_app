import 'package:json_annotation/json_annotation.dart';
import 'package:my_lettutor_app/models/tokens.dart';
import 'package:my_lettutor_app/models/user.dart';

part 'user_token.g.dart';

@JsonSerializable()
class UserToken {
  User? user;
  Tokens? tokens;

  UserToken();

  factory UserToken.fromJson(Map<String, dynamic> json) => _$UserTokenFromJson(json);
  Map<String, dynamic> toJson() => _$UserTokenToJson(this);
}
