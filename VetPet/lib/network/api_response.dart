import 'package:json_annotation/json_annotation.dart';

//part 'api_response.g.dart';

//@JsonSerializable()
class ApiResponse<T> {
  int statusCode;
  String message;

  ApiResponse();

  T data;

  factory ApiResponse.fromJson(Map<String, dynamic> parsedJson) {
    //   print(parsedJson);
    var response = ApiResponse();
    response.message = parsedJson['message'];
    response.statusCode = parsedJson['statusCode'];
//    if (response.data is ValidateRegisterResponse)
    response.data = parsedJson['data'];
    return response;
  }
}
