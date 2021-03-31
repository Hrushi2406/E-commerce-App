import 'package:flutter/material.dart';
import 'package:furnitur/core/ui_helper/ui_helper.dart';

class ReusableLoginButton extends StatelessWidget {
  final Function onPressed;
  final String title;

  const ReusableLoginButton({
    Key key,
    @required this.onPressed,
    @required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: kOrangeColor,
      splashColor: kWhiteColor.withOpacity(0.2),
      height: sHeight(45.0),
      minWidth: double.infinity,
      highlightElevation: 0.0,
      child: Text(
        title,
        style: kButtonText.copyWith(
          color: kWhiteColor,
          fontSize: sSp(14.0),
          letterSpacing: 1.0,
        ),
      ),
    );
  }
}

class ExternalSignupReusableButton extends StatelessWidget {
  final String title;
  final Function onPressed;

  const ExternalSignupReusableButton({
    Key key,
    @required this.title,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.all(0.0),
      onPressed: onPressed,
      color: title == 'google' ? kWhiteColor : kFacebookBlueColor,
      splashColor: title == 'google'
          ? kOrangeColor.withOpacity(0.2)
          : kWhiteColor.withOpacity(0.1),
      height: sHeight(45.0),
      minWidth: double.infinity,
      highlightElevation: 0.0,
      elevation: 0.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            height: sHeight(18.0),
            child: Container(
              child: Image(
                image: AssetImage('assets/images/$title.png'),
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          SizedBox(
            width: sWidth(12.0),
          ),
          Text(
            'Sign up with $title',
            style: kButtonText.copyWith(
              color: title == 'google' ? kBrownColor : kWhiteColor,
              fontSize: sSp(12.0),
            ),
          ),
        ],
      ),
    );
  }
}

class ReusableRegularButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  const ReusableRegularButton({
    Key key,
    @required this.text,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: sHeight(30),
      child: RaisedButton(
        color: kSkinColor,
        highlightElevation: 0.0,
        splashColor: kOrangeColor.withOpacity(0.2),
        child: Text(
          text,
          style: kButtonText,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
