import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../models/expression.dart';
import '../../utils/app_color.dart';
import '../../utils/buttons.dart';
import '../widgets/calculator_button.dart';
import 'history_screen.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final expression = Provider.of<Expression>(context);

    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColor.mainColor2Container,
                AppColor.mainColor1Container,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: const Text(
                        'Calculator',
                        style: TextStyle(
                          fontSize: 24,
                          color: AppColor.mainColor2,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.history,
                        color: AppColor.mainColor2,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const HistoryScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Observer(
                    builder: (_) => SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${expression.expression}',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white60,
                            ),
                            textAlign: TextAlign.right,
                          ),
                          Text(
                            '${expression.result}',
                            style: TextStyle(
                              fontSize: 40,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 3,
                  crossAxisSpacing: 3,
                  childAspectRatio: 1.25,
                ),
                itemBuilder: (context, index) => Center(
                  child: CalculatorButton(button: ButtonList.buttons[index]),
                ),
                itemCount: ButtonList.buttons.length,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
