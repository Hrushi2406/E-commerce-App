import 'package:flutter/material.dart';

import '../../../../../core/ui_helper/responsive/responsive.dart';
import 'signup_mobile_portrait.dart';

class SignupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: OrientationLayout(
        portrait: SignupMobilePortrait(),
      ),
    );
  }
}
