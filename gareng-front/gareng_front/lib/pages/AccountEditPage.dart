import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:gareng_front/constants/accountDummy.dart';
import 'package:gareng_front/models/cart_controller.dart';
import 'package:gareng_front/models/product_model.dart';
import 'package:gareng_front/pages/Core.dart';
import 'package:get/get.dart';

class AccountEditPage extends StatefulWidget {
  AccountEditPage({super.key});

  @override
  State<AccountEditPage> createState() => _AccountEditPageState();
}

class _AccountEditPageState extends State<AccountEditPage> {
  final dataUser = accountDummy;

  final styleLeftText =
      const TextStyle(fontSize: 18, fontWeight: FontWeight.w100);

  final styleRightText =
      const TextStyle(fontSize: 18, fontWeight: FontWeight.w700);

  // final namaController = TextEditingController();
  // final jenisKlaminController = TextEditingController();
  // final usiaController = TextEditingController();
  // final alamatController = TextEditingController();
  // final emailController = TextEditingController();

  var inputUser = {
    "nama": TextEditingController(),
    "jenisKlamin": TextEditingController(),
    "usia": TextEditingController(),
    "alamat": TextEditingController(),
    "email": TextEditingController(),
  };

  @override
  void initState() {
    super.initState();
    // namaController.addListener(_printLatestValue);
    // namaController.text = accountDummy["nama"];
    inputUser["nama"]!.text = accountDummy["nama"];
    inputUser["jenisKlamin"]!.text = accountDummy["jenisKlamin"];
    inputUser["usia"]!.text = accountDummy["usia"];
    inputUser["alamat"]!.text = accountDummy["alamat"];
    inputUser["email"]!.text = accountDummy["email"];
  }

  @override
  void dispose() {
    // namaController.dispose();
    inputUser["nama"]!.dispose();
    inputUser["jenisKlamin"]!.dispose();
    inputUser["usia"]!.dispose();
    inputUser["alamat"]!.dispose();
    inputUser["email"]!.dispose();
    super.dispose();
  }

  // void _printLatestValue() {
  //   print("isi textfield: ${namaController.text}");
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        SizedBox(
          height: 30,
        ),
        Text(
          "Edit Your Account",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
        ),
        SizedBox(
          height: 20,
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(dataUser["image"]),
                    radius: 100,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      children: [
                        Expanded(
                            flex: 1, child: Text("Nama", style: styleLeftText)),
                        Text(
                          ": ",
                          style: styleRightText,
                        ),
                        Expanded(
                            flex: 3,
                            child: TextField(
                              controller: inputUser["nama"],
                              style: styleRightText,
                            )),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: Text("Jenis Klamin", style: styleLeftText)),
                        Text(
                          ": ",
                          style: styleRightText,
                        ),
                        Expanded(
                            flex: 3,
                            child: TextField(
                              controller: inputUser["jenisKlamin"],
                              style: styleRightText,
                            )),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      children: [
                        Expanded(
                            flex: 1, child: Text("Usia", style: styleLeftText)),
                        Text(
                          ": ",
                          style: styleRightText,
                        ),
                        Expanded(
                            flex: 3,
                            child: TextField(
                              controller: inputUser["usia"],
                              style: styleRightText,
                            )),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: Text("Alamat", style: styleLeftText)),
                        Text(
                          ": ",
                          style: styleRightText,
                        ),
                        Expanded(
                            flex: 3,
                            child: TextField(
                              controller: inputUser["alamat"],
                              style: styleRightText,
                            )),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: Text("Email", style: styleLeftText)),
                        Text(
                          ": ",
                          style: styleRightText,
                        ),
                        Expanded(
                            flex: 3,
                            child: TextField(
                              controller: inputUser["email"],
                              style: styleRightText,
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            "Save",
                            style: styleRightText,
                          )),
                      SizedBox(
                        width: 20,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Cancel",
                            style: styleLeftText,
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
