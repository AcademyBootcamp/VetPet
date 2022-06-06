import 'package:dio/dio.dart';
import 'package:online_vet_flutter/model/constants.dart';
import 'package:online_vet_flutter/model/forgot_password.dart';
import 'package:online_vet_flutter/model/login_request.dart';
import 'package:online_vet_flutter/model/register_request.dart';
import 'package:online_vet_flutter/model/updater_fcm_req.dart';
import 'package:online_vet_flutter/network/api_response.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

abstract class ApiService {
  factory ApiService() {
    Dio dio = new Dio();
//    dio.interceptors.add(LogInterceptor(
//        responseBody: true,
//        error: true,
//        request: true,
//        requestBody: true,
//        requestHeader: true));
    dio.options = BaseOptions(receiveTimeout: 1155000, connectTimeout: 1155000);
    return _ApiService(dio, baseUrl: baseUrl);
  }

  static const Validate_Register = 1;

  @POST("/validateRegisterData")
  Future<ApiResponse> validateRegister(@Body() RegisterRequest req);

  static const REGISTER_USER = 2;

  @POST("/registerUser")
  Future<ApiResponse> userRegister(@Body() RegisterRequest req);

  static const LOGIN = 3;

  @POST("/login")
  Future<ApiResponse> login(@Body() LoginRequest req);

  static const FORGOT_PASSWORD = 4;

  @POST("/forgetPswd")
  Future<ApiResponse> forgotPassword(@Body() ForgotPasswordReq req);

  static const UPDATE_FCM = 5;

  @POST("/updateFcmId")
  Future<ApiResponse> updateFcm(@Body() UpdateFcmReq updateFcm);
}
