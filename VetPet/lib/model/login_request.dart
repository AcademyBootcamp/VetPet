
import 'package:json_annotation/json_annotation.dart';

part 'login_request.g.dart';

@JsonSerializable()
class LoginRequest {
  String mobNum;
  String pswd;

  LoginRequest();

  factory LoginRequest.from(Map<String,dynamic> json)=>_$LoginRequestFromJson(json);

  Map<String,dynamic> toJson()=>_$LoginRequestToJson(this);

}
