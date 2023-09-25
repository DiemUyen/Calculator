import 'package:json_annotation/json_annotation.dart';
import 'package:mobx/mobx.dart';

import '../utils/enums.dart';

part 'expression.g.dart';

@JsonSerializable()
class Expression extends _ExpressionStore with _$Expression {
  Expression();

  factory Expression.fromJson(Map<String, dynamic> json) =>
      _$ExpressionFromJson(json);

  Map<String, dynamic> toJson() => _$ExpressionToJson(this);
}

abstract class _ExpressionStore with Store {
  // Expression is shown on the screen to help people know what they typed
  @observable
  var expression = '';

  // Result is shown on the screen to help people know the result of the expression or the result of the current input
  @observable
  var result = '0';

  // The current input type is the type of the current input
  var currentInputType = InputType.number;

  // The stack expression is the list of number that is being typed
  // For example, if the user types 1 + 2, the stack expression will be [1, 2]
  List<String> stackVariables = [];

  // The stack operations is the list of operations that is being typed
  // For example, if the user types 1 + 2, the stack operations will be [+]
  List<String> stackOperations = [];

  @action
  void buttonPressed(InputType type, {String symbol = ''}) {
    switch (type) {
      case InputType.clear:
        if (currentInputType == InputType.clear ||
            currentInputType == InputType.equal) {
          clearAll();
        } else {
          clearCurrentInput();
        }
        break;
      case InputType.sign:
        signPressed();
        break;
      case InputType.percent:
        percentPressed();
        break;
      case InputType.delete:
        deleteOneNumberInput();
        break;
      case InputType.number:
        numberPressed(symbol);
        break;
      case InputType.dot:
        dotPressed();
        break;
      case InputType.operation:
        operationPressed(symbol);
        break;
      case InputType.equal:
        equalPressed();
        break;
    }
  }

  @action
  void clearCurrentInput() {
    result = '0';
    currentInputType = InputType.clear;
  }

  @action
  void clearAll() {
    expression = '';
    result = '0';
    currentInputType = InputType.clear;
    stackVariables.clear();
    stackOperations.clear();
  }

  @action
  void signPressed() {
    if (currentInputType == InputType.equal) {
      expression = '';
      if (result.startsWith('-')) {
        result = result.substring(1);
      } else {
        result = '-$result';
      }
      stackVariables.clear();
      stackOperations.clear();
    } else {
      if (result.startsWith('-')) {
        result = result.substring(1);
      } else {
        result = '-$result';
      }
    }
    currentInputType = InputType.sign;
  }

  @action
  void percentPressed() {
    if (currentInputType == InputType.equal) {
      expression = '';
      result = (double.parse(result) / 100).toString();
      stackVariables.clear();
      stackOperations.clear();
    } else {
      if (result == '0') {
        result = '0';
      } else {
        result = (double.parse(result) / 100).toString();
      }
    }
    currentInputType = InputType.percent;
  }

  @action
  void deleteOneNumberInput() {
    if (result.length == 1) {
      result = '0';
    } else {
      result = result.substring(0, result.length - 1);
    }
    currentInputType = InputType.delete;
  }

  @action
  void numberPressed(String number) {
    if (currentInputType == InputType.equal) {
      expression = '';
      result = number;
      stackVariables.clear();
      stackOperations.clear();
    } else {
      if (number == '0') {
        if (result != '0' && result != '-0') {
          result += number;
        }
      } else {
        if (result == '0') {
          result = number;
        } else if (result == '-0') {
          result = '-$number';
        } else {
          result += number;
        }
      }
    }
    currentInputType = InputType.number;
  }

  @action
  void dotPressed() {
    if (currentInputType == InputType.equal) {
      expression = '';
      result = '$result.';
      stackVariables.clear();
      stackOperations.clear();
    } else {
      if (!result.contains('.')) {
        result += '.';
      }
    }
    currentInputType = InputType.dot;
  }

  @action
  void operationPressed(String operation) {
    if (currentInputType == InputType.equal) {
      expression = result;
      stackOperations.clear();
    } else if (currentInputType == InputType.operation) {
      stackOperations.removeLast();
      expression = expression.substring(0, expression.length - 3);
    } else {
      stackVariables.add(result);
      expression += '$result';
    }
    stackOperations.add(operation);
    expression += ' $operation ';
    result = '0';
    currentInputType = InputType.operation;
  }

  @action
  void equalPressed() {
    if (currentInputType != InputType.equal) {
      stackVariables.add(result);
      expression += '$result = ';

      var indexOperation = 0;
      var hasDivideOrMultiply = true;

      while (stackOperations.isNotEmpty) {
        if (hasDivideOrMultiply) {
          if (stackOperations[indexOperation] == 'x') {
            stackVariables[indexOperation] = multiply(
                    stackVariables[indexOperation],
                    stackVariables[indexOperation + 1])
                .toString();
            stackVariables.removeAt(indexOperation + 1);
            stackOperations.removeAt(indexOperation);
          } else if (stackOperations[indexOperation] == '÷') {
            stackVariables[indexOperation] = divide(
                    stackVariables[indexOperation],
                    stackVariables[indexOperation + 1])
                .toString();
            stackVariables.removeAt(indexOperation + 1);
            stackOperations.removeAt(indexOperation);
          } else {
            indexOperation++;
          }

          // If the index operation is the last index of the stack operations, then we need to reset the index operation to 0
          // and set the hasDivideOrMultiply to false
          // and calculate the remaining operations
          if (indexOperation >= stackOperations.length) {
            indexOperation = 0;
            hasDivideOrMultiply = false;
          }
        } else {
          if (stackOperations[indexOperation] == '+') {
            stackVariables[indexOperation] = add(stackVariables[indexOperation],
                    stackVariables[indexOperation + 1])
                .toString();
            stackVariables.removeAt(indexOperation + 1);
            stackOperations.removeAt(indexOperation);
          } else if (stackOperations[indexOperation] == '-') {
            stackVariables[indexOperation] = subtract(
                    stackVariables[indexOperation],
                    stackVariables[indexOperation + 1])
                .toString();
            stackVariables.removeAt(indexOperation + 1);
            stackOperations.removeAt(indexOperation);
          }
        }
      }
    }
    simplifyResult(stackVariables[0]);
    stackVariables[0] = result;
    currentInputType = InputType.equal;
  }

  double add(String numberOne, String numberTwo) =>
      double.parse(numberOne) + double.parse(numberTwo);

  double subtract(String numberOne, String numberTwo) =>
      double.parse(numberOne) - double.parse(numberTwo);

  double multiply(String numberOne, String numberTwo) =>
      double.parse(numberOne) * double.parse(numberTwo);

  double divide(String numberOne, String numberTwo) =>
      double.parse(numberOne) / double.parse(numberTwo);

  void simplifyResult(String number) {
    var resultSplit = number.split('.');
    if (resultSplit[1] == '0') {
      result = resultSplit[0];
    } else {
      result = number;
    }
  }
}
