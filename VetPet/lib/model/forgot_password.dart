import 'package:json_annotation/json_annotation.dart';

part 'forgot_password.g.dart';

@JsonSerializable()
class ForgotPasswordReq {
  String mobNum;
  String otpIdentifier;
  String prefix;

  ForgotPasswordReq();

  factory ForgotPasswordReq.from(Map<String,dynamic> json)=>_$ForgotPasswordReqFromJson(json);

  Map<String,dynamic> toJson()=>_$ForgotPasswordReqToJson(this);
}
