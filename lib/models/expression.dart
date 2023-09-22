import 'package:mobx/mobx.dart';

part 'expression.g.dart';

class Expression = _ExpressionBase with _$Expression;

abstract class _ExpressionBase with Store {
  @observable
  String expression = '';

  @observable
  String result = '';

  final operationRegex = RegExp(r'[+\-x/]');

  @action
  void addExpression(String value) {
    if (result.isNotEmpty) {
      expression = result;
      result = '';
    }

    if (value == '=') {
      calculate();
    } else if (value == 'C') {
      clearExpression();
    } else if (value == 'DEL') {
      if (expression.isNotEmpty) {
        expression = expression.substring(0, expression.length - 1);
      }
    } else if (value == 'CE') {
      var indexLastOperation =
          findIndexOfLastOperation(expression, operationRegex);
      if (indexLastOperation != -1) {
        expression = expression.substring(0, indexLastOperation + 1);
      } else {
        expression = '';
      }
    } else {
      expression += value;
    }
  }

  @action
  void clearExpression() {
    expression = '';
    result = '';
  }

  String findNextVariable(String expression, Pattern pattern) {
    var operationIndex = expression.indexOf(pattern);
    // Just have variable in expression
    if (operationIndex == -1) {
      return expression;
    }
    // Have operation in expression
    if (operationIndex != 0) {
      var variable = expression.substring(0, operationIndex);
      return variable;
    }

    return '';
  }

  String findNextOperation(String expression, Pattern pattern) {
    if (hasNextOperation(expression, pattern)) {
      return expression.substring(0, 1);
    } else {
      return '';
    }
  }

  int findIndexOfLastOperation(String expression, Pattern pattern) =>
      expression.lastIndexOf(pattern);

  bool hasNextOperation(String expression, Pattern pattern) =>
      expression.indexOf(pattern) == 0;

  bool checkNumberHasPercent(String number) =>
      number.indexOf(RegExp(r'%')) != -1;

  @action
  void calculate() {
    var expr = expression;
    var stackExpr = <String>[];

    while (expr.isNotEmpty) {
      var firstVariable = findNextVariable(expr, operationRegex);
      expr = expr.substring(firstVariable.length);
      var operation = findNextOperation(expr, operationRegex);
      expr = expr.substring(operation.length);
      var secondVariable = findNextVariable(expr, operationRegex);
      expr = expr.substring(secondVariable.length);

      if (checkNumberHasPercent(firstVariable)) {
        var number =
            double.parse(firstVariable.substring(0, firstVariable.length - 1));
        firstVariable = (number / 100).toString();
      }
      if (checkNumberHasPercent(secondVariable)) {
        var number = double.parse(
            secondVariable.substring(0, secondVariable.length - 1));
        secondVariable = (number / 100).toString();
      }

      if (firstVariable.isNotEmpty) {
        stackExpr.add(firstVariable);
      }
      if (operation.isNotEmpty) {
        switch (operation) {
          case '+':
          case '-':
            stackExpr.add(operation);
            stackExpr.add(secondVariable);
            break;
          case 'x':
            var result = double.parse(stackExpr.removeLast()) *
                double.parse(secondVariable);
            stackExpr.add(result.toString());
            break;
          case '/':
            var result = double.parse(stackExpr.removeLast()) /
                double.parse(secondVariable);
            stackExpr.add(result.toString());
            break;
        }
      }
    }

    while (stackExpr.length != 1) {
      var operation = stackExpr[1];
      var temp = 0.0;
      switch (operation) {
        case '+':
          temp = double.parse(stackExpr[0]) + double.parse(stackExpr[2]);
          break;
        case '-':
          temp = double.parse(stackExpr[0]) - double.parse(stackExpr[2]);
          break;
      }
      stackExpr.first = temp.toString();
      stackExpr.removeRange(1, 3);
    }

    if (double.parse(stackExpr.last) == double.parse(stackExpr.last).ceil()) {
      result = double.parse(stackExpr.last).ceil().toString();
    } else {
      result = stackExpr.last;
    }
  }
}
