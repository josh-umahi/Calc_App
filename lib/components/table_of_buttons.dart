import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'action_button.dart';
import 'number_button.dart';
import '../models/enums.dart';
import '../models/my_calculator.dart';

class TableOfButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final void Function(String) appendNumber =
        context.read<MyCalculator>().appendNumber;
    final void Function(ActionID) chooseArithmeticOperation =
        context.read<MyCalculator>().chooseArithmeticOperation;
    final void Function(ActionID) chooseNonArithmeticOperation =
        context.read<MyCalculator>().chooseNonArithmeticOperation;

    return Table(
      children: [
        TableRow(
          children: [
            ActionButton(
              actionId: ActionID.AC,
              actionButtonPressed: chooseNonArithmeticOperation,
            ),
            ActionButton(
              actionId: ActionID.ChangeTheme,
              actionButtonPressed: chooseNonArithmeticOperation,
            ),
            ActionButton(
              actionId: ActionID.ChangeSign,
              actionButtonPressed: chooseNonArithmeticOperation,
            ),
            ActionButton(
              actionId: ActionID.Divide,
              actionButtonPressed: chooseArithmeticOperation,
            ),
          ],
        ),
        _buildTableRowSpacing(),
        TableRow(
          children: [
            NumberButton('7', appendNumber),
            NumberButton('8', appendNumber),
            NumberButton('9', appendNumber),
            ActionButton(
              actionId: ActionID.Multiply,
              actionButtonPressed: chooseArithmeticOperation,
            ),
          ],
        ),
        _buildTableRowSpacing(),
        TableRow(
          children: [
            NumberButton('4', appendNumber),
            NumberButton('5', appendNumber),
            NumberButton('6', appendNumber),
            ActionButton(
              actionId: ActionID.Subtract,
              actionButtonPressed: chooseArithmeticOperation,
            ),
          ],
        ),
        _buildTableRowSpacing(),
        TableRow(
          children: [
            NumberButton('1', appendNumber),
            NumberButton('2', appendNumber),
            NumberButton('3', appendNumber),
            ActionButton(
              actionId: ActionID.Add,
              actionButtonPressed: chooseArithmeticOperation,
            ),
          ],
        ),
        _buildTableRowSpacing(),
        TableRow(
          children: [
            NumberButton('0', appendNumber),
            NumberButton('.', appendNumber),
            ActionButton(
              actionId: ActionID.Backspace,
              actionButtonPressed: chooseNonArithmeticOperation,
            ),
            ActionButton(
              actionId: ActionID.Equals,
              actionButtonPressed: chooseNonArithmeticOperation,
            ),
          ],
        ),
      ],
    );
  }

  /// Creates an empty row of certain height to serve as spacing between two rows
  TableRow _buildTableRowSpacing() {
    return TableRow(
      children: List.generate(4, (index) => SizedBox(height: 20)),
    );
  }
}
