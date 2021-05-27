import 'package:flutter/material.dart';

import '../../../constants.dart';

class EntriesAndResultsDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 29,
          width: double.infinity,
          child: ListView(
            reverse: true,
            scrollDirection: Axis.horizontal,
            children: [
              Text(
                _previousOperandWithOperation,
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
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
              _currentOperand,
              style: TextStyle(
                fontSize: 70,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
