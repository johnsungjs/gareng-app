import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gareng_front/constants/FormatCurrency.dart';
import 'package:gareng_front/constants/custom_style.dart';
import 'package:gareng_front/constants/itemsDummy.dart';
import 'package:gareng_front/services/api_service.dart';
import 'package:get/get.dart';

import '../models/item_controller.dart';
import '../widgets/checkout_cart.dart';
import '../widgets/payment_methods.dart';

class TransactionPage extends StatelessWidget {
  TransactionPage({super.key});
  final dataDummy = itemsDummy;
  final ItemController itemController = Get.put(ItemController());

  static DateTime today = DateTime.now();

  void handleTransactionPage() async {
    if (itemController.paymentMethod.isEmpty) {
      Get.dialog(AlertDialog(
        title: Text('Metode Pembayaran Harus Diisi'),
        actions: [
          TextButton(onPressed: () => Get.back(), child: const Text("Ok"))
        ],
      ));
    } else {
      final reqBody = {
        "transactionDate": "${today.year}-${today.month}-${today.day}",
        "payment": itemController.countGrandTotal(10000, 0),
        "paymentMethod": "cash",
        "items": itemController.items
      };

      final res = await APIService.handleTransaction(reqBody);
      if (res["status"] == 200) {
        itemController.resetState();
        //navigate to homepage
        Get.offNamed("/success-pay");
      }
    }
  }

  final testBody = {
    "transactionDate": "2023-09-09",
    "payment": 100000,
    "paymentMethod": "cash",
    "items": [
      {
        "title": "Es Teh Manis",
        "price": "2000",
        "imageUrl": "http://placekitten.com/300/300",
        "uuid": "bf654113-407c-4dbd-b888-487fea2ba6a5",
        "amount": 2
      },
    ]
  };

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: SafeArea(
          child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back),
                color: Colors.black,
              ),
              Text(
                "Checkout",
                style: TextStyle(color: Colors.grey[900]),
              ),
              const SizedBox(
                width: 50,
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.location_on),
                    Text("Ships to: "),
                    Text(
                      "Harapan Indah, Bekasi",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              CheckoutCart(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12),
                width: MediaQuery.of(context).size.width * 0.9,
                height: 50,
                decoration: BoxDecoration(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.card_giftcard),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextField(
                        onChanged: (text) {},
                        onSubmitted: (value) => {},
                        obscureText: false,
                        decoration: InputDecoration(
                          hintText: 'Promo Code',
                          labelStyle: const TextStyle(color: Colors.grey),
                          border: InputBorder.none,
                          iconColor: Colors.grey[800],
                        ),
                        cursorColor: Colors.grey[800],
                      ),
                    ),
                    TextButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8))),
                            backgroundColor:
                                MaterialStatePropertyAll(customBlack)),
                        onPressed: () {},
                        child: Text(
                          'apply',
                          style: TextStyle(color: Colors.white),
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Obx(
                () => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Subtotal'),
                      Text(FormatCurrency.indo
                          .format(int.parse(itemController.total))),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Delivery fee'),
                    Text(FormatCurrency.indo.format(10000)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Discount'),
                    Text(
                      '-${FormatCurrency.indo.format(0)}',
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: TextStyle(
                          color: customBlack, fontWeight: FontWeight.bold),
                    ),
                    Obx(() => Text(
                        '${FormatCurrency.indo.format(itemController.countGrandTotal(10000, 0))}',
                        style: TextStyle(
                            color: customBlack, fontWeight: FontWeight.bold))),
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextButton(
                    style: ButtonStyle(
                      side: MaterialStatePropertyAll(BorderSide(
                          color: customBlack,
                          width: 1.0,
                          style: BorderStyle.solid)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18))),
                    ),
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return SizedBox(
                              height: 250,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 20,
                                    ),
                                    PaymentMethods(paymentMethod: ""),
                                    PaymentMethods(paymentMethod: "Cash"),
                                  ],
                                ),
                              ),
                            );
                          });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Obx(
                          () => Text(
                            itemController.paymentMethod.value.isNotEmpty
                                ? itemController.paymentMethod.value
                                : "Choose Payment Method",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        Icon(
                          Icons.arrow_drop_up,
                          color: Colors.black,
                        )
                      ],
                    )),
              ),
              SizedBox(
                width: 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18))),
                        backgroundColor: MaterialStatePropertyAll(customBlack)),
                    onPressed: handleTransactionPage,
                    child: Text(
                      "Pay",
                      style: TextStyle(color: Colors.white),
                    )),
              )
            ],
          ),
        ),
      )),
    );
  }
}
