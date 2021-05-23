import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../enums.dart';

// ignore: must_be_immutable
class ActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => actionButtonPressed(actionId),
      child: Container(
        width: buttonDiameter,
        height: buttonDiameter,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: _unicodeText == "\u003d" ? primaryColor : Theme.of(context).primaryColor,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 4),
              blurRadius: 8,
              color: Color.fromRGBO(0, 0, 0, 0.25),
            ),
          ],
        ),
        child: _determineButtonChild(),
      ),
    );
  }

  String? _text;
  String? _unicodeText;
  IconData? _icon;
  final Function(ActionButtonID actionId) actionButtonPressed;
  final ActionButtonID actionId;

  ActionButton({
    Key? key,
    required this.actionButtonPressed,
    required this.actionId,
  }) : super(key: key){
    switch (actionId) {
        case ActionButtonID.AC:
          _text = "AC";
          break;
        case ActionButtonID.ChangeTheme:
          _icon = Icons.brightness_4_outlined;
          break;
        case ActionButtonID.Percentage:
          _text = "%";
          break;
        case ActionButtonID.Divide:
          _unicodeText = "\u00f7";
          break;
        case ActionButtonID.Multiply:
          _unicodeText = "\u00d7";
          break;
        case ActionButtonID.Subtract:
          _unicodeText = "\u2013";
          break;
        case ActionButtonID.Add:
          _unicodeText = "\u002b";
          break;
        case ActionButtonID.Equals:
          _unicodeText = "\u003d";
          break;
        case ActionButtonID.Backspace:
          _icon = Icons.backspace_outlined;
          break;
        default:
          break;
      }
  }

  Widget _determineButtonChild() {
    if (_text != null) {
      return Text(
        _text!,
        style: TextStyle(fontSize: 25, color: primaryColor),
      );
    }
    if (_unicodeText != null) {
      return Text(
        _unicodeText!,
        style: TextStyle(fontSize: 30, color: _unicodeText == "\u003d" ? Colors.white : primaryColor),
      );
    }
    return Icon(_icon);
  }
}
