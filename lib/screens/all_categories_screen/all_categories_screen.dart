import 'package:flutter/material.dart';
import 'package:furnitur/core/ui_helper/responsive/responsive.dart';
import 'package:furnitur/screens/all_categories_screen/all_categories_mobile_portrait.dart';

class AllCategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: OrientationLayout(
        portrait: AllCategoriesMobilePortrait(),
      ),
    );
  }
}
