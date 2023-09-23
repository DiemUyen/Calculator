import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../models/history.dart';
import '../widgets/history_item.dart';

class HistoryView extends StatefulWidget {
  const HistoryView({super.key});

  @override
  State<HistoryView> createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> {
  @override
  Widget build(BuildContext context) {
    final history = Provider.of<History>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("History"),
        actions: [
          Observer(
            builder: (_) {
              if (history.length == 0) {
                return Container();
              }
              return IconButton(
                icon: Icon(
                  Icons.delete_outline_rounded,
                  color: Colors.grey,
                ),
                onPressed: history.clearExpressions,
              );
            }
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        child: Observer(
          builder: (_) => ListView.builder(
            shrinkWrap: true,
            itemCount: history.length,
            itemBuilder: (context, index) => HistoryItem(
              expression: history.expressions[index],
            ),
          ),
        ),
      ),
    );
  }
}
