import 'dart:convert';

import 'package:gareng_front/config.dart';
import 'package:gareng_front/models/login_request_model.dart';
import 'package:gareng_front/models/login_response_model.dart';
import 'package:gareng_front/models/register_request_model.dart';
import 'package:gareng_front/models/register_response_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class TokenController extends GetxController {
  RxString _token = "".obs;
  RxString _refreshToken = "".obs;

  RxMap loginDetails = {}.obs;

  setLoginDetails(LoginResponseModel data) {
    loginDetails.value = data.toJson();
    _token.value = data.data.accessToken;
    _refreshToken.value = data.data.refreshToken;
  }

  get token => _token;
  get refreshToken => _refreshToken;

  bool isLoggedIn() {
    bool result = false;
    if (_token.value.isEmpty) {
      result = false;
    } else {
      result = true;
    }
    return result;
  }

  var client = http.Client();

  Future login(LoginRequestModel model) async {
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
      //save login details to state management
      setLoginDetails(loginResponseJson(response.body));
      return true;
    } else {
      return false;
    }
  }

  Future<RegisterResponseModel> register(RegisterRequestModel model) async {
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
}
