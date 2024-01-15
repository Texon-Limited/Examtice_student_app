import 'dart:async';

import 'package:examtice_teacher/exam/models/exam_details_response.dart';
import 'package:examtice_teacher/exam/models/exam_list_response.dart';
import 'package:examtice_teacher/exam/repositories/exam_repository.dart';
import 'package:examtice_teacher/home/models/student_list_response.dart';
import 'package:examtice_teacher/home/repositories/home_repository.dart';
import 'package:examtice_teacher/resources/AppConfigs.dart';
import 'package:examtice_teacher/resources/api_status.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../resources/constants.dart';
import '../../routes/app_routes.dart';

class ExamDetailsViewModel extends GetxController
    with GetSingleTickerProviderStateMixin {
  //
  final ExamRepository _examRepository = ExamRepository();
  //
  // final searchController = TextEditingController().obs;
  // final searchControllerFocus = FocusNode().obs;
  // RxBool loading = false.obs;
  //
  final rxRequestStatus = ApiStatus.loading.obs;

  ResultLmsExam? examDetails;

  void setRxRequestStatus(ApiStatus status) => rxRequestStatus.value = status;

  late TabController tabController;
  var tabIndex = 0.obs;
  var correctlyAnswered = 0.obs;
  String dateString = ' ';
  var percentage = 10.0.obs;
  var totalQues = 0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    tabController = TabController(vsync: this, length: 2);
    tabController.addListener(() {
      if (tabController.indexIsChanging) {
        // Add your logic for when the tab index is changing
      }
      // Tab Changed tapping on new tab
      else if (tabController.index != tabController.previousIndex) {
        tabIndex.value = tabController.index;
      }
      // Tab Changed swiping to a new tab

      // if (tabIndex.value == 1) {
      //   callExamStudentDetailsApi();
      // } else {
      //   callQuestionAnswerAPI();
      // }
    });

    callExamDetailsApi();
  }

  void callExamDetailsApi() {
    _examRepository
        .getExamDetailsApi(selectedExamGlobalData.value.examId.toString(),
            sessionLoginData?.data?.user?.id.toString() ?? '')
        .then((value) {
      setRxRequestStatus(ApiStatus.completed);
      var examDetailsResponse = LmsExamDetailsResponse.fromJson(value);
      if (examDetailsResponse.result != null) {
        examDetails = examDetailsResponse.result!;
      }
      refresh();
      update();

      calcaulateData();

      update();
    }).onError((error, stackTrace) {
      setRxRequestStatus(ApiStatus.error);
    });
  }

  void calcaulateData() {
    if (examDetails != null) {
      totalQues.value = examDetails!.totalQuestions!;


      for (var element in examDetails!.questionsData!) {
        if (element.isCorrect == true) {
          correctlyAnswered.value = correctlyAnswered.value + 1;
        }
      }

      percentage.value = (correctlyAnswered.value * 100) / totalQues.value;
    }

    refresh();
    update();
  }
}
