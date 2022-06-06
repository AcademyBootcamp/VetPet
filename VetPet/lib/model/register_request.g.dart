// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterRequest _$RegisterRequestFromJson(Map<String, dynamic> json) {
  return RegisterRequest()
    ..email = json['email'] as String
    ..firstName = json['firstName'] as String
    ..lastName = json['lastName'] as String
    ..mobNum = json['mobNum'] as String
    ..otpIdentifier = json['otpIdentifier'] as String
    ..pswd = json['pswd'] as String
    ..otpId = json['otpId'] as int
    ..otpValue = json['otpValue'] as String
    ..prefix = json['prefix'] as String;
}

Map<String, dynamic> _$RegisterRequestToJson(RegisterRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'mobNum': instance.mobNum,
      'otpIdentifier': instance.otpIdentifier,
      'pswd': instance.pswd,
      'otpId': instance.otpId,
      'otpValue': instance.otpValue,
      'prefix': instance.prefix,
    };
