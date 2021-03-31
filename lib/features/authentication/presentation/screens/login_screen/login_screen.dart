import 'package:flutter/material.dart';

import '../../../../../core/ui_helper/responsive/responsive.dart';
import 'login_mobile_portrait.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: OrientationLayout(
        portrait: LoginMobilePortrait(),
      ),
    );
  }
}
