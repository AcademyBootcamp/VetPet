import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_vet_flutter/custom/custom_input_field.dart';
import 'package:online_vet_flutter/data/api_helper.dart';
import 'package:online_vet_flutter/data/api_request.dart';
import 'package:online_vet_flutter/data/api_service.dart';
import 'package:online_vet_flutter/model/constants.dart';
import 'package:online_vet_flutter/model/login_request.dart';
import 'package:online_vet_flutter/model/register_cache.dart';
import 'package:online_vet_flutter/model/register_request.dart';
import 'package:online_vet_flutter/model/user_profile.dart';
import 'package:online_vet_flutter/model/validate_register_response.dart';
import 'package:online_vet_flutter/utils/background_api.dart';
import 'package:online_vet_flutter/utils/dialog_utils.dart';
import 'package:online_vet_flutter/utils/user_prefrence.dart';
import 'package:sms_autofill/sms_autofill.dart';

class LoginScreen extends StatefulWidget {
  USER_FLOW flow;

  LoginScreen(this.flow);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  Widget _submitButton() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: Offset(
                0.2,
                1.0,
              ),
              color: DialogUtils.getColor("000000"),
              blurRadius: 3.0,
            ),
          ],
          borderRadius: BorderRadius.all(Radius.circular(12)),
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Colors.blue, Colors.red])),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            '$sign_in',
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Container(
            child: SvgPicture.asset('$imagePath/back.svg'),
            margin: EdgeInsets.only(left: 10),
          )
        ],
      ),
    );
  }

  Widget createAccount() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        color: DialogUtils.getColor("625B39"),
        boxShadow: [
          BoxShadow(
            offset: Offset(
              0.2,
              1.0,
            ),
            color: DialogUtils.getColor("000000"),
            blurRadius: 3.0,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            '$create_account',
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: DialogUtils.getColor("F29F41")),
          )
        ],
      ),
    );
  }

  TextEditingController mobileController;
  TextEditingController passwordController;
  AnimationController _controller;
  Animation<Offset> _slideAnimation;
  final FocusNode loginNode = FocusNode();
  final FocusNode passwordNode = FocusNode();

  @override
  void initState() {
    super.initState();
    mobileController = new TextEditingController();
    passwordController = new TextEditingController();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1100),
      vsync: this,
    );
    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.2), end: const Offset(0, 0))
            .animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    mobileController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () {
        if (widget.flow != null && widget.flow == USER_FLOW.USER) {
          DialogUtils.navigationTransactionUpto(context, home);
        } else {
          SystemNavigator.pop();
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        resizeToAvoidBottomPadding: false,
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('$imagePath/background.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 180,
                  child: Image.asset(
                    '$imagePath/top_banner.png',
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  height: 9,
                ),
                Divider(
                  thickness: 6,
                  color: DialogUtils.getRGGBO(148, 1488, 148, 0.05),
                  height: 4,
                ),
                Container(
                  margin: EdgeInsets.only(left: 28, top: 18),
                  child: Text(
                    "$welcome",
                    style: Theme.of(context).textTheme.headline,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 28),
                  child: Text(
                    '$sing_in_to_continue',
                    style: Theme.of(context).textTheme.subhead,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 28, top: 30),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        width: 28,
                        height: 35,
                        child: SvgPicture.asset('$imagePath/contact.svg',
                            fit: BoxFit.fill),
                      ),
                      Expanded(
                        child: CustomInputField(
                          FORM_TYPE.FORM_TYPE_UNDERLINE,
                          KEYBOARD_ACTION.ACTION_NEXT,
                          INPUT_TYPE.phoneNumber,
                          mobileController,
                          "$mobile_number",
                          maxLength: 10,
                          focusNode: loginNode,
                          nextNode: passwordNode,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 28, top: 5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        width: 28,
                        height: 35,
                        child: SvgPicture.asset('$imagePath/lock.svg',
                            fit: BoxFit.fill),
                      ),
                      Expanded(
                        child: CustomInputField(
                          FORM_TYPE.FORM_TYPE_UNDERLINE,
                          KEYBOARD_ACTION.ACTION_DONE,
                          INPUT_TYPE.passwordType,
                          passwordController,
                          "$password",
                          suffixIcon: "$imagePath/Eye.png",
                          focusNode: passwordNode,
                          onSubmitted: (value) {
                            if (validateLogin()) {
                              checkLogin();
                            }
                          },
                        ),
                      )
                    ],
                  ),
                ),
                Align(
                  child: InkWell(
                    onTap: () {
                      DialogUtils.navigationTransaction(
                          context, forgotpassword, null, false);
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 5),
                      padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                      child: Text(
                        "$forgot_password",
                        style: TextStyle(
                            color: DialogUtils.getColor("96A7AF"),
                            fontSize: 13,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  alignment: Alignment.centerRight,
                ),
                Container(
                  margin: EdgeInsets.only(top: 15),
                  child: Align(
                    child: InkWell(
                      onTap: () {
                        if (validateLogin()) {
                          checkLogin();
                        }
                      },
                      child: Container(
                        width: 250.0,
                        height: 40,
                        child: _submitButton(),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  child: Align(
                    child: InkWell(
                      onTap: () {
                        DialogUtils.navigationTransaction(
                            context, register, widget.flow, true);
                      },
                      child: Container(
                        width: 250.0,
                        height: 40,
                        child: createAccount(),
                      ),
                    ),
                    alignment: Alignment.center,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    DialogUtils.navigationTransactionUpto(context, home);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool validateLogin() {
    DialogUtils.hideKeyboard(context);
    if (mobileController.text.length != 10) {
      DialogUtils.showToast(please_enter_mobile_number);
      return false;
    } else if (passwordController.text.length < 6) {
      DialogUtils.showToast("$password_min_length");
      return false;
    }
    return true;
  }

  void checkLogin() async {
    await DialogUtils.showProgress(context, false);
    LoginRequest req = LoginRequest();
    req.mobNum = mobileController.text;
    req.pswd = passwordController.text;

    ApiRequest request = ApiRequest();
    request.apiRequestData = req;
    request.requestType = ApiService.LOGIN;
//    ApiHelper.getInstance().passData(request);
    ApiHelper.getInstance().passData(request).then((res) async {
      DialogUtils.dismissProgress();
      if (res.statusCode == 200) {
        UserProfile response = res.data as UserProfile;
        UserPrefrence prefrence = await UserPrefrence.getInstance();
        prefrence.setUserData(response);
        updateFcm();
      } else {
        DialogUtils.showToast(res.message);
      }
    }).catchError((onError) {
      //  print(onError);
      DialogUtils.dismissProgress();
      DialogUtils.showToast(
          "Some error occured.Please try again after sometime");
    });
  }

  void forgotPassword(String mobileNum) async {
    await DialogUtils.showProgress(context, false);
    RegisterRequest req = RegisterRequest();
    req.mobNum = mobileNum;
    req.prefix = prefixMob;
    req.otpIdentifier = await SmsAutoFill().getAppSignature;
    ApiRequest request = ApiRequest();
    request.apiRequestData = req;
    request.requestType = ApiService.FORGOT_PASSWORD;
    ApiHelper.getInstance().passData(request).then((res) {
      DialogUtils.dismissProgress();
      if (res.statusCode == 200) {
        ValidateRegisterResponse response =
            res.data as ValidateRegisterResponse;
        RegisterCache cache = RegisterCache();
        cache.validateRegisterResponse = response;
        cache.registerRequest = req;
        cache.userFlow = USER_FLOW.FORGOT_PASSWORD;
        DialogUtils.popScreen(context);
        DialogUtils.navigationTransaction(context, otp, cache, false);
      } else {
        DialogUtils.showToast(res.message);
      }
    }).catchError((onError) {
      DialogUtils.dismissProgress();
      DialogUtils.showToast(
          "Some error occured.Please try again after sometime");
      //  print(onError);
    });
  }
}
