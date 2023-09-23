import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/expression.dart';
import 'models/history.dart';
import 'views/calculator_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          Provider<Expression>(create: (_) => Expression()),
          Provider<History>(create: (_) => History()),
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
