import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './constants.dart';

ThemeData lightThemeData(BuildContext context) {
  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  return ThemeData.light().copyWith(
    primaryColor: Colors.white,
    accentColor: lightLowerBgColor,
    scaffoldBackgroundColor: Colors.white,
    iconTheme: sharedIconTheme,
    textTheme: ThemeData.light().textTheme.apply(
          fontFamily: sharedFontFamily,
          bodyColor: lightBodyTextColor,
        ),
  );
}

ThemeData darkThemeData(BuildContext context) {
  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  return ThemeData.light().copyWith(
    primaryColor: darkPrimaryColor,
    accentColor: darkLowerBgColor,
    scaffoldBackgroundColor: darkPrimaryColor,
    iconTheme: sharedIconTheme,
    textTheme: ThemeData.dark().textTheme.apply(
          fontFamily: sharedFontFamily,
          bodyColor: Colors.white,
        ),
  );
}

const sharedFontFamily = "Helvetica";
const sharedIconTheme = IconThemeData(size: 27, color: primaryColor);
