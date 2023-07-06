import 'dart:convert';

import 'package:gareng_front/config.dart';
import 'package:gareng_front/models/item_request_model.dart';
import 'package:gareng_front/models/item_response_model.dart';
import 'package:gareng_front/models/login_request_model.dart';
import 'package:gareng_front/models/login_response_model.dart';
import 'package:gareng_front/models/profile_response_model.dart';
import 'package:gareng_front/models/refresh_token_response_model.dart';
import 'package:gareng_front/models/register_request_model.dart';
import 'package:gareng_front/models/register_response_model.dart';
import 'package:gareng_front/models/token_controller.dart';
import 'package:gareng_front/services/shared_preference_service.dart';
import 'package:gareng_front/services/shared_service.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class APIService {
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
      //save data with share preference
      await SharedPreferenceService.setLoginDetails(
          loginResponseJson(response.body));
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
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': token!
    };

    var url = Uri.http(Config.apiURL, Config.getItem);

    var response = await http.Client()
        .post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    )
        .catchError((err) {
      print('coba catch error ${err}');
    });

    if (response.statusCode == 500) {
      print('token expired with statuscode: ${response.statusCode}');
      String? refreshToken = prefs.getString('refreshToken');

      Map<String, String> requestHeaders = {
        'Content-Type': 'application/json',
        'Authorization': refreshToken!
      };

      var url = Uri.http(Config.apiURL, Config.getItem);

      response = await http.Client().post(
        url,
        headers: requestHeaders,
        body: jsonEncode(model.toJson()),
      );
      print('hasil result status tokenrefresh: ${response.statusCode}');
    }
    return itemResponseModelFromJson(response.body);
  }

  Future<ProfileResponseModel> getProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': token!,
    };

    var url = Uri.http(Config.apiURL, Config.getProfile);

    var response = await http.Client().get(
      url,
      headers: requestHeaders,
    );

    return profileResponseModelFromJson(response.body);
  }

  Future<RefreshTokenResponseModel> refreshToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': token!,
    };

    var url = Uri.http(Config.apiURL, Config.getProfile);

    var response = await http.Client().get(
      url,
      headers: requestHeaders,
    );

    return refreshTokenResponseModelFromJson(response.body);
  }
}
