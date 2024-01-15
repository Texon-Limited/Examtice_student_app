import 'dart:convert';

import 'package:examtice_teacher/auth/models/login_response.dart';
import 'package:examtice_teacher/resources/constants.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPref {
  Future<bool> saveAccessToken(LoginData loginData) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString(
        KeyConstant.accessToken, loginData.token?.accessToken.toString() ?? '');

    return true;
  }

  Future<String?> getAccessToken() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? token = sp.getString(KeyConstant.accessToken);

    return token;
  }

  Future<bool> removeAccessToken() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.clear();

    return true;
  }

  Future<bool> saveUser(LoginResponse loginData) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString(KeyConstant.savedUser, jsonEncode(loginData));

    return true;
  }

  Future<dynamic> getUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    var myData = sp.getString(KeyConstant.savedUser);
    var data = jsonDecode(myData!);
    return data;
  }
}
