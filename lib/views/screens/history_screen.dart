import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../models/history.dart';
import '../../utils/app_color.dart';
import '../widgets/history_item.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final history = Provider.of<History>(context);

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
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.transparent,
                pinned: true,
                automaticallyImplyLeading: false,
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: AppColor.mainColor2,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                expandedHeight: 60,
                title: const Text(
                  'History',
                  style: TextStyle(
                    fontSize: 24,
                    color: AppColor.mainColor2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                actions: [
                  Observer(
                    builder: (_) => history.length != 0
                        ? IconButton(
                            icon: Icon(
                              Icons.delete,
                              color: AppColor.mainColor2,
                            ),
                            onPressed: history.clearAllExpressionsHistory,
                          )
                        : const SizedBox(),
                  ),
                ],
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (_, __) => Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Observer(
                          builder: (_) => history.length == 0
                              ? Center(
                                  child: Text(
                                    'No calculated history found.',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              : ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: history.length,
                                  itemBuilder: (_, index) => Dismissible(
                                    key: Key(UniqueKey().toString()),
                                    onDismissed: (_) {
                                      history.deleteOneExpressionHistory(
                                          history.expressions[index]);
                                    },
                                    direction: DismissDirection.endToStart,
                                    background: Container(
                                      alignment: Alignment.centerRight,
                                      padding: const EdgeInsets.only(right: 16),
                                      color: Colors.red.shade400,
                                      child: const Icon(
                                        Icons.delete,
                                        color: Colors.white,
                                      ),
                                    ),
                                    child: HistoryItem(
                                      expression: history.expressions[index],
                                    ),
                                  ),
                                ),
                        ),
                      ),
                    ],
                  ),
                  childCount: 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
