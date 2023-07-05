import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CustomHttp extends http.BaseClient {
  SharedPreferences sharedpref;
  CustomHttp({required this.sharedpref});

  //use memory cache to avoid local storage access in each call
  String _inMemoryToken = '';
  String get userAccessToken {
    //use in memory token if available
    if (_inMemoryToken != '') return _inMemoryToken;

    //if memory empty, load from localstorage
    _inMemoryToken = _loadTokenFromSharedPreference();
    return _inMemoryToken;
  }

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    //intercept each call and add the Authorization header if token is available
    if (userAccessToken.isNotEmpty) {
      request.headers.putIfAbsent('Authorization', () => userAccessToken);
    }

    return request.send();
  }

  String _loadTokenFromSharedPreference() {
    String token = '';
    final tokenFromSharedPref = sharedpref.getString('token');

    if (tokenFromSharedPref != null) {
      token = tokenFromSharedPref;
    }

    return token;
  }

  // Don't forget to reset the cache when logging out the user
  void reset() {
    _inMemoryToken = '';
  }
}
