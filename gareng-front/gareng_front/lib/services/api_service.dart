import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gareng_front/config.dart';
import 'package:gareng_front/models/item_request_model.dart';
import 'package:gareng_front/models/item_response_model.dart';
import 'package:gareng_front/models/login_request_model.dart';
import 'package:gareng_front/models/login_response_model.dart';
import 'package:gareng_front/models/profile_controller.dart';
import 'package:gareng_front/models/profile_edit_request.dart';
import 'package:gareng_front/models/profile_response_model.dart';
import 'package:gareng_front/models/refresh_token_response_model.dart';
import 'package:gareng_front/models/register_request_model.dart';
import 'package:gareng_front/models/register_response_model.dart';
import 'package:gareng_front/services/shared_preference_service.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/get_wishlist_response.dart';

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

    debugPrint('response login: ${response.body}');

    if (response.statusCode == 200) {
      //save data with share preference
      await SharedPreferenceService.setLoginDetails(
          loginResponseJson(response.body));
      return true;
    } else {
      return false;
    }
  }

  void logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? refreshToken = prefs.getString('refreshToken');

    Map<String, String> requestHeaders = {'Authorization': refreshToken!};

    var url = Uri.http(Config.apiURL, Config.logoutAPI);

    var response = await client.get(
      url,
      headers: requestHeaders,
    );
    debugPrint('response logout: ${response.body}');

    if (response.statusCode == 200) {
      Get.toNamed('/login');
    } else if (response.statusCode == 500) {
      debugPrint('masuk statuscode 500, callrefreshToken()');
      callRefreshToken();
      debugPrint('recalling logout()');
      logout();
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
    debugPrint('response register: ${response.body}');

    return registerResponseModel(response.body);
  }

  Future<ItemResponseModel> getAllItem(ItemRequestModel model) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // String? token = prefs.getString('token');
    String? refreshToken = prefs.getString('refreshToken');
    debugPrint('refreshToken: $refreshToken');

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

    debugPrint('response getAllItem: ${response.body}');

    if (response.statusCode == 500) {
      debugPrint('token expired with statuscode: ${response.statusCode}');

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
      debugPrint('hasil result status tokenrefresh: ${response.body}');
      getAllItem(model);
    }
    return itemResponseModelFromJson(response.body);
  }

  void getProfile() async {
    final ProfileController profilecontroller = Get.put(ProfileController());
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    // endpoint ini gabisa pake refreshToken
    // String? refreshToken = prefs.getString('refreshToken');

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': token!,
    };

    var url = Uri.http(Config.apiURL, Config.getProfile);

    var response = await http.Client().get(
      url,
      headers: requestHeaders,
    );

    debugPrint('response getProfile: ${response.body}');

    if (response.statusCode == 200) {
      var value = profileResponseModelFromJson(response.body);
      profilecontroller.setDataUser(value.data.toJson());
    } else if (response.statusCode == 500) {
      debugPrint('masuk if statuscode 500');
      // callRefreshToken();
      // getProfile();
      Get.toNamed('/login');
    } else {
      debugPrint('status code getprofile bkn 200 ataupun 500');
    }
  }

  void callRefreshToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // String? token = prefs.getString('token');
    String? refreshToken = prefs.getString('refreshToken');

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': refreshToken!,
    };

    var url = Uri.http(Config.apiURL, Config.refreshToken);

    //siapin body buat request
    final ProfileController profileController = Get.put(ProfileController());

    String username = profileController.dataUser["username"];

    var response = await http.Client().post(
      url,
      headers: requestHeaders,
      // body: jsonEncode(model.toJson()),
      body: jsonEncode({"username": username}),
    );

    debugPrint('refreshtoken responsebody: ${response.body}');

    var resNewToken = refreshTokenResponseModelFromJson(response.body);

    debugPrint('response new token: ${resNewToken.data.accessToken}');
    await prefs.setString('token', resNewToken.data.accessToken);
  }

  void editProfile(ProfileEditRequest model) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': token!,
    };

    var url = Uri.http(Config.apiURL, Config.editProfile);

    var response = await http.Client().put(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );

    debugPrint('response editProfile: ${response.body}');

    if (response.statusCode == 200) {
      //change local storage, sumber data dari get profile
      getProfile();
    } else if (response.statusCode == 500) {
      //khusus profile kalau 500 login ulang
      callRefreshToken();
      editProfile(model);
    }
  }

  Future<GetWishlistResponse> getAllWishlist(Map reqBody) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    debugPrint('refreshToken: $token');

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': token!
    };

    var url = Uri.http(Config.apiURL, Config.getWishlist);

    var response = await http.Client().post(
      url,
      headers: requestHeaders,
      body: jsonEncode(reqBody),
    );

    debugPrint('response getAllItem: ${response.body}');

    if (response.statusCode == 200) {
      return getWishlistResponseFromJson(response.body);
    } else if (response.statusCode == 500) {
      callRefreshToken();
      getAllWishlist(reqBody);
      return getWishlistResponseFromJson({
        "data": {"getItemPagination": null, "itemData": null},
        "message": "Invalid Token",
        "status": 500
      }.toString());
    } else {
      debugPrint('masuk else');
      return getWishlistResponseFromJson({
        "data": {"getItemPagination": null, "itemData": null},
        "message": "Invalid Token",
        "status": 500
      }.toString());
    }
  }

  static Future<Map> handleTransaction(Map reqBody) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': token!
    };

    debugPrint('minta token bro: $token');

    var url = Uri.http(Config.apiURL, Config.addTransaction);

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(reqBody),
    );

    debugPrint('response login: ${response.body}');

    //nongolin snackbar jika response status 200

    return jsonDecode(response.body);
  }
}
