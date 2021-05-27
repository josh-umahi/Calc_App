import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import './theme.dart';
import './screens/BasicCalculator/index.dart';
import './screens/BasicCalculator/models/my_calculator.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Calc App',
      debugShowCheckedModeBanner: false,
      theme: darkThemeData(context),
      home: ChangeNotifierProvider(
        create: (_) => MyCalculator(),
        child: BasicCalculatorScreen(),
      ),
    );
  }
}
