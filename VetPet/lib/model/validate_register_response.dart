
import 'package:json_annotation/json_annotation.dart';

part 'validate_register_response.g.dart';

@JsonSerializable()
class ValidateRegisterResponse {
  int otpId;
  String otpValue;
  String mobNum;


  ValidateRegisterResponse();

  factory ValidateRegisterResponse.from(Map<String,dynamic> json)=>_$ValidateRegisterResponseFromJson(json);

  Map<String,dynamic> toJson()=>_$ValidateRegisterResponseToJson(this);

}
