import 'dart:async';

import 'package:examtice_teacher/exam/models/exam_list_response.dart';
import 'package:examtice_teacher/exam/view_models/exam_screen_vm.dart';
import 'package:examtice_teacher/home/models/student_list_response.dart';
import 'package:examtice_teacher/home/repositories/home_repository.dart';
import 'package:examtice_teacher/resources/AppConfigs.dart';
import 'package:examtice_teacher/resources/api_status.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../resources/colors.dart';
import '../../resources/constants.dart';
import '../../routes/app_routes.dart';

class HomeViewModel extends GetxController {

  var scaffoldKey = GlobalKey<ScaffoldState>();
  final HomeRepository _homeRepository = HomeRepository();

  final rxRequestStatus = ApiStatus.loading.obs;
  List<Student> eshopItemList = [];

  void setRxRequestStatus(ApiStatus status) => rxRequestStatus.value = status;


  List<Color> gradientColors = [
    ColorManager.contentColorCyan,
    ColorManager.contentColorBlue,
  ];

  bool showAvg = false;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    studentListApi();

  }

  void openDrawer() {
    scaffoldKey.currentState?.openDrawer();
  }

  void closeDrawer() {
    scaffoldKey.currentState?.openEndDrawer();
  }

  void studentListApi() {
    _homeRepository.getStudentListAPI().then((value) {
      setRxRequestStatus(ApiStatus.completed);
      var studentListResponse = StudentListResponse.fromJson(value);
      studentListResponse.data?.forEach((data) {
        eshopItemList.add(data);
      });
    }).onError((error, stackTrace) {
      setRxRequestStatus(ApiStatus.error);
    });
  }
}
