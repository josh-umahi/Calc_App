import 'package:flutter/material.dart';

import '../../constants.dart';
import 'components/table_of_buttons.dart';
import './enums.dart';
import './functions.dart';

class BasicCalculator extends StatefulWidget {
  @override
  _BasicCalculatorState createState() => _BasicCalculatorState();
}

class _BasicCalculatorState extends State<BasicCalculator> {
  static const _zeroStr = '0';
  static const _negativeSignStr = '-';
  static const _maxInputLength = maxResultLength;

  String _previousOperandWithOperation = '';
  String _currentOperand = _zeroStr;
  ActionID? _currentOperation;

  @override
  void initState() {
    super.initState();
    allClear();
  }

  Widget build(BuildContext context) {
    print("_previousOperandWithOperation: $_previousOperandWithOperation");
    print("_currentOperand: $_currentOperand");
    print("_currentOperation: $_currentOperation");
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
                numberButtonPressed: appendNumber,
                actionButtonPressed: actionButtonPressed,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void allClear() {
    setState(() {
      _previousOperandWithOperation = "";
      _currentOperand = _zeroStr;
      _currentOperation = null;
    });
  }

  void appendNumber(String numberStrToAppend) {
    if (_currentOperand.length > _maxInputLength) return;
    if (numberStrToAppend == "." && _currentOperand.contains(".")) return;

    setState(() {
      if (numberStrToAppend != ".") {
        if (_currentOperand == _zeroStr || isErrorOnScreen(_currentOperand)) {
          _currentOperand = numberStrToAppend;
          return;
        }
        if (_currentOperand == _negativeSignStr + _zeroStr) {
          _currentOperand = _negativeSignStr + numberStrToAppend;
          return;
        }
      }
      _currentOperand = reformatNumber(_currentOperand + numberStrToAppend);
    });
  }

  void deleteNumber() {
    RegExp regexNegativeDigit = RegExp(r"^-\d{1}$");
    RegExp regexPositiveDigit = RegExp(r"^\d{1}$");

    setState(() {
      if (regexNegativeDigit.hasMatch(_currentOperand)) {
        _currentOperand = _negativeSignStr + _zeroStr;
        return;
      }
      if (regexPositiveDigit.hasMatch(_currentOperand)) {
        _currentOperand = _zeroStr;
        return;
      }
      _currentOperand = reformatNumber(
          _currentOperand.substring(0, _currentOperand.length - 1));
    });
  }

  void changeSign() {
    setState(() {
      _currentOperand = (_currentOperand.contains(_negativeSignStr))
          ? _currentOperand.replaceFirst(_negativeSignStr, '')
          : _negativeSignStr + _currentOperand;
    });
  }

  void chooseOperation(ActionID _selectedOperation) {
    if (_currentOperation != null) {
      displayResultOfCalculation();
      if (isErrorOnScreen(_currentOperand)) return;
    }

    setState(() {
      _previousOperandWithOperation = "$_currentOperand ${_selectedOperation.symbol}";
      _currentOperand = _zeroStr;
      _currentOperation = _selectedOperation;
    });
  }

  void displayResultOfCalculation() {
    setState(() {
      _currentOperand = calculateResult(
        previousOperandWithOperation: _previousOperandWithOperation,
        currentOperand: _currentOperand,
        currentOperation: _currentOperation,
      );
      _previousOperandWithOperation = '';
      _currentOperation = null;
    });
  }

  void actionButtonPressed(ActionID actionId) {
    if (isErrorOnScreen(_currentOperand) &&
        actionId != ActionID.AC &&
        actionId != ActionID.Backspace) return;

    switch (actionId) {
      case ActionID.AC:
        allClear();
        break;
      case ActionID.ChangeTheme:
        // A Function
        break;
      case ActionID.ChangeSign:
        changeSign();
        break;
      case ActionID.Divide:
        chooseOperation(ActionID.Divide);
        break;
      case ActionID.Multiply:
        chooseOperation(ActionID.Multiply);
        break;
      case ActionID.Subtract:
        chooseOperation(ActionID.Subtract);
        break;
      case ActionID.Add:
        chooseOperation(ActionID.Add);
        break;
      case ActionID.Equals:
        displayResultOfCalculation();
        break;
      case ActionID.Backspace:
        isErrorOnScreen(_currentOperand) ? allClear() : deleteNumber();
        break;
      default:
        break;
    }
  }
}
