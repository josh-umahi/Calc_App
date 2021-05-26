
import 'package:flutter/material.dart';

import './theme.dart';
import './screens/BasicCalculator/index.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Calc App',
      debugShowCheckedModeBanner: false,
      theme: lightThemeData(context),
      darkTheme: darkThemeData(context),
      // themeMode: ThemeMode.dark,
      home: BasicCalculator(),
    );
  }
}

