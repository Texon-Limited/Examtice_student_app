import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/models/student_list_response.dart';
import '../../resources/api_status.dart';

class SelectExamViewModel extends GetxController {


  var currentStep =0.obs;
  var activeForm = 0.obs;
  var searchController = TextEditingController().obs;

  final rxRequestStatus = ApiStatus.loading.obs;

  List<Student> selectedStudentList = [];

  void setRxRequestStatus(ApiStatus status) => rxRequestStatus.value = status;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}