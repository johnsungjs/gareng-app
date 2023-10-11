import 'package:flutter/material.dart';
import 'package:gareng_front/config.dart';
import 'package:gareng_front/constants/format_currency.dart';
import 'package:gareng_front/constants/format_date.dart';
import 'package:gareng_front/models/history_response_model.dart';

import '../constants/custom_style.dart';

class HistoryList extends StatelessWidget {
  const HistoryList({super.key, required this.history});
  final HistoryResponseModel history;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: history.data.transactionHeaders.length,
      itemBuilder: (_, index) {
        return (Container(
          margin: const EdgeInsets.symmetric(vertical: 4),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
          width: double.infinity,
          decoration: customShadowNoRadius,
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      'http://${Config.apiURL}/transaction/restaurantimage',
                      height: 80,
                      width: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    width: 18,
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          FormatDate.convertIndo(history
                              .data.transactionHeaders[index].transactionDate),
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Text(
                          'Payment Method: ${history.data.transactionHeaders[index].paymentMethod}',
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Divider(
                height: 20,
                thickness: 2,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    FormatCurrency.indo.format(int.parse(
                        history.data.transactionHeaders[index].payment)),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: customBlack,
                        fontSize: 20),
                  ),
                  TextButton(
                    style: ButtonStyle(
                        padding:
                            const MaterialStatePropertyAll(EdgeInsets.all(10)),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                        backgroundColor:
                            const MaterialStatePropertyAll(customBlack)),
                    onPressed: () {},
                    child: const Text(
                      'Reorder',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              )
            ],
          ),
        ));
      },
    );
  }
}
