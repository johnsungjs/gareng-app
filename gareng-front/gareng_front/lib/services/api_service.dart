import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gareng_front/config.dart';
import 'package:gareng_front/models/item_request_model.dart';
import 'package:gareng_front/models/item_response_model.dart';
import 'package:gareng_front/models/login_request_model.dart';
import 'package:gareng_front/models/login_response_model.dart';
import 'package:gareng_front/models/profile_controller.dart';
import 'package:gareng_front/models/profile_response_model.dart';
import 'package:gareng_front/models/refresh_token_request_model.dart';
import 'package:gareng_front/models/refresh_token_response_model.dart';
import 'package:gareng_front/models/register_request_model.dart';
import 'package:gareng_front/models/register_response_model.dart';
import 'package:gareng_front/services/shared_preference_service.dart';
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
    // var url = Uri.parse(Config.apiURL + Config.loginAPI);

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
    // String? token = prefs.getString('token');
    String? refreshToken = prefs.getString('refreshToken');

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': refreshToken!
    };

    var url = Uri.http(Config.apiURL, Config.getItem);

    var response = await http.Client().post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );

    if (response.statusCode == 500) {
      print('token expired with statuscode: ${response.statusCode}');

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

  void getProfile() async {
    final ProfileController profilecontroller = Get.put(ProfileController());
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    // endpoint ini gabisa pake refreshToken
    String? refreshToken = prefs.getString('refreshToken');

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': token!,
    };

    var url = Uri.http(Config.apiURL, Config.getProfile);

    var response = await http.Client().get(
      url,
      headers: requestHeaders,
    );

    if (response.statusCode == 500) {
      debugPrint('masuk if statuscode 500');
      callRefreshToken();
      response = await http.Client().get(
        url,
        headers: requestHeaders,
      );
    }

    // return profileResponseModelFromJson(response.body);
    var value = profileResponseModelFromJson(response.body);
    profilecontroller.setDataUser(value.data.toJson());
  }

  void callRefreshToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // String? token = prefs.getString('token');
    String? refreshToken = prefs.getString('refreshToken');

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': refreshToken!,
    };

    var url = Uri.http(Config.apiURL, Config.getProfile);

    //siapin body buat request
    final ProfileController profilecontroller = Get.put(ProfileController());
    RefreshTokenRequestModel model = RefreshTokenRequestModel(
      // username: profilecontroller.dataUser["username"],
      username: "john",
    );

    var response = await http.Client().post(
      url,
      headers: requestHeaders,
      // body: jsonEncode(model.toJson()),
      body: {"username": "john"},
    );

    debugPrint('responsebody: ${response.body}');

    var resNewToken = refreshTokenResponseModelFromJson(response.body);

    debugPrint('response new token: ${resNewToken.data.accessToken}');
    await prefs.setString('token', resNewToken.data.accessToken);
  }
}
