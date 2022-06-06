import 'dart:convert';

import 'package:online_vet_flutter/model/constants.dart';
import 'package:online_vet_flutter/model/user_profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPrefrence {
  static SharedPreferences preferences;

  static Future<UserPrefrence> getInstance() async {
    if (preferences == null)
      preferences = await SharedPreferences.getInstance();
    return UserPrefrence();
  }

  void setUserData(UserProfile profile) {
    preferences.setString(USER_PREF, jsonEncode(profile.toJson()));
  }

  void clearData() {
    preferences.clear();
  }

  UserProfile getUserDetails() {
    String user = preferences.getString(USER_PREF);
    if (user != null) {
      return UserProfile.from(jsonDecode(user));
    } else {
      return null;
    }
  }
}
