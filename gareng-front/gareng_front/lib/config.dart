class Config {
  static const String appName = 'Gareng App';
  // static const String apiURL = 'localhost:8080';
  static const String apiURL = '172.29.235.67:8080';
  static const String loginAPI = '/authentication/login';
  static const String logoutAPI = '/authentication/logout';
  static const String registerAPI = '/authentication/register';
  static const String getItem = '/item/get';
  static const String getWishlist = '/wishlist/get';
  static const String getProfile = '/profile/get';
  static const String refreshToken = '/authentication/refreshtoken';
  static const String editProfile = '/profile/update';
  static const String addTransaction = '/transaction/add';
  // static const String userProfileAPI = 'localhost:8080';
}
