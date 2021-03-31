import 'package:flutter/material.dart';
import 'package:furnitur/core/ui_helper/responsive/responsive.dart';
import 'package:furnitur/screens/tabs/tabs_mobile_portrait.dart';

class TabsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // BlocProvider.of<HomeBloc>(context).add(FetchHomeScreen());
    return ScreenTypeLayout(
      mobile: OrientationLayout(
        portrait: TabsMobilePortrait(),
      ),
    );
  }
}
