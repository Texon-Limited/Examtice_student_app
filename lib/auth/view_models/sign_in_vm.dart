import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:examtice_teacher/auth/models/login_response.dart';
import 'package:examtice_teacher/auth/repositories/login_repository.dart';
import 'package:examtice_teacher/auth/view_models/user_pref_vm.dart';
import 'package:examtice_teacher/resources/constants.dart';
import 'package:examtice_teacher/resources/utis.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/route_manager.dart';

import '../../resources/AppConfigs.dart';
import '../../routes/app_routes.dart';
import '../presentation/pages/landing_screen.dart';

class SignInViewModel extends GetxController {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController().obs;
  final emailControllerFocus = FocusNode().obs;
  final passwordController = TextEditingController().obs;
  final passwordControllerFocus = FocusNode().obs;
  var isPasswordVisible = false.obs;

  final _loginRespository = LoginRepository();
  UserPref userPref = UserPref();

  RxBool loading = false.obs;
  LoginResponse? loginResponse;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void loginAPI() {
    loading.value = true;
    var data = FormData.fromMap({
      'login': emailController.value.text,
      'password': passwordController.value.text,
      // 'learningmanagement_type': '7'
    });
    _loginRespository.loginApi(data).then((value) {
      loading.value = false;

      // debugPrint(value.data);
      if (value['error'] != null) {
        Utils.snackBar('Error: ', value['message']);
      } else {
        loginResponse = LoginResponse.fromJson(value);
        sessionLoginData = loginResponse;
        // Get.offAll(const LandingScreen());
        if (loginResponse?.data != null) {

          userPref
              .saveAccessToken(loginResponse!.data!)
              .then((value)  {
                userPref.saveUser(loginResponse!);
                Get.offAllNamed(AppRoutes.landingScreen);
              });
        }
        Utils.toastMessage(MessageConstant.loginSuccessful);
      }
    }).onError((error, stackTrace) {
      loading.value = false;
      Utils.snackBar('Error: ', error.toString());
    });
  }
}
