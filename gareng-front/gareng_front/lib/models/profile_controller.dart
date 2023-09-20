import 'package:get/get.dart';

class ProfileController extends GetxController {
  var dataUser = {}.obs;

  void setDataUser(dataApi) {
    dataUser.value = dataApi;
  }
}
