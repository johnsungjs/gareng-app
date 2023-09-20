import 'package:gareng_front/models/login_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceService {
  // static Future<bool> isLoggedIn() async {
  //   //watchout this "login_details"
  //   var isKeyExist =
  //       await APICacheManager().isAPICacheKeyExist("login_details");

  //   return isKeyExist;
  // }

  // static Future<LoginResponseModel?> loginDetails() async {
  //   //watchout this "login_details"
  //   var isKeyExist =
  //       await APICacheManager().isAPICacheKeyExist("login_details");

  //   if (isKeyExist) {
  //     var cacheData = await APICacheManager().getCacheData("login_details");

  //     return loginResponseJson(cacheData.syncData);
  //   }
  // }

  static Future<void> setLoginDetails(LoginResponseModel model) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', model.data.accessToken);
    prefs.setString('refreshToken', model.data.refreshToken);
  }

  // static Future<void> logout(BuildContext context) async {
  //   await APICacheManager().deleteCache("login_details");
  //   Get.toNamed('/login');
  // }
}
