import 'package:json_annotation/json_annotation.dart';

part 'register_request.g.dart';

@JsonSerializable()
class RegisterRequest {
  String email;
  String firstName;
  String lastName;
  String mobNum;
  String otpIdentifier;
  String pswd;
  int otpId;
  String otpValue;
  String prefix;

  RegisterRequest();

  factory RegisterRequest.from(Map<String,dynamic> json)=>_$RegisterRequestFromJson(json);

  Map<String,dynamic> toJson()=>_$RegisterRequestToJson(this);
}
