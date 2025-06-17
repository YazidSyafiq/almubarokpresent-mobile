import 'package:shared_preferences/shared_preferences.dart';

class Token {
  static String keyToken = 'token';

  static void saveToken({required String token}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(keyToken, token);
  }

  static Future<String?> getToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString(keyToken);
    return token;
  }

  static void removeToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove(keyToken);
  }
}
