import 'package:flutter/material.dart';

import '../../../constants.dart';

class ActionButton extends StatelessWidget {
  final String text;
  final String unicodeText;
  final IconData icon;

  const ActionButton({
    Key key,
    this.text = "",
    this.unicodeText = "",
    this.icon = null,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: buttonDiameter,
        height: buttonDiameter,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: unicodeText == "\u003d" ? primaryColor : Theme.of(context).primaryColor,
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

  Widget _determineButtonChild() {
    if (text.isNotEmpty) {
      return Text(
        text,
        style: TextStyle(fontSize: 25, color: primaryColor),
      );
    }
    if (unicodeText.isNotEmpty) {
      return Text(
        unicodeText,
        style: TextStyle(fontSize: 30, color: unicodeText == "\u003d" ? Colors.white : primaryColor),
      );
    }
    return Icon(icon);
  }
}
