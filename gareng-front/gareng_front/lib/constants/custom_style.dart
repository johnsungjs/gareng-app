import 'package:flutter/material.dart';

const whiteText = TextStyle(color: Colors.white, fontSize: 16);
const customBlack = Color.fromARGB(255, 43, 46, 59);

final customShadow = BoxDecoration(
  borderRadius: BorderRadius.circular(16),
  boxShadow: [
    BoxShadow(color: Colors.grey.shade300, spreadRadius: 2, blurRadius: 3)
  ],
  color: const Color.fromARGB(255, 255, 255, 255),
);
final customShadowNoRadius = BoxDecoration(
  borderRadius: BorderRadius.circular(0),
  boxShadow: [
    BoxShadow(color: Colors.grey.shade300, spreadRadius: 2, blurRadius: 3)
  ],
  color: const Color.fromARGB(255, 255, 255, 255),
);
