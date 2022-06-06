import 'package:connectivity/connectivity.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:online_vet_flutter/custom/custom_alert.dart';
import 'package:online_vet_flutter/custom/custom_input_field.dart';
import 'package:online_vet_flutter/custom/dialog_btn.dart';
import 'package:online_vet_flutter/model/constants.dart';
import 'package:online_vet_flutter/utils/alert_style.dart';
import 'package:progress_dialog/progress_dialog.dart';

class DialogUtils {
  static ProgressDialog pr;

  static Future<void> getForgotPasswordPopup(
    BuildContext context,
    Function(BUTTON_ACTION_TYPE button_type, String mobileNum) action,
  ) {
    TextEditingController controller = new TextEditingController();
    showGeneralDialog<void>(
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: getColor("ffffff"),
      transitionDuration: Duration(milliseconds: 400),
      context: context,
      pageBuilder: (BuildContext buildContext, Animation<double> animation,
          Animation<double> secondaryAnimation) {},
      transitionBuilder: (context, a1, a2, widget) {
        return Transform.scale(
          scale: a1.value,
          child: Opacity(
            opacity: a1.value,
            child: WillPopScope(
              onWillPop: () async => true,
              child: SimpleDialog(
                elevation: 6,
                title: Text(
                  forgot_password_heading,
                  style: TextStyle(fontSize: 18, color: getColor("f29f41")),
                ),
                backgroundColor: DialogUtils.getColor("0b0b0b"),
                children: <Widget>[
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 10, right: 10),
                        child: CustomInputField(
                          FORM_TYPE.FORM_TYPE_BORDER,
                          KEYBOARD_ACTION.ACTION_DONE,
                          INPUT_TYPE.phoneNumber,
                          controller,
                          "$phone_number",
                          maxLength: 10,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            FlatButton(
                              child: Text(cancel),
                              color: Colors.blueAccent,
                              textColor: Colors.white,
                              onPressed: () {
                                action(BUTTON_ACTION_TYPE.BUTTON_CANCEL, null);
                              },
                            ),
                            SizedBox(
                              width: 9,
                            ),
                            FlatButton(
                              child: Text('Validate'),
                              color: Colors.blueAccent,
                              textColor: Colors.white,
                              onPressed: () {
                                action(BUTTON_ACTION_TYPE.BUTTON_SUBMIT,
                                    controller.text);
                              },
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static showAlert(BuildContext context, String title, String subTitle,
      Function(BUTTON_ACTION_TYPE button_action_type) action) {
    Alert(
      context: context,
      type: AlertType.success,
      title: title,
      desc: subTitle,
      style: AlertStyle(isCloseButton: false),
      buttons: [
        DialogButton(
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Colors.blue, Colors.red]),
          child: Text(
            ok,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => action(BUTTON_ACTION_TYPE.BUTTON_SUBMIT),
          width: 120,
        )
      ],
    ).show();
  }

  static showLogout(BuildContext context, String title, String subTitle,
      Function(BUTTON_ACTION_TYPE button_action_type) action) {
    Alert(
      context: context,
      type: AlertType.success,
      title: title,
      desc: subTitle,
      style:
          AlertStyle(isCloseButton: false, animationType: AnimationType.shrink),
      buttons: [
        DialogButton(
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Colors.blue, Colors.red]),
          child: Text(
            cancel,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => action(BUTTON_ACTION_TYPE.BUTTON_CANCEL),
          width: 120,
        ),
        DialogButton(
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Colors.blue, Colors.red]),
          child: Text(
            logout,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => action(BUTTON_ACTION_TYPE.BUTTON_SUBMIT),
          width: 120,
        )
      ],
    ).show();
  }

  static emptyDataDialog(BuildContext context, String title, String subTitle,
      Function(BUTTON_ACTION_TYPE button_action_type) action) {
    Alert(
      context: context,
      type: AlertType.success,
      title: title,
      desc: subTitle,
      style: AlertStyle(
          isCloseButton: false,
          animationType: AnimationType.shrink,
          isOverlayTapDismiss: false),
      buttons: [
        DialogButton(
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Colors.blue, Colors.red]),
          child: Text(
            ok,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => action(BUTTON_ACTION_TYPE.BUTTON_SUBMIT),
          width: 120,
        ),
      ],
    ).show();
  }

  static showProgress(BuildContext context, bool isDismiss) async {
    pr = new ProgressDialog(context,
        type: ProgressDialogType.Normal, isDismissible: isDismiss);
    pr.style(message: "Loading...");
    await pr.show();
  }

  static getAppBar(BuildContext context, {String heading}) {
    return AppBar(
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
          size: 16,
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
      title: heading == null
          ? Container()
          : Text(
              heading,
              style: TextStyle(color: Colors.white),
            ),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
    );
  }

  static dismissProgress() {
    if (pr != null) {
      pr.hide();
    }
  }

  static showSnackbar(BuildContext context, String msg) {
    final snackBar = SnackBar(
      content: Text(msg),
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }

  static bool validateEmailId(String email) {
    return EmailValidator.validate(email);
  }

  static Future navigationTransaction(
      BuildContext context, String name, Object parameter, bool isReplace) {
    if (isReplace) {
      return Navigator.of(context)
          .pushReplacementNamed(name, arguments: parameter);
    } else {
      return Navigator.of(context).pushNamed(name, arguments: parameter);
    }
  }

  static Future navigationTransactionUpto(BuildContext context, String name) {
    return Navigator.of(context)
        .pushNamedAndRemoveUntil(name, (Route<dynamic> route) => false);
  }

  static popUpto(BuildContext context, String name) {
    Navigator.popUntil(context, ModalRoute.withName(name));
  }

  static Color getColor(String color) {
    return Color(int.parse("0xff" + color));
  }

  static Color getRGGBO(int r, int g, int b, double opacity) {
    return Color.fromRGBO(r, g, b, opacity);
  }

  static Widget getSvgImageWithBound(String image,
      {double picHeight, double picWidth}) {
    SvgPicture.asset(image,
        fit: BoxFit.fill,
        height: picHeight,
        width: picWidth,
        semanticsLabel: 'Acme Logo');
  }

  static Widget getSvgImage(String image) {
    SvgPicture.asset(image, fit: BoxFit.fill, semanticsLabel: 'Acme Logo');
  }

  static hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  static void showToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black87,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static Future<bool> checkInternet() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult != null) {
      return true;
    } else
      return false;
  }

  static void popScreen(BuildContext context, {Object data}) {
    Navigator.of(context).pop(data);
  }
}
