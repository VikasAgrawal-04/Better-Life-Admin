import 'package:flutter/material.dart';

const kRadius = 4.0;
const kInputRadius = 12.0;
const kLightGrey = Color(0xffDFDFDF);
const kPrimaryColor = Color(0xff4176DD);
const kSecondaryLightColor = Color.fromARGB(255, 255, 202, 96);
const kSecondaryDarkColor = Color(0xFF404040);
const kAccentLightColor = Color(0xFFB3BFD7);
const kAccentDarkColor = Color(0xFF4E4E4E);
const kBackgroundDarkColor = Color(0xFF3A3A3A);
const kSurfaceDarkColor = Color(0xFF222225);

const kCircularRadius = Radius.circular(kRadius);
const kBorderRadius = BorderRadius.all(kCircularRadius);
const kPhysics = BouncingScrollPhysics();
const kCurve = Curves.fastLinearToSlowEaseIn;
const kMargin = EdgeInsets.all(10);
const kSplashDuration = Duration(milliseconds: 3000);
const kDuration = Duration(milliseconds: 500);
const kBorderSide = BorderSide(color: Colors.transparent);
const kPadding = EdgeInsets.all(20);
const kInputPadding = EdgeInsets.fromLTRB(20, 15, 12, 15);
