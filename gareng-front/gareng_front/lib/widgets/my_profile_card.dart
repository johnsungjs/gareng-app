import 'package:flutter/material.dart';
import 'package:gareng_front/models/profile_controller.dart';
import 'package:get/get.dart';

class MyProfileCard extends StatelessWidget {
  MyProfileCard({super.key});

  final ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://avatars.githubusercontent.com/u/110521342?v=4'),
                radius: 20,
              ),
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  profileController.dataUser["username"],
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Text(
                  profileController.dataUser["address"],
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  profileController.dataUser["email"],
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            )),
            IconButton(
                onPressed: () {
                  Get.toNamed("/account-edit");
                },
                icon: const Icon(Icons.edit))
          ],
        ));
  }
}
