import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'basic_calculator.dart';
import './models/my_calculator.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  runApp(
    ChangeNotifierProvider(
      create: (_) => MyCalculator(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeData = context.select<MyCalculator, ThemeData Function()>(
        (myCalculator) => myCalculator.themeData);

    return MaterialApp(
      title: 'The Calc App',
      debugShowCheckedModeBanner: false,
      theme: themeData(),
      home: BasicCalculatorScreen(),
    );
  }
}
