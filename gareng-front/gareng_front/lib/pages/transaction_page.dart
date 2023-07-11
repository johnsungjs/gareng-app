import 'package:flutter/material.dart';
import 'package:gareng_front/constants/itemsDummy.dart';

class TransactionPage extends StatelessWidget {
  TransactionPage({super.key});
  final dataDummy = itemsDummy;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                Text("Ships to: "),
                Text("Harapan Indah, Bekasi"),
              ],
            ),
          ),
          // Expanded(
          //     child: SingleChildScrollView(
          //   child: SizedBox(
          //     height: 500,
          //     child: ListView.builder(
          //         itemCount: dataDummy.length,
          //         itemBuilder: (_, index) {
          //           return Padding(
          //             padding: EdgeInsets.symmetric(
          //               horizontal: 24,
          //               vertical: 10,
          //             ),
          //             child: Text("${dataDummy[index]["title"]}"),
          //           );
          //         }),
          //   ),
          // )),
          Container(
            padding: EdgeInsets.all(12),
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(border: Border.all()),
            child: Row(
              children: [
                Text("gambar"),
                Column(
                  children: [
                    Text("Nasi Goreng Kambing"),
                    Text('Quantity: '),
                    Text("Rp30.000"),
                  ],
                ),
              ],
            ),
          ),
          Text('use voucher'),
          Container(
            decoration: BoxDecoration(border: Border.all()),
            child: Text('BELANJA MANTAP'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('subtotal'),
                Text('Rp150000'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('delivery voucher'),
                Text('Rp200000'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('discount voucher'),
                Text('-Rp50.000'),
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
                Text('total'),
                Text('Rp300000'),
              ],
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: TextButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.yellow)),
                onPressed: () {},
                child: Text("Pay")),
          )
        ],
      ),
    ));
  }
}
