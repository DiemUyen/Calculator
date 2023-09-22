import 'package:flutter/material.dart';

class Button {
  final String symbol;
  final Color foregroundColor;
  final Color backgroundColor;
  final MaterialColor borderColor;

  Button(
    this.symbol, {
    this.foregroundColor = Colors.black87,
    this.backgroundColor = Colors.white,
    this.borderColor = Colors.grey,
  });
}

final buttons = <Button>[
  Button('%'),
  Button('CE'),
  Button('C'),
  Button(
    'DEL',
    foregroundColor: Colors.white,
    backgroundColor: Colors.red.shade300,
    borderColor: Colors.red,
  ),
  Button('7'),
  Button('8'),
  Button('9'),
  Button('/'),
  Button('4'),
  Button('5'),
  Button('6'),
  Button('x'),
  Button('1'),
  Button('2'),
  Button('3'),
  Button('-'),
  Button('.'),
  Button('0'),
  Button(
    '=',
    foregroundColor: Colors.white,
    backgroundColor: Colors.green.shade300,
    borderColor: Colors.green,
  ),
  Button('+'),
];
