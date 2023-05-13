import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:gareng_front/constants/accountDummy.dart';
import 'package:gareng_front/pages/AccountEditPage.dart';
import 'package:get/get.dart';

class AccountPage extends StatelessWidget {
  AccountPage({super.key});

  final dataUser = accountDummy;

  final styleLeftText =
      const TextStyle(fontSize: 18, fontWeight: FontWeight.w100);
  final styleRightText =
      const TextStyle(fontSize: 18, fontWeight: FontWeight.w700);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 30,
        ),
        Text(
          "Your Account",
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
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return AccountEditPage();
                              }));
                            },
                            icon: Icon(Icons.edit))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
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
                            child:
                                Text(dataUser["nama"], style: styleRightText)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
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
                            child: Text(dataUser["jenisKlamin"],
                                style: styleRightText)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
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
                            child:
                                Text(dataUser["usia"], style: styleRightText)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
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
                            child: Text(dataUser["alamat"],
                                style: styleRightText)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
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
                            child:
                                Text(dataUser["email"], style: styleRightText)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
