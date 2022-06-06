import 'package:json_annotation/json_annotation.dart';

part 'updater_fcm_req.g.dart';

@JsonSerializable()
class UpdateFcmReq {
  String deviceId;
  String fcmId;
  String mobNo;
  String os;

  UpdateFcmReq();

  factory UpdateFcmReq.from(Map<String, dynamic> json) =>
      _$UpdateFcmReqFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateFcmReqToJson(this);
}
