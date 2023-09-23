import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/expression.dart';
import '../models/history.dart';

class HistoryItem extends StatelessWidget {
  const HistoryItem({super.key, required this.expression});

  final Expression expression;

  @override
  Widget build(BuildContext context) {
    final history = Provider.of<History>(context);

    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade300,
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  expression.expression,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '= ${expression.result}',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            icon: Icon(
              Icons.clear,
              color: Colors.grey,
            ),
            onPressed: () {
              history.removeExpression(expression);
            },
          )
        ],
      ),
    );
  }
}
