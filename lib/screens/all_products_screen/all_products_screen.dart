import 'package:flutter/material.dart';
import 'package:furnitur/core/ui_helper/responsive/responsive.dart';
import 'package:furnitur/screens/all_products_screen/all_products_mobile_portrait.dart';

class AllProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: OrientationLayout(
        portrait: AllProductsMobilePortrait(),
      ),
    );
  }
}
