// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

History _$HistoryFromJson(Map<String, dynamic> json) => History()
  ..expressions = const ObservableExpressionListConverter()
      .fromJson(json['expressions'] as List);

Map<String, dynamic> _$HistoryToJson(History instance) => <String, dynamic>{
      'expressions': const ObservableExpressionListConverter()
          .toJson(instance.expressions),
    };

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$History on _HistoryStore, Store {
  Computed<bool>? _$isEmptyComputed;

  @override
  bool get isEmpty => (_$isEmptyComputed ??=
          Computed<bool>(() => super.isEmpty, name: '_HistoryStore.isEmpty'))
      .value;
  Computed<bool>? _$isNotEmptyComputed;

  @override
  bool get isNotEmpty =>
      (_$isNotEmptyComputed ??= Computed<bool>(() => super.isNotEmpty,
              name: '_HistoryStore.isNotEmpty'))
          .value;

  late final _$expressionsAtom =
      Atom(name: '_HistoryStore.expressions', context: context);

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

  late final _$_HistoryStoreActionController =
      ActionController(name: '_HistoryStore', context: context);

  @override
  void addExpressionHistory(Expression expression) {
    final _$actionInfo = _$_HistoryStoreActionController.startAction(
        name: '_HistoryStore.addExpressionHistory');
    try {
      return super.addExpressionHistory(expression);
    } finally {
      _$_HistoryStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deleteOneExpressionHistory(Expression expression) {
    final _$actionInfo = _$_HistoryStoreActionController.startAction(
        name: '_HistoryStore.deleteOneExpressionHistory');
    try {
      return super.deleteOneExpressionHistory(expression);
    } finally {
      _$_HistoryStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearAllExpressionsHistory() {
    final _$actionInfo = _$_HistoryStoreActionController.startAction(
        name: '_HistoryStore.clearAllExpressionsHistory');
    try {
      return super.clearAllExpressionsHistory();
    } finally {
      _$_HistoryStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
expressions: ${expressions},
isEmpty: ${isEmpty},
isNotEmpty: ${isNotEmpty}
    ''';
  }
}
