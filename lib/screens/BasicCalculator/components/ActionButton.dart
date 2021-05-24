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
  final Function(ActionID actionId) actionButtonPressed;
  final ActionID actionId;

  ActionButton({
    Key? key,
    required this.actionButtonPressed,
    required this.actionId,
  }) : super(key: key){
    switch (actionId) {
        case ActionID.AC:
          _text = "AC";
          break;
        case ActionID.ChangeTheme:
          _icon = Icons.brightness_4_outlined;
          break;
        case ActionID.ChangeSign:
          _text = '+/-';
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
