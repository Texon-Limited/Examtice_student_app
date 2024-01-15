import 'dart:async';

import 'package:examtice_teacher/exam/models/exam_list_response.dart';
import 'package:examtice_teacher/exam/models/students_list_response_by_exam.dart';
import 'package:examtice_teacher/exam/repositories/exam_repository.dart';
import 'package:examtice_teacher/home/models/student_list_response.dart';
import 'package:examtice_teacher/home/repositories/home_repository.dart';
import 'package:examtice_teacher/resources/AppConfigs.dart';
import 'package:examtice_teacher/resources/api_status.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../resources/constants.dart';
import '../../resources/utis.dart';
import '../../routes/app_routes.dart';
import '../models/question_answers_by_exam_response.dart';

class ExamViewModel extends GetxController with GetSingleTickerProviderStateMixin {
  final ExamRepository _examRepository = ExamRepository();

  final searchController = TextEditingController().obs;
  final searchControllerFocus = FocusNode().obs;
  RxBool loading = false.obs;

  final rxRequestStatus = ApiStatus.loading.obs;

  // Set the request status for the exam API
  void setRxRequestStatus(ApiStatus status) => rxRequestStatus.value = status;

  final rxStudentRequestStatus = ApiStatus.loading.obs;

  // Set the request status for the student API
  void setRxStudentRequestStatus(ApiStatus status) =>
      rxStudentRequestStatus.value = status;

  List<ExamDatum> examList = [];
  Rx<ExamDatum> selectedExam = Rx<ExamDatum>(ExamDatum());

  var rxList = [].obs;

  // Set the list of exams using Rx
  void setRxList(List<ExamDatum> data) => rxList.value = data;

  List<Datum> studentList = [];

  List<QuestionsDatum> qaList = [];

  final rxQARequestStatus = ApiStatus.loading.obs;

  // Set the request status for the question-answer API
  void setRxQARequestStatus(ApiStatus status) =>
      rxQARequestStatus.value = status;

  late TabController tabController;
  var tabIndex = 0.obs;

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

      if (tabIndex.value == 1) {
        callExamStudentDetailsApi();
      } else {
        callQuestionAnswerAPI();
      }
    });
    callExamListApi();
  }

  void callExamListApi() {
    _examRepository.getStudentLMSExamListAPI().then((value) {
      setRxRequestStatus(ApiStatus.completed);
      var examListResponse = ExamListResponse.fromJson(value);
      examListResponse.data?.forEach((data) {
        examList.add(data);
      });
      setRxList(examList);
      // update();
    }).onError((error, stackTrace) {
      setRxRequestStatus(ApiStatus.error);
      Utils.snackBar('Error: ', error.toString());
    });
  }

  setSelectedExam(ExamDatum? value) {
    selectedExam.value = value!;
    selectedExamGlobalData.value = value!;
    update();
    // callQuestionAnswerAPI();
    // callExamStudentDetailsApi();
  }

  void callExamStudentDetailsApi() {
    _examRepository
        .getExamStudentDetailsApi(selectedExam.value.examId.toString())
        .then((value) {
      setRxStudentRequestStatus(ApiStatus.completed);
      var examListResponse = StudentsListResponseByExam.fromJson(value);
      examListResponse.data?.forEach((data) {
        studentList.add(data);
      });
      // update();
    }).onError((error, stackTrace) {
      setRxStudentRequestStatus(ApiStatus.error);
      Utils.snackBar('Error: ', error.toString());
    });
  }

  void callQuestionAnswerAPI() {
    _examRepository
        .getQuestionAnswerApi(selectedExam.value.examId.toString())
        .then((value) {
      setRxQARequestStatus(ApiStatus.completed);
      var examListResponse = QuestionAnswerJsonResponseByExam.fromJson(value);
      examListResponse.result?.questionsData?.forEach((data) {
        qaList.add(data);
      });
      // update();
    }).onError((error, stackTrace) {
      setRxQARequestStatus(ApiStatus.error);
      Utils.snackBar('Error: ', error.toString());
    });
  }
}
