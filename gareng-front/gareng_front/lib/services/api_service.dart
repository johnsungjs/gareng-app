import 'dart:convert';

import 'package:gareng_front/config.dart';
import 'package:gareng_front/models/item_request_model.dart';
import 'package:gareng_front/models/item_response_model.dart';
import 'package:gareng_front/models/login_request_model.dart';
import 'package:gareng_front/models/login_response_model.dart';
import 'package:gareng_front/models/register_request_model.dart';
import 'package:gareng_front/models/register_response_model.dart';
import 'package:gareng_front/models/token_controller.dart';
import 'package:gareng_front/services/shared_service.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class APIService {
  final TokenController tokenController = Get.put(TokenController());
  static var client = http.Client();

  static Future<bool> login(LoginRequestModel model) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(Config.apiURL, Config.loginAPI);

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );

    if (response.statusCode == 200) {
      //set cache to cache manager
      await SharedService.setLoginDetails(loginResponseJson(response.body));
      return true;
    } else {
      return false;
    }
  }

  static Future<RegisterResponseModel> register(
      RegisterRequestModel model) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(Config.apiURL, Config.registerAPI);

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );

    return registerResponseModel(response.body);
  }

  Future<ItemResponseModel> getAllItem(ItemRequestModel model) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': tokenController.token.value
    };

    var url = Uri.http(Config.apiURL, Config.getItem);

    var response = await http.Client().post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );
    return itemResponseModelFromJson(response.body);
  }
}
