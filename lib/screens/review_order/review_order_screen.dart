import 'package:flutter/material.dart';
import 'package:furnitur/core/ui_helper/responsive/responsive.dart';
import 'package:furnitur/screens/review_order/review_order_mobile_portrait.dart';

class ReviewOrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: OrientationLayout(
        portrait: ReviewOrderMobilePortrait(),
      ),
    );
  }
}
