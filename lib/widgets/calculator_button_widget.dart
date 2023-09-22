import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/expression.dart';
import '../utils/buttons.dart';

class CalculatorButton extends StatelessWidget {
  const CalculatorButton({super.key, required this.button});

  final Button button;

  @override
  Widget build(BuildContext context) {
    final expression = Provider.of<Expression>(context);

    return Container(
      margin: EdgeInsets.all(2),
      decoration: BoxDecoration(
        border: Border.all(
          color: button.borderColor.shade100,
        ),
        borderRadius: BorderRadius.circular(4),
        color: button.backgroundColor,
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        borderRadius: BorderRadius.circular(4),
        child: Center(
          child: Text(
            button.symbol,
            style: TextStyle(
              fontSize: 16,
              color: button.foregroundColor,
            ),
          ),
        ),
        onTap: () {
          expression.addExpression(button.symbol);
        },
      ),
    );
  }
}
