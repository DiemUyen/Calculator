import 'package:json_annotation/json_annotation.dart';
import 'package:mobx/mobx.dart';

import 'expression.dart';

part 'history.g.dart';

@JsonSerializable()
class History extends _HistoryStore with _$History {
  History();

  factory History.fromJson(Map<String, dynamic> json) =>
      _$HistoryFromJson(json);

  Map<String, dynamic> toJson() => _$HistoryToJson(this);
}

abstract class _HistoryStore with Store {
  // History is a list of expressions that have been calculated
  @observable
  @ObservableExpressionListConverter()
  ObservableList<Expression> expressions = ObservableList();

  @computed
  bool get isEmpty => expressions.isEmpty;

  @computed
  bool get isNotEmpty => expressions.isNotEmpty;

  int get length => expressions.length;

  @action
  void addExpressionHistory(Expression expression) {
    var temp = Expression();
    temp.expression = expression.expression;
    temp.result = expression.result;
    expressions.insert(0, temp);
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

class ObservableExpressionListConverter extends JsonConverter<
    ObservableList<Expression>, List<dynamic>> {
  const ObservableExpressionListConverter();

  @override
  ObservableList<Expression> fromJson(List<dynamic> json) =>
      ObservableList.of(json.map((e) => Expression.fromJson(e as Map<String, dynamic>)));

  @override
  List<dynamic> toJson(ObservableList<Expression> object) =>
      object.map((e) => e.toJson()).toList();
}
