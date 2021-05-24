import 'package:flutter/material.dart';

import '../../constants.dart';
import './widgets/TableOfButtons.dart';
import './enums.dart';
import './functions.dart';

class BasicCalculator extends StatefulWidget {
  @override
  _BasicCalculatorState createState() => _BasicCalculatorState();
}

class _BasicCalculatorState extends State<BasicCalculator> {
  static const _zeroStr = "0";
  static const _negativeSignStr = "-";
  String _previousOperand = "";
  String _currentOperand = _zeroStr;
  ActionID? _currentOperation;

  @override
  void initState() {
    super.initState();
    allClear();
  }

  Widget build(BuildContext context) {
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
                          _previousOperand,
                          style: TextStyle(
                            fontSize: 25,
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
    _previousOperand = "";
    _currentOperand = _zeroStr;
    _currentOperation = null;
  }

  void appendNumber(String numberStrToAppend) {
    if (numberStrToAppend == "." && _currentOperand.contains(".")) {
      return;
    }

    setState(() {
      if (_currentOperand == _zeroStr && numberStrToAppend != ".") {
        _currentOperand = numberStrToAppend;
        return;
      }
      if (_currentOperand == _negativeSignStr+_zeroStr && numberStrToAppend != ".") {
        _currentOperand = _negativeSignStr + numberStrToAppend;
        return;
      }
      _currentOperand = reformatNumber(_currentOperand + numberStrToAppend);
    });
  }

  void deleteNumber() {
    if (_currentOperand.length > 1) {
      _currentOperand = reformatNumber(
          _currentOperand.substring(0, _currentOperand.length - 1));
    } else {
      _currentOperand = _zeroStr;
    }
  }

  void chooseOperation(ActionID _selectedOperation) {
    String nextOperand = _zeroStr;
    if (_currentOperand == _negativeSignStr) return;
    if (_currentOperation != null && _selectedOperation != ActionID.Subtract) return;
    if (_currentOperation != null ) {
        nextOperand = _negativeSignStr + _zeroStr;
    }
      // CANNOT compute result here unless it interferes with the negative

    setState(() {
      _previousOperand = _currentOperand + " ${_selectedOperation.symbol} ";
      _currentOperand = nextOperand;
      _currentOperation = _selectedOperation;
    });
  }

  void computeResult() {
    double firstOperand = extractDoubleFromString(_previousOperand);
    double secondOperand = extractDoubleFromString(_currentOperand);
    num result = 0;

    switch (_currentOperation) {
      case ActionID.Add:
        result = firstOperand + secondOperand;
        break;
      case ActionID.Subtract:
        result = firstOperand - secondOperand;
        break;
      case ActionID.Multiply:
        result = firstOperand * secondOperand;
        break;
      case ActionID.Divide:
        result = firstOperand / secondOperand;
        break;
      default:
        print("The default was reached in computeResult");
        break;
    }

    String resultAsString =
        isInteger(result) ? "${result.toString().split('.')[0]}" : "$result";

    setState(() {
      _currentOperand = reformatNumber(resultAsString);
      _currentOperation = null;
    });
  }

  void actionButtonPressed(ActionID actionId) {
    setState(() {
      switch (actionId) {
        case ActionID.AC:
          allClear();
          break;
        case ActionID.ChangeTheme:
          // A Function
          break;
        case ActionID.Percentage:
          // A Function
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
          computeResult();
          break;
        case ActionID.Backspace:
          deleteNumber();
          break;
        default:
          break;
      }
    });
  }
}
