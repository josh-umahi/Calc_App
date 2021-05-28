import 'package:flutter/material.dart';

import './enums.dart';
import '../functions/functions.dart';
import '../theme.dart';

class MyCalculator extends ChangeNotifier {
  ThemeData Function() _themeData = darkThemeData;
  ThemeData Function() get themeData => _themeData;

  static const _zeroStr = '0';
  static const _negativeSignStr = '-';
  static const _maxInputLength = maxResultLength;

  String _previousOperandWithOperation = '';
  String get previousOperandWithOperation => _previousOperandWithOperation;
  String _currentOperand = _zeroStr;
  String get currentOperand => _currentOperand;
  ActionID? _currentOperation;
  ActionID? get currentOperation => _currentOperation;

  /// Toggle [_themeData] between light and dark theme
  void toggleThemeData() {
    _themeData = _themeData == darkThemeData ? lightThemeData : darkThemeData;
    notifyListeners();
  }

  /// Empties the content of [_previousOperandWithOperation] and [_currentOperation]
  /// and also reverts [_currentOperand] to [_zeroStr] which is its own form of empty
  void allClear() {
    _previousOperandWithOperation = "";
    _currentOperand = _zeroStr;
    _currentOperation = null;
    notifyListeners();
  }

  /// Takes in a string representing a number or a decimal point and
  /// appends it to [_currentOperand]
  ///
  /// The method makes use of an IIFE (Immediately invoked function expression) so that
  /// notifyListeners() can be called even if the method is returned before its end
  void appendNumber(String numberStrToAppend) {
    () {
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
    }();
    notifyListeners();
  }

  /// Empties the content of [_previousOperandWithOperation] and [_currentOperation]
  /// and also reverts [_currentOperand] to [_zeroStr] which is its own form of empty
  void deleteNumber() {
    () {
      RegExp regexNegativeDigit = RegExp(r"^-\d{1}$");
      RegExp regexPositiveDigit = RegExp(r"^\d{1}$");
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
    }();
    notifyListeners();
  }

  /// Toggles the sign of [_currentOperand] between negative and positive
  void changeSign() {
    _currentOperand = (_currentOperand.contains(_negativeSignStr))
        ? _currentOperand.replaceFirst(_negativeSignStr, '')
        : _negativeSignStr + _currentOperand;
    notifyListeners();
  }

  /// Perform the [currentOperation] using [previousOperandWithOperation] and
  /// [_currentOperand] 
  /// 
  /// Display the result in the appropriate format using commas etc
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

  /// First perform whatever operation is in [_currentOperation] if any and
  /// then attach the new arithmetic operation to [_previousOperandWithOperation] and 
  /// [_currentOperation]
  ///  
  /// If isErrorOnScreen is true at start, exit the method
  /// If isErrorOnScreen is true after displayResultOfCalculation, exit the method
  /// 
  /// The method makes use of an IIFE (Immediately invoked function expression) so that
  /// notifyListeners() can be called even if the method is returned before its end
  void chooseArithmeticOperation(ActionID _selectedOperation) {
    if (isErrorOnScreen(_currentOperand)) return;
    () {
      if (_currentOperation != null) {
        displayResultOfCalculation();
        if (isErrorOnScreen(_currentOperand)) return;
      }

      _previousOperandWithOperation =
          "$_currentOperand ${_selectedOperation.symbol}";
      _currentOperand = _zeroStr;
      _currentOperation = _selectedOperation;
    }();
    notifyListeners();
  }

  /// Directs the non-arithmetic/non-number buttons to
  /// their appropriate methods
  /// 
  /// If isErrorOnScreen is true, [actionId] should only be the
  /// AC or the Backspace action unless exit the method 
  void chooseNonArithmeticOperation(ActionID actionId) {
    if (isErrorOnScreen(_currentOperand)) {
      if (actionId == ActionID.AC || actionId == ActionID.Backspace) allClear();
      return;
    }

    switch (actionId) {
      case ActionID.AC:
        allClear();
        break;
      case ActionID.ChangeTheme:
        toggleThemeData();
        break;
      case ActionID.ChangeSign:
        changeSign();
        break;
      case ActionID.Equals:
        displayResultOfCalculation();
        break;
      case ActionID.Backspace:
        deleteNumber();
        break;
      default:
        print("The default was reached in chooseNonArithmeticOperation");
        break;
    }
  }
}
