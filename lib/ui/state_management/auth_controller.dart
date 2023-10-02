import 'dart:convert';

import 'package:demo/data/models/profile_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  static String? _token;
  static ProfileData? _profileData;

  static String? get token => _token;
  static ProfileData? get profileData => _profileData;

  Future<void> saveToken(String userToken) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    _token = userToken;
    await preferences.setString('crafty_token', userToken);
  }

  Future<void> saveProfileData(ProfileData profileData) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    _profileData = profileData;
    await preferences.setString(
        'user_profile', profileData.toJson().toString());
  }

  Future<void> getProfileData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    _profileData = ProfileData.fromJson(
        jsonDecode(preferences.getString('user_profile') ?? '{}'));
  }

  Future<void> getToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    _token = preferences.getString('crafty_token');
  }

  Future<void> clearUserData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }

  Future<bool> isLoggedIn() async {
    await getToken();
    await getProfileData();
    // used for debugging
    // log(token.toString());
    return _token != null;
    // if (token == null) {
    //   return false;
    // } else {
    //   return true;
    // }
  }
}
