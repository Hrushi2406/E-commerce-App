import 'package:flutter/cupertino.dart';

import '../enums/device_screen_type.dart';
import '../utils/size_config.dart';
import '../utils/sizing_information.dart';

///Makes [SizingInformation] available for building
///responsive UI.
///
/// Rebuilds UI when any of [SizingInformation] is changed.

class ResponsiveBuilder extends StatelessWidget {
  //widget to build
  final Widget Function(
    BuildContext context,
    SizingInformation sizingInformation,
  ) builder;

  //const constructor
  const ResponsiveBuilder({Key key, @required this.builder}) : super(key: key);

  ///Takes [MediaQueryData] and returns [DeviceScreenType]
  DeviceScreenType _getDeviceType(MediaQueryData mediaQuery) {
    double deviceWidth = mediaQuery.size.shortestSide;

    if (deviceWidth > 950) {
      return DeviceScreenType.Desktop;
    }

    if (deviceWidth > 600) {
      return DeviceScreenType.Tablet;
    }

    return DeviceScreenType.Mobile;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, boxConstraints) {
        //getting current mediaQuery data
        MediaQueryData mediaQuery = MediaQuery.of(context);

        //initialising sizing Information
        var sizingInformation = SizingInformation(
          deviceType: _getDeviceType(mediaQuery),
          screenSize: mediaQuery.size,
          localWidgetSize: Size(
            boxConstraints.maxWidth,
            boxConstraints.maxHeight,
          ),
        );

        //initialising SizeConfig
        SizeConfig.init(
          screenSize: mediaQuery.size,
          orientation: mediaQuery.orientation,
        );

        return builder(context, sizingInformation);
      },
    );
  }
}
