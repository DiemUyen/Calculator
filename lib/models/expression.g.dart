// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expression.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Expression _$ExpressionFromJson(Map<String, dynamic> json) => Expression()
  ..expression = json['expression'] as String
  ..result = json['result'] as String;

Map<String, dynamic> _$ExpressionToJson(Expression instance) =>
    <String, dynamic>{
      'expression': instance.expression,
      'result': instance.result,
    };

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Expression on _ExpressionBase, Store {
  late final _$expressionAtom =
      Atom(name: '_ExpressionBase.expression', context: context);

  @override
  String get expression {
    _$expressionAtom.reportRead();
    return super.expression;
  }

  @override
  set expression(String value) {
    _$expressionAtom.reportWrite(value, super.expression, () {
      super.expression = value;
    });
  }

  late final _$resultAtom =
      Atom(name: '_ExpressionBase.result', context: context);

  @override
  String get result {
    _$resultAtom.reportRead();
    return super.result;
  }

  @override
  set result(String value) {
    _$resultAtom.reportWrite(value, super.result, () {
      super.result = value;
    });
  }

  late final _$_ExpressionBaseActionController =
      ActionController(name: '_ExpressionBase', context: context);

  @override
  void addExpression(String value) {
    final _$actionInfo = _$_ExpressionBaseActionController.startAction(
        name: '_ExpressionBase.addExpression');
    try {
      return super.addExpression(value);
    } finally {
      _$_ExpressionBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearExpression() {
    final _$actionInfo = _$_ExpressionBaseActionController.startAction(
        name: '_ExpressionBase.clearExpression');
    try {
      return super.clearExpression();
    } finally {
      _$_ExpressionBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void calculate() {
    final _$actionInfo = _$_ExpressionBaseActionController.startAction(
        name: '_ExpressionBase.calculate');
    try {
      return super.calculate();
    } finally {
      _$_ExpressionBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
expression: ${expression},
result: ${result}
    ''';
  }
}
