import 'package:flutter/material.dart';
import 'package:furnitur/core/ui_helper/ui_helper.dart';

//! 0 to-do's in this screen

class ProfileMobilePortrait extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Stack(
          overflow: Overflow.visible,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              height: sHeightMultiplier * 28,
              width: double.infinity,
              color: kBrownColor,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    maxRadius: sWidth(32.5),
                    backgroundColor: kSkinColor,
                    child: Image(
                      image: const AssetImage('assets/images/person.png'),
                      width: sWidth(30.0),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  SizedBox(
                    height: sHeight(8.0),
                  ),
                  Text(
                    'Jhonny Developer',
                    style: TextStyle(
                      color: kWhiteColor,
                      fontSize: sSp(16.0),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: sHeight(4.0),
                  ),
                  Text(
                    '+91 3217684537',
                    style: TextStyle(
                      color: kWhiteColor.withOpacity(0.8),
                      fontSize: sSp(10.0),
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: sHeight(-24),
              right: sWidth(40.0),
              child: FloatingActionButton(
                elevation: 0.0,
                highlightElevation: 0.0,
                splashColor: kWhiteColor.withOpacity(0.2),
                onPressed: () {
                  //edit info
                },
                child: Icon(
                  Icons.edit,
                  color: kWhiteColor,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: sHeight(50.0),
        ),
        Expanded(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 32.0),
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.schedule,
                    color: kIconColor,
                    size: sSp(20.0),
                  ),
                  SizedBox(
                    width: sWidth(15.0),
                  ),
                  Text(
                    'My Orders',
                    style: kRegularText,
                  ),
                ],
              ),
              SizedBox(
                height: sHeight(25.0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.group,
                    color: kIconColor,
                    size: sSp(20.0),
                  ),
                  SizedBox(
                    width: sWidth(15.0),
                  ),
                  Text(
                    'Customer Service',
                    style: kRegularText,
                  ),
                ],
              ),
              SizedBox(
                height: sHeight(25.0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.settings,
                    color: kIconColor,
                    size: sSp(20.0),
                  ),
                  SizedBox(
                    width: sWidth(15.0),
                  ),
                  Text(
                    'Settings',
                    style: kRegularText,
                  ),
                ],
              ),
              SizedBox(
                height: sHeight(25.0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.info,
                    color: kIconColor,
                    size: sSp(20.0),
                  ),
                  SizedBox(
                    width: sWidth(15.0),
                  ),
                  Text(
                    'About',
                    style: kRegularText,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
