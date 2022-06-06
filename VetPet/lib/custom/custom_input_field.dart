import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_vet_flutter/model/constants.dart';
import 'package:online_vet_flutter/utils/dialog_utils.dart';
import 'package:online_vet_flutter/utils/widget_utils.dart';

class CustomInputField extends StatefulWidget {
  @override
  CustomInputFieldState createState() => CustomInputFieldState();

  FORM_TYPE formType;
  KEYBOARD_ACTION keyboardAction;
  INPUT_TYPE input_type;
  TextEditingController controller;
  String title;
  String suffixIcon;
  Function(String) onSubmitted;
  FocusNode focusNode;
  FocusNode nextNode;
  int maxLength = -1;
  bool readOnly;
  bool enable;

  CustomInputField(this.formType, this.keyboardAction, this.input_type,
      this.controller, this.title,
      {this.suffixIcon,
      this.onSubmitted,
      this.focusNode,
      this.nextNode,
      this.readOnly = false,
      this.enable = true,
      this.maxLength});
}

_fieldFocusChange(
    BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
  currentFocus.unfocus();
  FocusScope.of(context).requestFocus(nextFocus);
}

class CustomInputFieldState extends State<CustomInputField> {
  bool isPassword = false;

  @override
  Widget build(BuildContext context) {
    if (widget.formType == FORM_TYPE.FORM_TYPE_UNDERLINE) {
      return Container(
        margin: EdgeInsets.only(left: 25, top: 0),
        transform: Matrix4.translationValues(0.0, -10.0, 0.0),
        child: TextField(
          readOnly: widget.readOnly,
          focusNode: widget.focusNode,
          onSubmitted: (value) {
            if (widget.focusNode != null && widget.nextNode != null)
              _fieldFocusChange(context, widget.focusNode, widget.nextNode);
            widget.onSubmitted(value);
          },
          style: new TextStyle(
            color: Colors.white,
            fontStyle: FontStyle.normal,
            fontSize: 18,
          ),
          keyboardType: (widget.input_type == INPUT_TYPE.email_type)
              ? TextInputType.emailAddress
              : (widget.input_type == INPUT_TYPE.passwordType)
                  ? TextInputType.visiblePassword
                  : (widget.input_type == INPUT_TYPE.phoneNumber)
                      ? TextInputType.phone
                      : TextInputType.text,
          obscureText: widget.input_type == INPUT_TYPE.passwordType
              ? !isPassword
              : false,
          showCursor: true,
          controller: widget.controller,
          textInputAction: WidgetUtils.getActionType(widget.keyboardAction),
          maxLines: 1,
          maxLength: widget.maxLength,
          decoration: InputDecoration(
            counter: Container(),
            counterText: '',
            counterStyle: TextStyle(fontSize: 0),
            suffixIcon: widget.input_type == INPUT_TYPE.passwordType
                ? widget.suffixIcon != null
                    ? InkWell(
                        child: Container(
                          width: 10,
                          height: 10,
                          padding: EdgeInsets.all(15),
                          child: !isPassword
                              ? Image.asset(
                                  widget.suffixIcon,
                                  fit: BoxFit.fitWidth,
                                )
                              : Image.asset('$imagePath/toogleEye.png',
                                  height: 15, width: 8, fit: BoxFit.fitWidth),
                        ),
                        onTap: () {
                          setState(() {
                            isPassword = !isPassword;
                          });
                        },
                      )
                    : null
                : null,
            hintText: widget.title,
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
    } else {
      return Container(
        child: TextField(
          readOnly: widget.readOnly,
          enabled: widget.enable,
          focusNode: widget.focusNode,
          maxLength: widget.maxLength,
          onSubmitted: (value) {
            if (widget.focusNode != null && widget.nextNode != null)
              _fieldFocusChange(context, widget.focusNode, widget.nextNode);
            widget.onSubmitted(value);
          },
          cursorColor: Colors.white,
          style: new TextStyle(
            color: DialogUtils.getColor("ffffff"),
            fontStyle: FontStyle.normal,
            fontSize: 18,
          ),
          keyboardType: (widget.input_type == INPUT_TYPE.email_type)
              ? TextInputType.emailAddress
              : (widget.input_type == INPUT_TYPE.passwordType)
                  ? TextInputType.visiblePassword
                  : (widget.input_type == INPUT_TYPE.phoneNumber)
                      ? TextInputType.phone
                      : (widget.input_type == INPUT_TYPE.multiline)
                          ? TextInputType.multiline
                          : TextInputType.text,
          obscureText: widget.input_type == INPUT_TYPE.passwordType
              ? !isPassword
              : false,
          showCursor: true,
          controller: widget.controller,
          textInputAction: WidgetUtils.getActionType(widget.keyboardAction),
          maxLines: 1,
          decoration: InputDecoration(
            hintText: widget.title,
            labelText: widget.title,
            labelStyle: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.white70),
            alignLabelWithHint: true,
            contentPadding: EdgeInsets.all(14),
            focusColor: Colors.white,
            fillColor: Colors.black,
            filled: true,
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
            counter: Container(),
            counterText: '',
            counterStyle: TextStyle(fontSize: 0),
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
            suffixIcon: widget.input_type == INPUT_TYPE.passwordType
                ? widget.suffixIcon != null
                    ? InkWell(
                        child: Container(
                          width: 10,
                          height: 10,
                          padding: EdgeInsets.all(15),
                          child: !isPassword
                              ? Image.asset(widget.suffixIcon)
                              : Image.asset('$imagePath/toogleEye.png'),
                        ),
                        onTap: () {
                          setState(() {
                            isPassword = !isPassword;
                          });
                        },
                      )
                    : null
                : null,
          ),
        ),
      );
    }
  }
}
