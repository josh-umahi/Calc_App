import 'package:flutter/material.dart';

import '../components/ActionButton.dart';
import '../components/NumberButton.dart';
import '../enums.dart';

class TableOfButtons extends StatelessWidget {
  final Function(String) numberButtonPressed;
  final Function(ActionID actionId) actionButtonPressed;

  const TableOfButtons({
    Key? key,
    required this.numberButtonPressed,
    required this.actionButtonPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        TableRow(
          children: [
            ActionButton(
              actionId: ActionID.AC,
              actionButtonPressed: actionButtonPressed,
            ),
            ActionButton(
              actionId: ActionID.ChangeTheme,
              actionButtonPressed: actionButtonPressed,
            ),
            ActionButton(
              actionId: ActionID.Percentage,
              actionButtonPressed: actionButtonPressed,
            ),
            ActionButton(
              actionId: ActionID.Divide,
              actionButtonPressed: actionButtonPressed,
            ),
          ],
        ),
        _buildTableRowSpacing(),
        TableRow(
          children: [
            NumberButton('7', numberButtonPressed),
            NumberButton('8', numberButtonPressed),
            NumberButton('9', numberButtonPressed),
            ActionButton(
              actionId: ActionID.Multiply,
              actionButtonPressed: actionButtonPressed,
            ),
          ],
        ),
        _buildTableRowSpacing(),
        TableRow(
          children: [
            NumberButton('4', numberButtonPressed),
            NumberButton('5', numberButtonPressed),
            NumberButton('6', numberButtonPressed),
            ActionButton(
              actionId: ActionID.Subtract,
              actionButtonPressed: actionButtonPressed,
            ),
          ],
        ),
        _buildTableRowSpacing(),
        TableRow(
          children: [
            NumberButton('1', numberButtonPressed),
            NumberButton('2', numberButtonPressed),
            NumberButton('3', numberButtonPressed),
            ActionButton(
              actionId: ActionID.Add,
              actionButtonPressed: actionButtonPressed,
            ),
          ],
        ),
        _buildTableRowSpacing(),
        TableRow(
          children: [
            NumberButton('0', numberButtonPressed),
            NumberButton('.', numberButtonPressed),
            ActionButton(
              actionId: ActionID.Backspace,
              actionButtonPressed: actionButtonPressed,
            ),
            ActionButton(
              actionId: ActionID.Equals,
              actionButtonPressed: actionButtonPressed,
            ),
          ],
        ),
      ],
    );
  }

  TableRow _buildTableRowSpacing() {
    return TableRow(
      children: List.generate(4, (index) => SizedBox(height: 22.4)),
    );
  }
}
