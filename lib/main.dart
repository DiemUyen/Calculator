import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/expression.dart';
import 'models/history.dart';
import 'utils/local_storage.dart';
import 'utils/theme.dart';
import 'views/screens/calculator_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  late History history;
  late LocalStorage localStorage;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    history = History();
    localStorage = LocalStorage();
    getHistory();
  }

  void getHistory() async {
    await localStorage.init();
    final savedHistory = localStorage.getString('history');
    if (savedHistory != null) {
      var savedHistoryList = History.fromJson(jsonDecode(savedHistory));
      history.clearAllExpressionsHistory();
      for (var expr in savedHistoryList.expressions) {
        history.addExpressionHistory(expr);
      }
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state != AppLifecycleState.resumed) {
      localStorage.putString('history', jsonEncode(history.toJson()));
    } else {
      getHistory();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          Provider<Expression>(create: (_) => Expression()),
          Provider<History>.value(value: history),
          Provider<LocalStorage>.value(value: localStorage),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Calculator',
          theme: getThemeData(context),
          home: const CalculatorScreen(),
        ),
      );
}
