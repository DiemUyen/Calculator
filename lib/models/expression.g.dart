// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expression.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Expression _$ExpressionFromJson(Map<String, dynamic> json) => Expression()
  ..expression = json['expression'] as String
  ..result = json['result'] as String
  ..currentInputType = $enumDecode(_$InputTypeEnumMap, json['currentInputType'])
  ..stackVariables =
      (json['stackVariables'] as List<dynamic>).map((e) => e as String).toList()
  ..stackOperations = (json['stackOperations'] as List<dynamic>)
      .map((e) => e as String)
      .toList();

Map<String, dynamic> _$ExpressionToJson(Expression instance) =>
    <String, dynamic>{
      'expression': instance.expression,
      'result': instance.result,
      'currentInputType': _$InputTypeEnumMap[instance.currentInputType]!,
      'stackVariables': instance.stackVariables,
      'stackOperations': instance.stackOperations,
    };

const _$InputTypeEnumMap = {
  InputType.number: 'number',
  InputType.operation: 'operation',
  InputType.equal: 'equal',
  InputType.delete: 'delete',
  InputType.clear: 'clear',
  InputType.percent: 'percent',
  InputType.dot: 'dot',
  InputType.sign: 'sign',
};

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Expression on _ExpressionStore, Store {
  late final _$expressionAtom =
      Atom(name: '_ExpressionStore.expression', context: context);

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
      Atom(name: '_ExpressionStore.result', context: context);

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

  late final _$_ExpressionStoreActionController =
      ActionController(name: '_ExpressionStore', context: context);

  @override
  void buttonPressed(InputType type, {String symbol = ''}) {
    final _$actionInfo = _$_ExpressionStoreActionController.startAction(
        name: '_ExpressionStore.buttonPressed');
    try {
      return super.buttonPressed(type, symbol: symbol);
    } finally {
      _$_ExpressionStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearCurrentInput() {
    final _$actionInfo = _$_ExpressionStoreActionController.startAction(
        name: '_ExpressionStore.clearCurrentInput');
    try {
      return super.clearCurrentInput();
    } finally {
      _$_ExpressionStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearAll() {
    final _$actionInfo = _$_ExpressionStoreActionController.startAction(
        name: '_ExpressionStore.clearAll');
    try {
      return super.clearAll();
    } finally {
      _$_ExpressionStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void signPressed() {
    final _$actionInfo = _$_ExpressionStoreActionController.startAction(
        name: '_ExpressionStore.signPressed');
    try {
      return super.signPressed();
    } finally {
      _$_ExpressionStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void percentPressed() {
    final _$actionInfo = _$_ExpressionStoreActionController.startAction(
        name: '_ExpressionStore.percentPressed');
    try {
      return super.percentPressed();
    } finally {
      _$_ExpressionStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deleteOneNumberInput() {
    final _$actionInfo = _$_ExpressionStoreActionController.startAction(
        name: '_ExpressionStore.deleteOneNumberInput');
    try {
      return super.deleteOneNumberInput();
    } finally {
      _$_ExpressionStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void numberPressed(String number) {
    final _$actionInfo = _$_ExpressionStoreActionController.startAction(
        name: '_ExpressionStore.numberPressed');
    try {
      return super.numberPressed(number);
    } finally {
      _$_ExpressionStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void dotPressed() {
    final _$actionInfo = _$_ExpressionStoreActionController.startAction(
        name: '_ExpressionStore.dotPressed');
    try {
      return super.dotPressed();
    } finally {
      _$_ExpressionStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void operationPressed(String operation) {
    final _$actionInfo = _$_ExpressionStoreActionController.startAction(
        name: '_ExpressionStore.operationPressed');
    try {
      return super.operationPressed(operation);
    } finally {
      _$_ExpressionStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void equalPressed() {
    final _$actionInfo = _$_ExpressionStoreActionController.startAction(
        name: '_ExpressionStore.equalPressed');
    try {
      return super.equalPressed();
    } finally {
      _$_ExpressionStoreActionController.endAction(_$actionInfo);
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
