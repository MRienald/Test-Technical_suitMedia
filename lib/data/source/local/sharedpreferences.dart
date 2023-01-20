import 'dart:convert';

import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:suitemedia_flutter_test/data/source/remote/userInformation/user_information.dart';

class Prefs {
  static late SharedPreferences _prefs;

  // call this method from iniState() function of mainApp().
  static Future<SharedPreferences> init() async {
  _prefs = await SharedPreferences.getInstance();

    return _prefs;
  }

  //DataUser
  static Future<void> setUsername(String username) async => await _prefs.setString("username", username);
  static Future<void> setEmail(String email) async => await _prefs.setString("email", email);
  static Future<void> setAvatar(String avatar) async => await _prefs.setString("avatar", avatar);
  static String? getUsername() => _prefs.getString("username");
  static String? getEmail() => _prefs.getString("email");
  static String? getAvatar() => _prefs.getString("avatar");

  //deletes..
  static Future<bool> remove(String key) async => await _prefs.remove(key);

  static Future<bool> clear() async => await _prefs.clear();
}
