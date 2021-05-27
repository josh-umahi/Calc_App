import 'package:flutter/material.dart';

import '../../../constants.dart';

class NumberButton extends StatelessWidget {
  final String numberText;
  final Function(String) numberButtonPressed;

  const NumberButton(this.numberText, this.numberButtonPressed, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        child: InkWell(
          customBorder: new CircleBorder(),
          onTap: () => numberButtonPressed(numberText),
          child: Container(
            width: buttonDiameter,
            height: buttonDiameter,
            alignment: Alignment.center,
            child: Text(
              numberText,
              style: TextStyle(
                fontSize: 40,
              ),
            ),
          ),
        ),
        color: Colors.transparent);
  }
}
