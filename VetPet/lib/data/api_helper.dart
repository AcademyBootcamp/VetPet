import 'package:online_vet_flutter/model/user_profile.dart';
import 'package:online_vet_flutter/model/validate_register_response.dart';
import 'package:online_vet_flutter/network/api_response.dart';

import 'api_request.dart';
import 'api_service.dart';

class ApiHelper {
  static ApiHelper helper;

  static ApiHelper getInstance() {
    if (helper == null) helper = new ApiHelper();
    return helper;
  }

  Future<ApiResponse> passData(ApiRequest request) async {
    switch (request.requestType) {
      case ApiService.Validate_Register:
        return await _getRegisterData(request);
        break;
      case ApiService.REGISTER_USER:
        return await _userRegister(request);
        break;
      case ApiService.LOGIN:
        return await _userLogin(request);
        break;
//      case ApiService.FORGOT_PASSWORD:
//        return await _forgotPassword(request);
//        break;
    }
  }

  Future<ApiResponse> _getRegisterData(ApiRequest request) async {
    ApiResponse response =
        await ApiService().validateRegister(request.apiRequestData);
    return _parsingData(request.requestType, response);
  }

  Future<ApiResponse> _userRegister(ApiRequest request) async {
    ApiResponse response =
        await ApiService().userRegister(request.apiRequestData);
    return _parsingData(request.requestType, response);
  }

  _userLogin(ApiRequest request) async {
    ApiResponse response = await ApiService().login(request.apiRequestData);
    return _parsingData(request.requestType, response);
  }

//  _forgotPassword(ApiRequest request) async {
//    ApiResponse response =
//        await ApiService().forgotPassword(request.apiRequestData);
//    return _parsingData(request.requestType, response);
//  }

  ApiResponse _parsingData(int type, ApiResponse response) {
    response.data = (_parseDatafromJson(type, response.data));
    return response;
  }

  T _parseDatafromJson<T, K>(int type, dynamic json) {
    if (json == null) {
      return null;
    } else if (json is Iterable) {
      return List.from(_fromJsonList(type, json)) as T;
    } else if (type == ApiService.Validate_Register) {
      return ValidateRegisterResponse.from(json) as T;
    } else if (type == ApiService.REGISTER_USER || type == ApiService.LOGIN) {
      return UserProfile.from(json) as T;
    } else if (type == ApiService.FORGOT_PASSWORD) {
      return ValidateRegisterResponse.from(json) as T;
    } else {
      return json as T;
    }
  }

  List<K> _fromJsonList<K>(int type, List jsonList) {
    if (jsonList == null) {
      return null;
    }

    List<K> output = List();

    for (Map<String, dynamic> json in jsonList) {
      output.add(_parseDatafromJson(type, json));
    }
    return output;
  }
}
