import 'package:flutter/material.dart';

///Builds UI as per the [Orientation]
///
/// If [landscape] is not provided,
/// [portrait] widget is built as default
class OrientationLayout extends StatelessWidget {
  final Widget portrait;
  final Widget landscape;

  const OrientationLayout({
    Key key,
    @required this.portrait,
    this.landscape,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    if (orientation == Orientation.landscape) {
      return landscape ?? portrait;
    }
    return portrait;
  }
}
