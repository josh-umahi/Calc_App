import 'package:flutter/material.dart';

import './theme.dart';
import './screens/BasicCalculator/index.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Calc App',
      debugShowCheckedModeBanner: false,
      theme: darkThemeData(context),
      home: BasicCalculator(),
    );
  }
}

