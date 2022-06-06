
import 'package:json_annotation/json_annotation.dart';

part 'user_profile.g.dart';

@JsonSerializable()
class UserProfile {
  String mobNo;
  String firstName;
  String lastName;
  String gender;
  String addressLine1;
  String addressLine2;
  String city;
  String state;
  String county;
  int postal_code;
  String email;
  String picUrl;
  String registerDt;
  String lastUpdateTime;
  String pswd;

  UserProfile();

  factory UserProfile.from(Map<String,dynamic> json)=>_$UserProfileFromJson(json);

  Map<String,dynamic> toJson()=>_$UserProfileToJson(this);

}
