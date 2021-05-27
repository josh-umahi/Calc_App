import 'package:flutter/material.dart';

import './enums.dart';
import '../utils/functions.dart';

class MyCalculator extends ChangeNotifier {
  static const _zeroStr = '0';
  static const _negativeSignStr = '-';
  static const _maxInputLength = maxResultLength;

  String _previousOperandWithOperation = '';
  String get previousOperandWithOperation => _previousOperandWithOperation;
  String _currentOperand = _zeroStr;
  String get currentOperand => _currentOperand;
  ActionID? _currentOperation;
  ActionID? get currentOperation => _currentOperation;

  void allClear() {
    _previousOperandWithOperation = "";
    _currentOperand = _zeroStr;
    _currentOperation = null;

    notifyListeners();
  }

  void appendNumber(String numberStrToAppend) {
    if (_currentOperand.length > _maxInputLength) return;
    if (numberStrToAppend == "." && _currentOperand.contains(".")) return;

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

    notifyListeners();
  }

  void deleteNumber() {
    RegExp regexNegativeDigit = RegExp(r"^-\d{1}$");
    RegExp regexPositiveDigit = RegExp(r"^\d{1}$");

    if (regexNegativeDigit.hasMatch(_currentOperand)){
      _currentOperand = _negativeSignStr + _zeroStr;
      return;
    }
    if (regexPositiveDigit.hasMatch(_currentOperand)) {
      _currentOperand = _zeroStr;
      return;
    }
    _currentOperand = reformatNumber(
        _currentOperand.substring(0, _currentOperand.length - 1));

    notifyListeners();
  }

  void changeSign() {
    _currentOperand = (_currentOperand.contains(_negativeSignStr))
        ? _currentOperand.replaceFirst(_negativeSignStr, '')
        : _negativeSignStr + _currentOperand;

    notifyListeners();
  }

  void displayResultOfCalculation() {
    _currentOperand = calculateResult(
      previousOperandWithOperation: _previousOperandWithOperation,
      currentOperand: _currentOperand,
      currentOperation: _currentOperation,
    );
    _previousOperandWithOperation = '';
    _currentOperation = null;

    notifyListeners();
  }

  void chooseArithmeticOperation(ActionID _selectedOperation) {
    if (_currentOperation != null) {
      displayResultOfCalculation();
      if (isErrorOnScreen(_currentOperand)) return;
    }

    _previousOperandWithOperation =
        "$_currentOperand ${_selectedOperation.symbol}";
    _currentOperand = _zeroStr;
    _currentOperation = _selectedOperation;

    notifyListeners();
  }

  void chooseNonArithmeticOperation(ActionID actionId) {
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
      case ActionID.Equals:
        displayResultOfCalculation();
        break;
      case ActionID.Backspace:
        isErrorOnScreen(_currentOperand) ? allClear() : deleteNumber();
        break;
      default:
        print("The default was reached in chooseNonArithmeticOperation");
        break;
    }
  }
}
