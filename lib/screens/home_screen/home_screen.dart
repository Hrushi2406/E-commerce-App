import 'package:flutter/material.dart';
import 'package:furnitur/core/ui_helper/responsive/responsive.dart';
import 'package:furnitur/screens/home_screen/home_mobile_portrait.dart';

class HomeScreen extends StatelessWidget {
  final bool isScreenTwo;

  const HomeScreen({
    Key key,
    @required this.isScreenTwo,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: OrientationLayout(
        portrait: HomeMobilePortrait(
          isScreenTwo: isScreenTwo,
        ),
      ),
    );
  }
}
