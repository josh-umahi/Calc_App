import 'package:flutter/material.dart';

import '../../constants.dart';
import './widgets/TableOfButtons.dart';
import './enums.dart';

class BasicCalculator extends StatefulWidget {
  @override
  _BasicCalculatorState createState() => _BasicCalculatorState();
}

class _BasicCalculatorState extends State<BasicCalculator> {
  String _question = "";

  Widget build(BuildContext context) {
    print(_question);
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.only(right: defaultPadding, bottom: 14),
              child: Column(
                children: [
                  SizedBox(
                    height: 29,
                    width: double.infinity,
                    child: ListView(
                      reverse: true,
                      scrollDirection: Axis.horizontal,
                      children: [
                        Text(
                          "12 + 5",
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.only(left: defaultPadding),
                    alignment: AlignmentDirectional.centerEnd,
                    width: double.infinity,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        "87",
                        style: TextStyle(
                          fontSize: 70,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(
                defaultPadding,
                defaultPadding,
                defaultPadding,
                50,
              ),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              child: TableOfButtons(
                numberButtonPressed: numberButtonPressed,
                actionButtonPressed: actionButtonPressed,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void numberButtonPressed(String numberText) {
    setState(() {
      _question += numberText;
    });
  }

  void actionButtonPressed(ActionButtonID actionId) {
    setState(() {
      switch (actionId) {
        case ActionButtonID.AC:
          _question = "";
          break;
        case ActionButtonID.ChangeTheme:
          // A Function
          break;
        case ActionButtonID.Percentage:
          // A Function
          break;
        case ActionButtonID.Divide:
          // A Function
          break;
        case ActionButtonID.Multiply:
          // A Function
          break;
        case ActionButtonID.Subtract:
          // A Function
          break;
        case ActionButtonID.Add:
          // A Function
          break;
        case ActionButtonID.Equals:
          // A Function
          break;
        case ActionButtonID.Backspace:
          if (_question.length != 0) {
            _question = _question.substring(0, _question.length - 1);
          }
          break;
        default:
          break;
      }
    });
  }
}
