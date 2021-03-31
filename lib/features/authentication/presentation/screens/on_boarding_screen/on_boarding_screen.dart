import 'package:flutter/material.dart';

import '../../../../../core/ui_helper/responsive/responsive.dart';
import 'on_boarding_mobile_portrait.dart';

class OnBoardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: OrientationLayout(
        portrait: OnBoardingMobilePortrait(),
      ),
    );
  }
}
