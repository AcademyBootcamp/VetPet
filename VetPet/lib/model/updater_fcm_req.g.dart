// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'updater_fcm_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateFcmReq _$UpdateFcmReqFromJson(Map<String, dynamic> json) {
  return UpdateFcmReq()
    ..deviceId = json['deviceId'] as String
    ..fcmId = json['fcmId'] as String
    ..mobNo = json['mobNo'] as String
    ..os = json['os'] as String;
}

Map<String, dynamic> _$UpdateFcmReqToJson(UpdateFcmReq instance) =>
    <String, dynamic>{
      'deviceId': instance.deviceId,
      'fcmId': instance.fcmId,
      'mobNo': instance.mobNo,
      'os': instance.os,
    };
