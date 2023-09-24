import 'package:mobx/mobx.dart';

import 'expression.dart';

part 'history.g.dart';

class History = _HistoryStore with _$History;

abstract class _HistoryStore with Store {
  // History is a list of expressions that have been calculated
  @observable
  ObservableList<Expression> expressions = ObservableList();

  int get length => expressions.length;

  @action
  void addExpressionHistory(Expression expression) {
    expressions.insert(0, expression);
  }

  @action
  void deleteOneExpressionHistory(Expression expression) {
    expressions.remove(expression);
  }

  @action
  void clearAllExpressionsHistory() {
    expressions.clear();
  }
}
