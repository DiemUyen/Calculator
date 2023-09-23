import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/expression.dart';
import 'models/history.dart';
import 'utils/local_storage.dart';
import 'views/calculator_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final LocalStorage _localStorage;
  var _history = History();

  @override
  void initState() {
    super.initState();
    _localStorage = LocalStorage();
    getHistory();
  }

  void getHistory() async {
    await _localStorage.init();
    var savedHistory = _localStorage.getString('history');
    if (savedHistory != null) {
      _history = History.fromJson(jsonDecode(savedHistory));
    }
    // print saved history and history
    print(savedHistory);
    print(_history);
  }

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          Provider<Expression>(create: (_) => Expression()),
          Provider<History>.value(value: _history),
          Provider<LocalStorage>.value(value: _localStorage),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Calculator',
          theme: ThemeData(
            primarySwatch: Colors.purple,
            useMaterial3: true,
          ),
          home: const CalculatorView(),
        ),
      );
}
