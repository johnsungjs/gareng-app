import 'package:flutter/material.dart';

import '../constants/custom_style.dart';

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
