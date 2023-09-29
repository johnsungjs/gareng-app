import 'package:flutter/material.dart';
import 'package:gareng_front/constants/custom_style.dart';

class AccountButton extends StatelessWidget {
  final String buttonText;
  final Icon icon;
  const AccountButton(
      {super.key, required this.buttonText, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextButton(
          style: TextButton.styleFrom(foregroundColor: customBlack),
          onPressed: () {},
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: icon,
              ),
              Text(
                buttonText,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const Spacer(),
              const Icon(Icons.arrow_right)
            ],
          )),
    );
  }
}
