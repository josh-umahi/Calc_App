import 'package:intl/intl.dart';

import '../../screens/BasicCalculator/enums.dart';

const errorText = "Error";
const decimalPlaces = 3;
const maxResultLength = 9 + decimalPlaces;

bool errorOnScreen(String _currentOperand) {
  return _currentOperand == errorText;
}

/// Calculates the result of operation and
/// returns this as a string in the appropriate format
String calculateResult(
  String _previousOperand,
  String _currentOperand,
  ActionID? _currentOperation,
) {
  if (_previousOperand.isEmpty || _currentOperation == null)
    return _currentOperand;

  double firstOperand = extractDoubleFromString(_previousOperand);
  double secondOperand = extractDoubleFromString(_currentOperand);
  double result = 0;

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
  print("Result as a double >>>> $result");
  String resultRounded = roundToDecimalPlaces(result);

  if (resultRounded.length > maxResultLength) {
    return result.toStringAsExponential(3);
  }
  return reformatNumber(resultRounded);
}

String reformatNumber(String numberToReformat) {
  List<String> numberSplit = numberToReformat.split('.');
  String integerSection = numberSplit[0];

  if (integerSection.length > 3) {
    var f = NumberFormat();
    integerSection = f.format(int.parse(integerSection.replaceAll(',', '')));
  }

  if (numberSplit.length == 1) {
    return integerSection;
  }
  return "$integerSection.${numberSplit[1]}";
}

double extractDoubleFromString(String numStr) {
  return double.parse(numStr.split(' ')[0].replaceAll(',', ''));
}

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

bool isInteger(double value) {
  return value is int || value == value.roundToDouble();
}
