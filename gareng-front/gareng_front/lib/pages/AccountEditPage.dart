import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:gareng_front/constants/accountDummy.dart';
import 'package:gareng_front/constants/custom_style.dart';
import 'package:gareng_front/models/cart_controller.dart';
import 'package:gareng_front/models/product_model.dart';
import 'package:gareng_front/models/profile_edit_request.dart';
import 'package:gareng_front/pages/Core.dart';
import 'package:gareng_front/services/api_service.dart';
import 'package:get/get.dart';

import '../models/profile_controller.dart';

class AccountEditPage extends StatefulWidget {
  AccountEditPage({super.key});

  @override
  State<AccountEditPage> createState() => _AccountEditPageState();
}

class _AccountEditPageState extends State<AccountEditPage> {
  final dataUser = accountDummy;
  final ProfileController profileController = Get.put(ProfileController());

  final styleLeftText =
      const TextStyle(fontSize: 18, fontWeight: FontWeight.w100);

  final styleRightText =
      const TextStyle(fontSize: 18, fontWeight: FontWeight.w700);

  var inputUser = {
    "username": TextEditingController(),
    "gender": TextEditingController(),
    "address": TextEditingController(),
    "email": TextEditingController(),
    "age": TextEditingController(),
  };

  String? radioGender;
  @override
  void initState() {
    super.initState();
    inputUser["username"]!.text = profileController.dataUser["username"];
    inputUser["gender"]!.text = profileController.dataUser["gender"];
    inputUser["address"]!.text = profileController.dataUser["address"];
    inputUser["email"]!.text = profileController.dataUser["email"];
    inputUser["age"]!.text = profileController.dataUser["age"];

    radioGender = profileController.dataUser["gender"];
  }

  @override
  void dispose() {
    inputUser["username"]!.dispose();
    inputUser["gender"]!.dispose();
    inputUser["address"]!.dispose();
    inputUser["email"]!.dispose();
    inputUser["age"]!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          const Text(
            "Edit Your Account",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
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
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        children: [
                          Expanded(
                              flex: 1,
                              child: Text("Nama", style: styleLeftText)),
                          Text(
                            ": ",
                            style: styleRightText,
                          ),
                          Expanded(
                              flex: 3,
                              child: TextField(
                                controller: inputUser["username"],
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
                              child: Text("Gender", style: styleLeftText)),
                          Text(
                            ": ",
                            style: styleRightText,
                          ),
                          Expanded(
                            flex: 3,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Radio<String>(
                                  value: 'male',
                                  fillColor: const MaterialStatePropertyAll(
                                      Colors.black),
                                  focusColor: Colors.black,
                                  groupValue: radioGender,
                                  onChanged: (value) {
                                    setState(() {
                                      radioGender = value!;
                                    });
                                  },
                                ),
                                const Text("Male"),
                                const SizedBox(
                                  width: 30,
                                ),
                                Radio<String>(
                                  value: 'female',
                                  fillColor: const MaterialStatePropertyAll(
                                      Colors.black),
                                  focusColor: Colors.black,
                                  groupValue: radioGender,
                                  onChanged: (value) {
                                    setState(() {
                                      radioGender = value!;
                                    });
                                  },
                                ),
                                const Text("Female"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        children: [
                          Expanded(
                              flex: 1,
                              child: Text("Usia", style: styleLeftText)),
                          Text(
                            ": ",
                            style: styleRightText,
                          ),
                          Expanded(
                              flex: 3,
                              child: TextField(
                                controller: inputUser["age"],
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
                                controller: inputUser["address"],
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
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                            style: const ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(customBlack)),
                            onPressed: () {
                              //inputUser["username"]!.text
                              ProfileEditRequest model = ProfileEditRequest(
                                  gender: radioGender!,
                                  age: inputUser["age"]!.text,
                                  address: inputUser["address"]!.text,
                                  email: inputUser["email"]!.text);
                              APIService apiService = APIService();
                              apiService.editProfile(model);
                              Get.back();
                            },
                            child: const Text(
                              "Save",
                              style: TextStyle(color: Colors.white),
                            )),
                        const SizedBox(
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
      )),
    );
  }
}
