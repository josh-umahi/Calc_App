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
          color: _unicodeText == "\u003d"
              ? primaryColor
              : Theme.of(context).primaryColor,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 4),
              blurRadius: 8,
              color: Color.fromRGBO(0, 0, 0, 0.25),
            ),
          ],
        ),
        child: ActionButtonChild(
          text: _text,
          unicodeText: _unicodeText,
          icon: _icon,
        ),
      ),
    );
  }

  String? _text;
  String? _unicodeText;
  IconData? _icon;
  final Function(ActionID actionId) actionButtonPressed;
  final ActionID actionId;

  ActionButton({
    Key? key,
    required this.actionButtonPressed,
    required this.actionId,
  }) : super(key: key) {
    switch (actionId) {
      case ActionID.AC:
        _text = "AC";
        break;
      case ActionID.ChangeTheme:
        _icon = Icons.brightness_4_outlined;
        break;
      case ActionID.ChangeSign:
        _text = "\u00B1";
        break;
      case ActionID.Divide:
        _unicodeText = ActionID.Divide.symbol;
        break;
      case ActionID.Multiply:
        _unicodeText = ActionID.Multiply.symbol;
        break;
      case ActionID.Subtract:
        _unicodeText = ActionID.Subtract.symbol;
        break;
      case ActionID.Add:
        _unicodeText = ActionID.Add.symbol;
        break;
      case ActionID.Equals:
        _unicodeText = "\u003d";
        break;
      case ActionID.Backspace:
        _icon = Icons.backspace_outlined;
        break;
      default:
        break;
    }
  }
}

class ActionButtonChild extends StatelessWidget {
  final String? text;
  final String? unicodeText;
  final IconData? icon;

  const ActionButtonChild({
    Key? key,
    this.text,
    this.unicodeText,
    this.icon,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    if (text != null) {
      return Text(
        text!,
        style: TextStyle(fontSize: 25, color: primaryColor),
      );
    }
    if (unicodeText != null) {
      return Text(
        unicodeText!,
        style: TextStyle(
            fontSize: 30,
            color: unicodeText == "\u003d" ? Colors.white : primaryColor),
      );
    }
    return Icon(icon);
  }
}
