import 'package:flutter/material.dart';
import 'package:gareng_front/models/history_response_model.dart';

class HistoryList extends StatelessWidget {
  const HistoryList({super.key, required this.history});
  final HistoryResponseModel history;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: history.data.transactionHeaders.length,
      itemBuilder: (_, index) {
        return (Container(
          child: Column(
            children: [
              Text('Transaction no $index'),
              Text('${history.data.transactionHeaders[index].paymentMethod}'),
              Text('${history.data.transactionHeaders[index].imageUrl}'),
              Image.network(history.data.transactionHeaders[index].imageUrl),
            ],
          ),
        ));
      },
    );
  }
}
