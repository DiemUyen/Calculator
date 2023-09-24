import 'package:flutter/material.dart';

import '../utils/app_color.dart';
import '../utils/enums.dart';

class Button {
  final String symbol;
  final InputType type;
  final Color foregroundColor;
  final Color backgroundColor;

  const Button({
    required this.symbol,
    required this.type,
    this.foregroundColor = Colors.white,
    this.backgroundColor = AppColor.mainColor2,
  });
}

class ButtonList {
  static final buttons = [
    Button(
      symbol: 'C/CE',
      type: InputType.clear,
      backgroundColor: AppColor.mainColor1Surface,
    ),
    Button(
      symbol: '+/-',
      type: InputType.sign,
      backgroundColor: AppColor.secondaryColorSurface,
    ),
    Button(
      symbol: '%',
      type: InputType.percent,
      backgroundColor: AppColor.secondaryColorSurface,
    ),
    Button(
      symbol: 'DEL',
      type: InputType.delete,
      backgroundColor: AppColor.mainColor1,
    ),
    Button(
      symbol: '7',
      type: InputType.number,
    ),
    Button(
      symbol: '8',
      type: InputType.number,
    ),
    Button(
      symbol: '9',
      type: InputType.number,
    ),
    Button(
      symbol: '÷',
      type: InputType.operation,
      backgroundColor: AppColor.secondaryColorSurface,
    ),
    Button(
      symbol: '4',
      type: InputType.number,
    ),
    Button(
      symbol: '5',
      type: InputType.number,
    ),
    Button(
      symbol: '6',
      type: InputType.number,
    ),
    Button(
      symbol: 'x',
      type: InputType.operation,
      backgroundColor: AppColor.secondaryColorSurface,
    ),
    Button(
      symbol: '1',
      type: InputType.number,
    ),
    Button(
      symbol: '2',
      type: InputType.number,
    ),
    Button(
      symbol: '3',
      type: InputType.number,
    ),
    Button(
      symbol: '-',
      type: InputType.operation,
      backgroundColor: AppColor.secondaryColorSurface,
    ),
    Button(
      symbol: '.',
      type: InputType.dot,
      backgroundColor: AppColor.secondaryColorSurface,
    ),
    Button(
      symbol: '0',
      type: InputType.number,
    ),
    Button(
      symbol: '=',
      type: InputType.equal,
      backgroundColor: AppColor.mainColor1,
    ),
    Button(
      symbol: '+',
      type: InputType.operation,
      backgroundColor: AppColor.secondaryColorSurface,
    ),
  ];
}
