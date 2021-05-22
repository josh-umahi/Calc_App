import 'package:flutter/material.dart';

import '../../../constants.dart';

class ActionButton extends StatelessWidget {
  final Map<String, Object> iconOrText;

  const ActionButton(
    {this.iconOrText, 
    Key key}) : super(key: key);

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
          color: Theme.of(context).primaryColor,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 4),
              blurRadius: 8,
              color: Color.fromRGBO(0, 0, 0, 0.25),
            ),
          ],
        ),
        // child: Text(
        //   "AC",
        //   style: TextStyle(
        //     fontSize: 25,
        //     color: primaryColor,
        //   ),
        // ),
      ),
    );
  }
}