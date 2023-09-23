import 'package:mobx/mobx.dart';

import 'expression.dart';

part 'history.g.dart';

class History = _HistoryBase with _$History;

abstract class _HistoryBase with Store {
  @observable
  ObservableList<Expression> expressions = ObservableList<Expression>();

  int get length => expressions.length;

  @action
  void addExpression(Expression expression) {
    expressions.add(expression);
  }

  @action
  void removeExpression(Expression expression) {
    expressions.remove(expression);
  }

  @action
  void clearExpressions() {
    expressions.clear();
  }
}
