import 'package:online_vet_flutter/model/constants.dart';
import 'package:online_vet_flutter/model/forgot_password.dart';
import 'package:online_vet_flutter/model/register_request.dart';
import 'package:online_vet_flutter/model/validate_register_response.dart';

class RegisterCache {
  RegisterRequest registerRequest;
  ForgotPasswordReq forgotPasswordReq;
  ValidateRegisterResponse validateRegisterResponse;
  USER_FLOW userFlow;
}
