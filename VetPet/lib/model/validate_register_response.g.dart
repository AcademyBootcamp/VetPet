// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'validate_register_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ValidateRegisterResponseFromJson(Map<String, dynamic> json) {
  return ValidateRegisterResponse()
    ..otpId = json['otpId'] as int
    ..otpValue = json['otpValue'] as String
    ..mobNum = json['mobNum'] as String;
}

Map<String, dynamic> _$ValidateRegisterResponseToJson(
        ValidateRegisterResponse instance) =>
    <String, dynamic>{
      'otpId': instance.otpId,
      'otpValue': instance.otpValue,
      'mobNum': instance.mobNum,
    };
