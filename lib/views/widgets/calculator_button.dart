import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/expression.dart';
import '../../models/history.dart';
import '../../utils/buttons.dart';
import '../../utils/enums.dart';

class CalculatorButton extends StatelessWidget {
  const CalculatorButton({super.key, required this.button});

  final Button button;

  @override
  Widget build(BuildContext context) {
    final expression = Provider.of<Expression>(context);
    final history = Provider.of<History>(context);

    return Container(
      decoration: BoxDecoration(
        color: button.backgroundColor,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: button.backgroundColor,
          width: 1,
        ),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(4),
        onTap: () {
          expression.buttonPressed(button.type, symbol: button.symbol);
          if (button.type == InputType.equal) {
            var temp = Expression();
            temp.expression = expression.expression;
            temp.result = expression.result;
            history.addExpressionHistory(temp);
          }
        },
        child: Center(
          child: Text(
            button.symbol,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: button.foregroundColor,
            ),
          ),
        ),
      ),
    );
  }
}
