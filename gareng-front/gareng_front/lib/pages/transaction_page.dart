import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gareng_front/constants/custom_style.dart';
import 'package:gareng_front/constants/itemsDummy.dart';

class TransactionPage extends StatelessWidget {
  TransactionPage({super.key});
  final dataDummy = itemsDummy;

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
              CheckoutCart(),
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Subtotal'),
                    Text('Rp150000'),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Delivery fee'),
                    Text('Rp200000'),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Discount Voucher'),
                    Text(
                      '-Rp50.000',
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
                    Text('Rp300000',
                        style: TextStyle(
                            color: customBlack, fontWeight: FontWeight.bold)),
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
                                    PaymentMethods(),
                                    PaymentMethods(),
                                    PaymentMethods(),
                                    PaymentMethods(),
                                    PaymentMethods(),
                                    PaymentMethods(),
                                    PaymentMethods(),
                                    PaymentMethods(),
                                    PaymentMethods(),
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
                        Text(
                          "Choose Payment Method",
                          style: TextStyle(color: Colors.black),
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
                    onPressed: () {},
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

class CheckoutCart extends StatelessWidget {
  const CheckoutCart({super.key});

  @override
  Widget build(BuildContext context) {
    final dataDummy = itemsDummy;
    return Container(
      padding: EdgeInsets.all(12),
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  dataDummy[0]["images"],
                  width: 100.0,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Nasi Goreng Kambing"),
                    Text(
                      "Rp30.000",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Order Quantity:',
                style:
                    TextStyle(color: customBlack, fontWeight: FontWeight.w400),
              ),
              Row(
                children: [
                  Icon(Icons.remove_circle_outline),
                  SizedBox(width: 20, child: Center(child: Text('10'))),
                  Icon(Icons.add_circle),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

class PaymentMethods extends StatelessWidget {
  const PaymentMethods({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: TextButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text(
          "Cash",
          style: TextStyle(color: customBlack),
        ),
        style: ButtonStyle(
          side: MaterialStatePropertyAll(BorderSide(
              color: customBlack, width: 1.0, style: BorderStyle.solid)),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18))),
        ),
      ),
    );
  }
}
