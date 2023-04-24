import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SearchBar extends StatelessWidget {
  SearchBar({super.key});

  TextEditingController inputUser = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: false,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Search Here',
        // icon: Icon(Icons.search),
      ),
      controller: inputUser,
    );
  }
}
