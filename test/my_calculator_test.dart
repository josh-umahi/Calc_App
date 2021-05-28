import 'package:flutter_test/flutter_test.dart';

import '../lib/models/my_calculator.dart';
import '../lib/models/enums.dart';
import '../lib/functions/functions.dart';

void main() {
  MyCalculator myCalculator = MyCalculator();
  test("Append, Multiply, Equals", () {
    myCalculator.appendNumber('5');
    myCalculator.appendNumber('7');
    myCalculator.appendNumber('4');
    expect(myCalculator.currentOperand, "574");
    expect(myCalculator.previousOperandWithOperation, '');
    expect(myCalculator.currentOperation, null);

    myCalculator.chooseArithmeticOperation(ActionID.Multiply);
    expect(myCalculator.currentOperand, '0');
    expect(myCalculator.previousOperandWithOperation, '574 \u00d7');
    expect(myCalculator.currentOperation, ActionID.Multiply);

    myCalculator.appendNumber('1');
    myCalculator.appendNumber('.');
    myCalculator.appendNumber('3');
    myCalculator.appendNumber('9');
    myCalculator.appendNumber('5');
    expect(myCalculator.currentOperand, "1.395");
    expect(myCalculator.previousOperandWithOperation, '574 \u00d7');
    expect(myCalculator.currentOperation, ActionID.Multiply);

    myCalculator.chooseNonArithmeticOperation(ActionID.Equals);
    expect(myCalculator.currentOperand, "800.73");
    expect(myCalculator.previousOperandWithOperation, '');
    expect(myCalculator.currentOperation, null);
  });

  test("Dividing by Zero", () {
    myCalculator.chooseArithmeticOperation(ActionID.Divide);
    expect(myCalculator.currentOperand, "0");
    expect(myCalculator.previousOperandWithOperation, "800.73 \u00f7");
    expect(myCalculator.currentOperation, ActionID.Divide);

    myCalculator.chooseArithmeticOperation(ActionID.Add);
    expect(myCalculator.currentOperand, errorText);
    expect(myCalculator.previousOperandWithOperation, '');
    expect(myCalculator.currentOperation, null);

    myCalculator.chooseNonArithmeticOperation(ActionID.AC);
    expect(myCalculator.currentOperand, '0');
    expect(myCalculator.previousOperandWithOperation, '');
    expect(myCalculator.currentOperation, null);
  });
}
