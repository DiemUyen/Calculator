import 'package:json_annotation/json_annotation.dart';
import 'package:mobx/mobx.dart';

import 'expression.dart';

part 'history.g.dart';

@JsonSerializable()
class History extends _HistoryBase with _$History {
  History();

  factory History.fromJson(Map<String, dynamic> json) =>
      _$HistoryFromJson(json);

  Map<String, dynamic> toJson() => _$HistoryToJson(this);
}

abstract class _HistoryBase with Store {
  @observable
  @ObservableHistoryConverter()
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

class ObservableHistoryConverter extends JsonConverter<
    ObservableList<Expression>, Iterable<Map<String, dynamic>>> {
  const ObservableHistoryConverter();

  @override
  ObservableList<Expression> fromJson(Iterable<Map<String, dynamic>> json) =>
      ObservableList.of(json.map(Expression.fromJson));

  @override
  Iterable<Map<String, dynamic>> toJson(ObservableList<Expression> object) =>
      object.map((element) => element.toJson());
}
