import 'package:flutter/material.dart';

import '../widgets/history_item.dart';

class HistoryView extends StatefulWidget {
  const HistoryView({super.key});

  @override
  State<HistoryView> createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) => HistoryItem(),
          ),
        ),
      );
}
