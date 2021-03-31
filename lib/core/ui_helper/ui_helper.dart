import 'package:flutter/material.dart';

import 'responsive/responsive.dart';

//! SizeConfig shortcuts

//get dimensions from [ SizeConfig ]
double get sWidthMultiplier => SizeConfig.widthMultiplier;
double get sHeightMultiplier => SizeConfig.heightMultiplier;

double sWidth(double width) => SizeConfig.setWidth(width);
double sHeight(double height) => SizeConfig.setHeight(height);
double sSp(double size) => SizeConfig.setSp(size);

//! colors

//theme
const Color kOrangeColor = Color(0xFFFF8E5C);
const Color kSkinColor = Color(0xFFFFE2CC);
const Color kBrownColor = Color(0xFF664763);
const Color kWhiteColor = Color(0xFFFFFFFF);

//others
const Color kFacebookBlueColor = Color(0xFF3D5A98);

//components
final Color kIconColor = Color(0xFF664763).withOpacity(0.8);
final Color kUnselectedTabColor = Color(0xFF664763).withOpacity(0.45);

//! textStyles

//on boarding heading
final TextStyle kHeading1 = TextStyle(
  color: kBrownColor,
  fontSize: SizeConfig.setSp(24.0),
  fontWeight: FontWeight.w600,
);

//login & sign-up
final TextStyle kHeading2 = TextStyle(
  color: kBrownColor,
  fontSize: SizeConfig.setSp(22.0),
  fontWeight: FontWeight.w600,
  letterSpacing: 1.0,
);

//appBar title
final TextStyle kTitle = TextStyle(
  color: kBrownColor,
  fontSize: SizeConfig.setSp(20.0),
  fontWeight: FontWeight.w600,
);

//section headings
final TextStyle kSectionHeading = TextStyle(
  color: kBrownColor,
  fontSize: SizeConfig.setSp(16.0),
  fontWeight: FontWeight.normal,
);

//on boarding
final TextStyle kSubheading = TextStyle(
  color: kBrownColor.withOpacity(0.8),
  fontSize: SizeConfig.setSp(14.0),
  fontWeight: FontWeight.normal,
);

//input text, description
final TextStyle kRegularText = TextStyle(
  color: kBrownColor,
  fontSize: SizeConfig.setSp(14.0),
  fontWeight: FontWeight.normal,
);

//see all
final TextStyle kRegularSub = TextStyle(
  color: kBrownColor.withOpacity(0.8),
  fontSize: SizeConfig.setSp(12.0),
  fontWeight: FontWeight.normal,
);

//cards title
final TextStyle kCardTitle = TextStyle(
  color: kBrownColor,
  fontSize: SizeConfig.setSp(12.0),
  fontWeight: FontWeight.w600,
);

//cards subtitle
final TextStyle kCardSubtitle = TextStyle(
  color: kBrownColor.withOpacity(0.8),
  fontSize: SizeConfig.setSp(11.0),
  fontWeight: FontWeight.normal,
);

//text inside button
final TextStyle kButtonText = TextStyle(
    color: kBrownColor,
    fontSize: SizeConfig.setSp(10.0),
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5);

//! shadows

//cards shadow
final BoxShadow kCardShadow = BoxShadow(
  blurRadius: sSp(3.0),
  offset: Offset(0.0, sHeight(1.0)),
  color: Colors.black.withOpacity(0.2),
);

//! overlays

LinearGradient kCardOverlay = LinearGradient(
  colors: [Colors.black.withOpacity(0.40), Colors.transparent],
  begin: Alignment.bottomCenter,
  end: Alignment.topCenter,
);
