import 'package:flutter/material.dart';
import 'package:gareng_front/constants/custom_style.dart';
import 'package:gareng_front/models/item_controller.dart';
import 'package:get/get.dart';

class SuccessPayPage extends StatelessWidget {
  SuccessPayPage({super.key});

  final ItemController itemController = Get.put(ItemController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Center(
          child: Text(
            "Payment Success",
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Image.asset('assets/images/success.gif'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                const Text(
                  'Pesanan Anda Sedang Diproses',
                  style: TextStyle(fontSize: 24),
                  textAlign: TextAlign.center,
                ),
                const Text('pesanan anda akan diteruskan ke penjual'),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Transaction Number 123456',
                  style: TextStyle(fontSize: 14),
                ),
                const Text('data'),
                const Text('Metode Pembayaran: Cash'),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18))),
                          backgroundColor:
                              const MaterialStatePropertyAll(customBlack)),
                      onPressed: () {
                        Get.offAllNamed("/home");
                      },
                      child: const Text("Okay",
                          style: TextStyle(color: Colors.white))),
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
