// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

History _$HistoryFromJson(Map<String, dynamic> json) => History()
  ..expressions = const ObservableHistoryConverter()
      .fromJson(json['expressions'] as Iterable<Map<String, dynamic>>);

Map<String, dynamic> _$HistoryToJson(History instance) => <String, dynamic>{
      'expressions':
          const ObservableHistoryConverter().toJson(instance.expressions),
    };

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$History on _HistoryBase, Store {
  late final _$expressionsAtom =
      Atom(name: '_HistoryBase.expressions', context: context);

  @override
  ObservableList<Expression> get expressions {
    _$expressionsAtom.reportRead();
    return super.expressions;
  }

  @override
  set expressions(ObservableList<Expression> value) {
    _$expressionsAtom.reportWrite(value, super.expressions, () {
      super.expressions = value;
    });
  }

  late final _$_HistoryBaseActionController =
      ActionController(name: '_HistoryBase', context: context);

  @override
  void addExpression(Expression expression) {
    final _$actionInfo = _$_HistoryBaseActionController.startAction(
        name: '_HistoryBase.addExpression');
    try {
      return super.addExpression(expression);
    } finally {
      _$_HistoryBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeExpression(Expression expression) {
    final _$actionInfo = _$_HistoryBaseActionController.startAction(
        name: '_HistoryBase.removeExpression');
    try {
      return super.removeExpression(expression);
    } finally {
      _$_HistoryBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearExpressions() {
    final _$actionInfo = _$_HistoryBaseActionController.startAction(
        name: '_HistoryBase.clearExpressions');
    try {
      return super.clearExpressions();
    } finally {
      _$_HistoryBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
expressions: ${expressions}
    ''';
  }
}
