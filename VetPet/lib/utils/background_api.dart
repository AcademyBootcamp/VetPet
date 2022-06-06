import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:online_vet_flutter/data/api_helper.dart';
import 'package:online_vet_flutter/data/api_request.dart';
import 'package:online_vet_flutter/data/api_service.dart';
import 'package:online_vet_flutter/model/updater_fcm_req.dart';
import 'package:online_vet_flutter/utils/user_prefrence.dart';

updateFcm() async {
  FirebaseMessaging().getToken().then((String token) async {
    UpdateFcmReq updateFcmReq = UpdateFcmReq();
    UserPrefrence prefrence = await UserPrefrence.getInstance();
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidDeviceInfo = await deviceInfo.androidInfo;
      updateFcmReq.deviceId = androidDeviceInfo.androidId;
      updateFcmReq.os = "android";
    } else {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      updateFcmReq.deviceId = iosInfo.identifierForVendor;
      updateFcmReq.os = "ios";
    }
    updateFcmReq.fcmId = token;
    updateFcmReq.mobNo = prefrence.getUserDetails().mobNo;

    ApiRequest request = ApiRequest();
    request.apiRequestData = updateFcmReq;
    request.requestType = ApiService.UPDATE_FCM;
    ApiHelper.getInstance().passData(request);
  });
}
