import 'package:flutter/cupertino.dart';

import '../enums/device_screen_type.dart';

///Model for Sizing Information
///
/// Content: [DeviceScreenType], [screenSize], [localWidgetSize].
class SizingInformation {
  final DeviceScreenType deviceType;
  final Size screenSize;
  final Size localWidgetSize;

  SizingInformation({
    this.deviceType,
    this.screenSize,
    this.localWidgetSize,
  });

  ///Get information about current screen size
  ///
  ///Returns a [String]
  @override
  String toString() {
    return 'DeviceType: $deviceType \nScreenSize: $screenSize \nLocalWidgetSize: $localWidgetSize';
  }
}
