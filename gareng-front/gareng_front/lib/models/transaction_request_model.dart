import 'package:gareng_front/models/item_controller.dart';
import 'package:get/get.dart';

class TransactionRequestModel {
  final ItemController itemController = Get.put(ItemController());
  final Map reqBody = {
    "transactionDate": DateTime.now().toString(),
    "payment": 100000,
    "paymentMethod": "cash",
    "items": [
      {
        "title": "Es Teh Manis",
        "price": "2000",
        "imageUrl": "http://placekitten.com/300/300",
        "uuid": "bf654113-407c-4dbd-b888-487fea2ba6a5",
        "amount": 2
      },
    ]
  };
}
