import 'dart:async';

import 'package:examtice_teacher/exam/models/exam_list_response.dart';
import 'package:examtice_teacher/exam/repositories/exam_repository.dart';
import 'package:examtice_teacher/home/models/student_list_response.dart';
import 'package:examtice_teacher/home/repositories/home_repository.dart';
import 'package:examtice_teacher/resources/AppConfigs.dart';
import 'package:examtice_teacher/resources/api_status.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../resources/constants.dart';
import '../../routes/app_routes.dart';

class ExamDetailsViewModel extends GetxController {
  //
  // final ExamRepository _examRepository = ExamRepository();
  //
  // final searchController = TextEditingController().obs;
  // final searchControllerFocus = FocusNode().obs;
  // RxBool loading = false.obs;
  //
  // final rxRequestStatus = ApiStatus.loading.obs;
  // void setRxRequestStatus(ApiStatus status) => rxRequestStatus.value = status;
  //
  // List<ExamDatum> examList = [];
  //
  // var rxList = [].obs;
  // void setRxList(List<ExamDatum> data) => rxList.value = data;
  //
  // @override
  // void onInit() {
  //   // TODO: implement onInit
  //   super.onInit();
  //   callExamListApi();
  // }
  //
  // void callExamListApi() {
  //   _examRepository.getTeacherExamListAPI().then((value) {
  //     setRxRequestStatus(ApiStatus.completed);
  //     var examListResponse = ExamListResponse.fromJson(value);
  //     examListResponse.data?.forEach((data) {
  //       examList.add(data);
  //     });
  //     setRxList(examList);
  //     // update();
  //   }).onError((error, stackTrace) {
  //     setRxRequestStatus(ApiStatus.error);
  //   });
  // }


}
