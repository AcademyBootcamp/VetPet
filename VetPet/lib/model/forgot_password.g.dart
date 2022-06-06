// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forgot_password.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForgotPasswordReq _$ForgotPasswordReqFromJson(Map<String, dynamic> json) {
  return ForgotPasswordReq()
    ..mobNum = json['mobNum'] as String
    ..otpIdentifier = json['otpIdentifier'] as String
    ..prefix = json['prefix'] as String;
}

Map<String, dynamic> _$ForgotPasswordReqToJson(ForgotPasswordReq instance) =>
    <String, dynamic>{
      'mobNum': instance.mobNum,
      'otpIdentifier': instance.otpIdentifier,
      'prefix': instance.prefix,
    };
