// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginRequest _$LoginRequestFromJson(Map<String, dynamic> json) {
  return LoginRequest()
    ..mobNum = json['mobNum'] as String
    ..pswd = json['pswd'] as String;
}

Map<String, dynamic> _$LoginRequestToJson(LoginRequest instance) =>
    <String, dynamic>{
      'mobNum': instance.mobNum,
      'pswd': instance.pswd,
    };
