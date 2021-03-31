import 'package:flutter/material.dart';
import 'package:furnitur/core/ui_helper/responsive/responsive.dart';
import 'package:furnitur/screens/profile_screen/profile_mobile_portrait.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: OrientationLayout(
        portrait: ProfileMobilePortrait(),
      ),
    );
  }
}
