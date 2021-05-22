import 'package:flutter/material.dart';

import '../../../constants.dart';

class NumberButton extends StatelessWidget {
  final String numberText;

  const NumberButton(
    this.numberText, 
    {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: buttonDiameter,
        height: buttonDiameter,
        alignment: Alignment.center,
        child: Text(
          numberText,
          style: TextStyle(
            fontSize: 40,
            color: Theme.of(context).textTheme.bodyText1.color,
          ),
        ),
      ),
    );
  }
}
