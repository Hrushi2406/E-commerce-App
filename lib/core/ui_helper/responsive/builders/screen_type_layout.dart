import 'package:flutter/material.dart';

import '../enums/device_screen_type.dart';
import '../utils/sizing_information.dart';
import 'responsive_builder.dart';

///Builds UI as per the [DeviceScreenType]
///
/// If other parameters are not provided,
/// [mobile] widget is shown as default

class ScreenTypeLayout extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const ScreenTypeLayout({
    Key key,
    @required this.mobile,
    this.tablet,
    this.desktop,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (BuildContext context, SizingInformation sizingInformation) {
        if (sizingInformation.deviceType == DeviceScreenType.Tablet) {
          if (tablet != null) {
            return tablet;
          }
        }
        if (sizingInformation.deviceType == DeviceScreenType.Desktop) {
          if (desktop != null) {
            return desktop;
          }
        }
        return mobile;
      },
    );
  }
}
