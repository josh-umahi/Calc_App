import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../models/my_calculator.dart';

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
              PreviousOperandWithOperation(),
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
            child: CurrentOperand(),
          ),
        ),
      ],
    );
  }
}

class PreviousOperandWithOperation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final previousOperandWithOperation = context.select<MyCalculator, String>(
        (myCalculator) => myCalculator.previousOperandWithOperation);

    return Text(
      previousOperandWithOperation,
      style: TextStyle(
        fontSize: 25,
        color: Colors.white,
      ),
    );
  }
}

class CurrentOperand extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentOperand = context.select<MyCalculator, String>(
        (myCalculator) => myCalculator.currentOperand);

    return Text(
      currentOperand,
      style: TextStyle(
        fontSize: 70,
        color: Colors.white,
      ),
    );
  }
}
