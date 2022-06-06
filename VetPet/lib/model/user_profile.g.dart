// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) {
  return UserProfile()
    ..mobNo = json['mobNo'] as String
    ..firstName = json['firstName'] as String
    ..lastName = json['lastName'] as String
    ..gender = json['gender'] as String
    ..addressLine1 = json['addressLine1'] as String
    ..addressLine2 = json['addressLine2'] as String
    ..city = json['city'] as String
    ..state = json['state'] as String
    ..county = json['county'] as String
    ..postal_code = json['postal_code'] as int
    ..email = json['email'] as String
    ..picUrl = json['picUrl'] as String
    ..registerDt = json['registerDt'] as String
    ..lastUpdateTime = json['lastUpdateTime'] as String
    ..pswd = json['pswd'] as String;
}

Map<String, dynamic> _$UserProfileToJson(UserProfile instance) =>
    <String, dynamic>{
      'mobNo': instance.mobNo,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'gender': instance.gender,
      'addressLine1': instance.addressLine1,
      'addressLine2': instance.addressLine2,
      'city': instance.city,
      'state': instance.state,
      'county': instance.county,
      'postal_code': instance.postal_code,
      'email': instance.email,
      'picUrl': instance.picUrl,
      'registerDt': instance.registerDt,
      'lastUpdateTime': instance.lastUpdateTime,
      'pswd': instance.pswd,
    };
