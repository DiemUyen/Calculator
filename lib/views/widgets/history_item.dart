import 'package:flutter/material.dart';

import '../../models/expression.dart';
import '../../utils/app_color.dart';

class HistoryItem extends StatelessWidget {
  const HistoryItem({super.key, required this.expression});

  final Expression expression;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.only(top: 12),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: AppColor.secondaryColorContainer,
              width: 1,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '${expression.expression}',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white60,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '${expression.result}',
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
}
