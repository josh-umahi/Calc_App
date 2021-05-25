import 'package:intl/intl.dart';

import '../../screens/BasicCalculator/enums.dart';

const _infinityStr = "\u221E";

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
      result = firstOperand / secondOperand;
      // handle infinity
      break;
    default:
      print("The default was reached in calculateResult");
      break;
  }

  String resultAsString = convertTo3dp(result);
  return reformatNumber(resultAsString);
}

String reformatNumber(String numberToReformat) {
  List<String> numberSplit = numberToReformat.split('.');
  String integerSection = numberSplit[0];
  if (integerSection.length > 3) {
    var f = NumberFormat();
    integerSection = f.format(int.parse(integerSection.replaceAll(',', '')));
  }
  if (numberSplit.length > 1) {
    return "$integerSection.${numberSplit[1]}";
  } else {
    return integerSection;
  }
}

double extractDoubleFromString(String numStr) {
  return double.parse(numStr.split(' ')[0].replaceAll(',', ''));
}

String convertTo3dp(double value) {
  print(isInteger(value));
  print((value));
  if (isInteger(value)) {
    return value.toString().split('.')[0];
  }

  String result = value.toStringAsFixed(3);
  while (result.contains('.') && result.endsWith('0')) {
    result = result.substring(0, result.length - 1);
  }
  return result;
}

bool isInteger(double value) {
  RegExp regexIsInteger = RegExp(r"^[-]?\d+$");
  return regexIsInteger.hasMatch(value.toString());
}
