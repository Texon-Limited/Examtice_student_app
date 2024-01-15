import 'dart:async';

import 'package:examtice_teacher/home/models/student_list_response.dart';
import 'package:examtice_teacher/home/repositories/home_repository.dart';
import 'package:examtice_teacher/resources/AppConfigs.dart';
import 'package:examtice_teacher/resources/api_status.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../auth/view_models/user_pref_vm.dart';
import '../../resources/constants.dart';
import '../../routes/app_routes.dart';

class ProfileViewModel extends GetxController {
  // HomeRepository _homeRepository = HomeRepository();
  //
  // final rxRequestStatus = ApiStatus.loading.obs;
  // List<Student> studentList = [];
  //
  // void setRxRequestStatus(ApiStatus status) => rxRequestStatus.value = status;

  UserPref userPref = UserPref();

  var isAlertOn = true.obs;


  final formKey = GlobalKey<FormState>();

  var firstNameController = TextEditingController().obs;
  final firstNameControllerFocus = FocusNode().obs;

  var lastNameController = TextEditingController().obs;
  final lastNameControllerFocus = FocusNode().obs;

  var phNoController = TextEditingController().obs;
  final phNoControllerFocus = FocusNode().obs;

  final passwordController = TextEditingController().obs;
  final passwordControllerFocus = FocusNode().obs;

  var isPasswordVisible = false.obs;
  final  confirmPasswordController = TextEditingController().obs;
  var isConfirmPasswordVisible = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // studentListApi();
    firstNameController.value.text = sessionLoginData?.data?.user?.firstName.toString() ?? '';
    lastNameController.value.text = sessionLoginData?.data?.user?.lastName.toString() ?? '';
    phNoController.value.text = sessionLoginData?.data?.user?.phoneno.toString() ?? '';

  }

  void changeAlert(){
    isAlertOn.value = !isAlertOn.value;
  }


  void changeTheme(){
    currentTheme.switchTheme();
    update();

  }

  void logoutUser() {
    userPref.removeAccessToken();
    Get.offAllNamed(AppRoutes.onBoardingScreen);

  }

  void callUpdateProfileApi() {

  }

  // void studentListApi() {
  //   _homeRepository.getStudentListAPI().then((value) {
  //     setRxRequestStatus(ApiStatus.completed);
  //     var studentListResponse = StudentListResponse.fromJson(value);
  //     studentListResponse.data?.forEach((data) {
  //       studentList.add(data);
  //     });
  //   }).onError((error, stackTrace) {
  //     setRxRequestStatus(ApiStatus.error);
  //   });
  // }
}
