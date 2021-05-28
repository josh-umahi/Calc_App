import 'package:intl/intl.dart';

import '../models/enums.dart';

const errorText = "Error";
const decimalPlaces = 3;
const maxResultLength = 9 + decimalPlaces;

/// Return true if the [_currentOperand] currently holds
/// the value [errorText]
bool isErrorOnScreen(String _currentOperand) {
  return _currentOperand == errorText;
}

/// Calculates the result of operation and
/// returns this as a string that is appropriately 
/// formatted with commas 
/// 
/// For results greater than [maxResultLength], 
/// a string containing scientific notation 
/// to [decimalPlaces] decimal places is returned
String calculateResult({
  required String previousOperandWithOperation,
  required String currentOperand,
  ActionID? currentOperation,
}) {
  if (previousOperandWithOperation.isEmpty || currentOperation == null)
    return currentOperand;

  double firstOperand = extractDoubleFromString(previousOperandWithOperation);
  double secondOperand = extractDoubleFromString(currentOperand);
  double result = 0;

  switch (currentOperation) {
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
      if (secondOperand == 0) {
        return errorText;
      } else {
        result = firstOperand / secondOperand;
      }
      break;
    default:
      print("The default was reached in calculateResult");
      break;
  }
  String resultRounded = roundToDecimalPlaces(result);

  if (resultRounded.length > maxResultLength) {
    return result.toStringAsExponential(3);
  }
  return reformatNumber(resultRounded, isCalculationResult: true);
}

/// Given a string containing just numbers and
/// possibly a decimal point, return a new string with
/// the same numbers and appropriate commas
///
/// If [isCalculationResult] is true, then we know that numStr is a
/// calculation result and is therefore guaranteed to have no commas 
/// so don't account for such when converting it to an integer 
String reformatNumber(String numStr, {bool isCalculationResult = false}) {
  List<String> numberSplit = numStr.split('.');
  String integerSection = numberSplit[0];

  if (integerSection.length > 3) {
    // Number format to format the string of numbers to
    // one containing commas
    var f = NumberFormat();

    if (isCalculationResult) {
      integerSection = f.format(int.parse(integerSection));
    } else {
      integerSection = f.format(
        int.parse(
          integerSection.replaceAll(',', ''),
        ),
      );
    }
  }

  if (numberSplit.length == 1) {
    return integerSection;
  }
  return "$integerSection.${numberSplit[1]}";
}

/// Extract the number from a string, strip it of
/// its commas and return as a double
double extractDoubleFromString(String numStr) {
  return double.parse(numStr.split(' ')[0].replaceAll(',', ''));
}

/// Rounds the given double to [decimalPlaces] number of
/// decimal places and returns this as a string
String roundToDecimalPlaces(double value) {
  if (isInteger(value)) {
    return value.toString().split('.')[0];
  }

  String result = value.toStringAsFixed(decimalPlaces);
  while (result.contains('.') && result.endsWith('0')) {
    result = result.substring(0, result.length - 1);
  }
  return result;
}

/// Returns true if the given double has non-zero or
/// no decimal places, false otherwise
bool isInteger(double value) {
  return value is int || value == value.roundToDouble();
}
