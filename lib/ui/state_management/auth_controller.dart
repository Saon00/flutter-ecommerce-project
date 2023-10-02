import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  String? token;

  Future<void> saveToken(String userToken) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    token = userToken;
    await preferences.setString('crafty_token', userToken);
  }

  Future<void> getToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    token = preferences.getString('crafty_token');
  }

  Future<void> clearUserData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }

  Future<bool> isLoggedIn() async {
    await getToken();
    // used for debugging
    // log(token.toString());
    return token != null;
    // if (token == null) {
    //   return false;
    // } else {
    //   return true;
    // }
  }
}
