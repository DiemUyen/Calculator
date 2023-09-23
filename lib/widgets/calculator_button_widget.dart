import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/expression.dart';
import '../models/history.dart';
import '../utils/buttons.dart';

class CalculatorButton extends StatelessWidget {
  const CalculatorButton({super.key, required this.button});

  final Button button;

  @override
  Widget build(BuildContext context) {
    final expression = Provider.of<Expression>(context);
    final history = Provider.of<History>(context, listen: false);

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
          if (button.symbol == '=') {
            final expr = Expression();
            expr.expression = expression.expression;
            expr.result = expression.result;
            history.addExpression(expr);
          }
        },
      ),
    );
  }
}
