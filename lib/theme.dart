import 'package:flutter/material.dart';

import './constants.dart';

ThemeData lightThemeData() {
  return ThemeData.dark().copyWith(
    primaryColor: Colors.white,
    accentColor: lightLowerBgColor,
    scaffoldBackgroundColor: darkLowerBgColor,
    iconTheme: sharedIconTheme,
    textTheme: ThemeData.light().textTheme.apply(
          fontFamily: sharedFontFamily,
          bodyColor: lightBodyTextColor,
        ),
  );
}

ThemeData darkThemeData() {
  return ThemeData.dark().copyWith(
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
