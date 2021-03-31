import 'package:flutter/material.dart';
import 'package:furnitur/core/ui_helper/responsive/responsive.dart';
import 'package:furnitur/screens/checking_out/checking_out_mobile_portrait.dart';

class CheckingOutScreen extends StatelessWidget {
  final int totalAmount;

  const CheckingOutScreen({Key key, this.totalAmount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: OrientationLayout(
        portrait: CheckingOutMobilePortrait(
          totalAmount: totalAmount,
        ),
      ),
    );
  }
}
