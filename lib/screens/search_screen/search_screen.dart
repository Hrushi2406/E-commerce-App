import 'package:flutter/material.dart';
import 'package:furnitur/core/ui_helper/responsive/responsive.dart';
import 'package:furnitur/screens/search_screen/search_mobile_portrait.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: OrientationLayout(
        portrait: SearchMobilePortrait(),
      ),
    );
  }
}
