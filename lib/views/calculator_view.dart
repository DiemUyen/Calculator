import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../models/expression.dart';
import '../utils/buttons.dart';
import '../widgets/calculator_button_widget.dart';
import 'history_view.dart';

class CalculatorView extends StatefulWidget {
  const CalculatorView({super.key});

  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {

  @override
  Widget build(BuildContext context) {
    final expression = Provider.of<Expression>(context);

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.history),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HistoryView(),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Observer(
                builder: (_) => Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      expression.expression,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.end,
                    ),
                    const SizedBox(height: 8),
                    const Spacer(),
                    Text(
                      expression.result,
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
              physics: NeverScrollableScrollPhysics(),
              itemCount: buttons.length,
              itemBuilder: (context, index) => CalculatorButton(
                button: buttons[index],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
