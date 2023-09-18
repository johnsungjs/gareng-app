import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gareng_front/models/item_controller.dart';
import 'package:get/get.dart';

class SuccessPayPage extends StatelessWidget {
  SuccessPayPage({super.key});

  final ItemController itemController = Get.put(ItemController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment Success"),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Image.asset('assets/images/success.gif'),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                Text(
                  'Pesanan Anda Sedang Diproses',
                  style: TextStyle(fontSize: 24),
                  textAlign: TextAlign.center,
                ),
                Text('pesanan anda akan diteruskan ke penjual'),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Transaction Number 123456',
                  style: TextStyle(fontSize: 14),
                ),
                Text('data'),
                Text('Metode Pembayaran: Cash'),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        Get.offAllNamed("/home");
                      },
                      child: Text("Okay")),
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
