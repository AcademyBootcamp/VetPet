import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:online_vet_flutter/model/constants.dart';
import 'package:online_vet_flutter/utils/dialog_utils.dart';


class WidgetUtils {
  static const email_type = 1;
  static const passwordType = 2;
  static const normatText = 3;
  static const phoneNumber = 4;

  static const ACTION_DONE = TextInputAction.done;
  static const ACTION_NEXT = TextInputAction.next;
  static const ACTION_SEARCH = TextInputAction.search;

  static const FORM_TYPE_UNDERLINE = 1;
  static const FORM_TYPE_BORDER = 2;

  static _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static TextInputAction getActionType(KEYBOARD_ACTION keyboardAction) {
    if (keyboardAction == KEYBOARD_ACTION.ACTION_DONE) {
      return ACTION_DONE;
    } else if (keyboardAction == KEYBOARD_ACTION.ACTION_NEXT) {
      return ACTION_NEXT;
    } else
      return ACTION_SEARCH;
  }

  static Widget inputField(BuildContext context, String title, int fieldType,
      TextInputAction action, TextEditingController controller,
      {String suffixIcon,
      Function(String) onSubmitted,
      FocusNode focusNode,
      FocusNode nextNode}) {
    return Container(
      margin: EdgeInsets.only(left: 25, top: 0),
      transform: Matrix4.translationValues(0.0, -10.0, 0.0),
      child: TextField(
        focusNode: focusNode,
        onSubmitted: (value) {
          onSubmitted(value);
          if (focusNode != null && nextNode != null)
            _fieldFocusChange(context, focusNode, nextNode);
        },
        style: new TextStyle(
          color: DialogUtils.getColor("96A7AF"),
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w700,
          fontSize: 18,
        ),
        keyboardType: (fieldType == email_type)
            ? TextInputType.emailAddress
            : (fieldType == passwordType)
                ? TextInputType.visiblePassword
                : (fieldType == phoneNumber)
                    ? TextInputType.phone
                    : TextInputType.text,
        obscureText: (fieldType == passwordType),
        showCursor: true,
        controller: controller,
        textInputAction: action,
        maxLines: 1,
        decoration: InputDecoration(
          suffixIcon: suffixIcon != null
              ? InkWell(
                  child: Image.asset(suffixIcon),
                  onTap: () {},
                )
              : null,
          contentPadding: EdgeInsets.symmetric(vertical: -10, horizontal: 5),
          hintText: title,
          hintStyle: TextStyle(
            color: DialogUtils.getColor("96A7AF"),
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.normal,
            fontSize: 18,
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: DialogUtils.getColor("949494")),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: DialogUtils.getColor("949494")),
          ),
        ),
      ),
    );
  }

  static Widget inputFieldBorder(BuildContext context, String title,
      int fieldType, TextInputAction action, TextEditingController controller,
      {Function(String) onSubmitted, FocusNode focusNode, FocusNode nextNode}) {
    return Container(
      child: TextField(
        focusNode: focusNode,
        onSubmitted: (value) {
          if (focusNode != null && nextNode != null)
            _fieldFocusChange(context, focusNode, nextNode);
          onSubmitted(value);
        },
        cursorColor: Colors.white,
        style: new TextStyle(
          color: DialogUtils.getColor("ffffff"),
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w700,
          fontSize: 18,
        ),
        keyboardType: (fieldType == email_type)
            ? TextInputType.emailAddress
            : (fieldType == passwordType)
                ? TextInputType.text
                : (fieldType == phoneNumber)
                    ? TextInputType.phone
                    : TextInputType.text,
        obscureText: (fieldType == passwordType),
        showCursor: true,
        controller: controller,
        textInputAction: action,
        maxLines: 1,
        decoration: InputDecoration(
          hintText: title,
          labelText: title,
          labelStyle: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white70),
          alignLabelWithHint: true,
          contentPadding: EdgeInsets.all(14),
          focusColor: Colors.white,
          border: OutlineInputBorder(
            gapPadding: 2,
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(
              color: DialogUtils.getRGGBO(255, 255, 255, 0.3),
              width: 1.0,
            ),
          ),
          hintStyle: TextStyle(
            color: DialogUtils.getColor("96A7AF"),
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.normal,
            fontSize: 18,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            gapPadding: 2,
            borderSide: BorderSide(color: Colors.white, width: 1.0),
          ),
          enabledBorder: OutlineInputBorder(
            gapPadding: 2,
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(
              color: DialogUtils.getRGGBO(255, 255, 255, 0.3),
              width: 1.0,
            ),
          ),
        ),
      ),
    );
  }
}
