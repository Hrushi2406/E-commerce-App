import 'package:flutter/material.dart';
import 'package:furnitur/core/ui_helper/ui_helper.dart';

class ReusableTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final bool isObscureText;
  final Function validator;
  final TextInputType type;
  final TextInputAction action;
  final String error;

  const ReusableTextFormField({
    Key key,
    @required this.controller,
    @required this.labelText,
    @required this.isObscureText,
    @required this.validator,
    this.type,
    this.action,
    this.error = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: labelText,
        contentPadding: EdgeInsets.only(
          left: sWidth(12.0),
          top: sHeight(11.0),
          bottom: sHeight(11.0),
        ),
        errorText: error.isEmpty ? null : error,
      ),
      cursorColor: kOrangeColor,
      keyboardType: type,
      obscureText: isObscureText,
      textInputAction: action,
      style: kRegularText,
    );
  }
}

class ReusableSmallTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final Function validator;
  final bool isMultiline;
  final String error;
  final TextInputType type;

  const ReusableSmallTextFormField({
    Key key,
    @required this.controller,
    @required this.labelText,
    @required this.validator,
    @required this.isMultiline,
    this.type,
    this.error,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          horizontal: sWidth(12.0),
          vertical: sHeight(15.0),
        ),
        border: OutlineInputBorder(),
        labelText: isMultiline ? null : labelText,
        hintText: isMultiline ? labelText : null,
        isDense: true,
        errorText: error,
      ),
      cursorColor: kOrangeColor,
      keyboardType: type,
      style: TextStyle(
        color: kBrownColor,
        fontSize: sSp(12.0),
      ),
      maxLines: isMultiline ? 3 : 1,
      textAlign: TextAlign.left,
    );
  }
}
