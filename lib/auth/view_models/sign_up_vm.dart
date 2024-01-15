import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:examtice_teacher/auth/models/login_response.dart';
import 'package:examtice_teacher/auth/models/sign_up_response.dart';
import 'package:examtice_teacher/auth/repositories/login_repository.dart';
import 'package:examtice_teacher/auth/repositories/sign_up_repository.dart';
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

class SignUpViewModel extends GetxController {
  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController().obs;
  final emailControllerFocus = FocusNode().obs;


  final  fnameController = TextEditingController().obs;
  final  lnameController = TextEditingController().obs;

  final  phoneController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final passwordControllerFocus = FocusNode().obs;

  final referCodeController = TextEditingController().obs;

  var isPasswordVisible = false.obs;
  final  confirmPasswordController = TextEditingController().obs;
  var isConfirmPasswordVisible = false.obs;

  var agreedToTerms = true.obs;


  final  signUpRespository = SignUpRepository();
  UserPref userPref = UserPref();

  RxBool loading = false.obs;
  SignUpResponse? signUpResponse;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void signUpAPI() {
    loading.value = true;
    var data = FormData.fromMap({
      'firstName':  fnameController.value.text,
      'lastName': lnameController.value.text,
      'email': emailController.value.text,
      'password': passwordController.value.text,
      'phoneno': phoneController.value.text,
      'referCode': referCodeController.value.text,
    });
     signUpRespository.signUpApi(data).then((value) {
      loading.value = false;

      // debugPrint(value.data);
      if (value['error'] != null) {
        Utils.snackBar('Error: ', value['message']);
      } else {
        signUpResponse = SignUpResponse.fromJson(value);
        // Get.offAll(const LandingScreen());
        if (signUpResponse?.data != null) {
          Utils.snackBar(signUpResponse!.status.toString(), signUpResponse!.message.toString());
        }
        Utils.toastMessage(MessageConstant.loginSuccessful);
      }
    }).onError((error, stackTrace) {
      loading.value = false;
      Utils.snackBar('Error: ', error.toString());
    });
  }
}
