import 'dart:async';
import 'dart:convert';

import 'package:examtice_teacher/exam/models/exam_list_response.dart';
import 'package:examtice_teacher/exam/models/students_list_response_by_exam.dart';
import 'package:examtice_teacher/exam/repositories/exam_repository.dart';
import 'package:examtice_teacher/exam/repositories/saved_test_repository.dart';
import 'package:examtice_teacher/home/models/student_list_response.dart';
import 'package:examtice_teacher/home/repositories/home_repository.dart';
import 'package:examtice_teacher/resources/AppConfigs.dart';
import 'package:examtice_teacher/resources/api_status.dart';
import 'package:examtice_teacher/test/models/saved_test_list_response.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../resources/constants.dart';
import '../../resources/utis.dart';
import '../../routes/app_routes.dart';
import '../models/question_answers_by_exam_response.dart';
import '../models/saved_test_question_answer_response.dart';

class SavedTestViewModel extends GetxController with GetSingleTickerProviderStateMixin {
  final SavedTestRepository _examRepository = SavedTestRepository();

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

  List<SavedTestDatum> examList = [];
  Rx<SavedTestDatum> selectedExam = Rx<SavedTestDatum>(SavedTestDatum());

  var rxList = [].obs;

  // Set the list of exams using Rx
  void setRxList(List<SavedTestDatum> data) => rxList.value = data;

  List<Datum> studentList = [];

  List<SavedQuestion> qaList = [];
  List<Questions> quesAndAnsList = [];
  var currentQuestionsIndex = 0.obs;
  var selectedAnswerIndex = 5.obs;


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
    tabController = TabController(vsync: this, length: 4);
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
    callExamListApi();
  }

  void callExamListApi() {
    _examRepository.getSavedExamListAPI().then((value) {
      setRxRequestStatus(ApiStatus.completed);
      var examListResponse = SavedTestListResponse.fromJson(value);
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

  setSelectedTest(SavedTestDatum? value) {
    selectedExam.value = value!;
    selectedTestGlobalData.value = value!;
    update();
    callGetQuestionAnswerAPI(value.testId!);
    // callExamStudentDetailsApi();
  }

  // void callExamStudentDetailsApi() {
  //   _examRepository
  //       .getExamStudentDetailsApi(selectedExam.value.examId.toString())
  //       .then((value) {
  //     setRxStudentRequestStatus(ApiStatus.completed);
  //     var examListResponse = StudentsListResponseByExam.fromJson(value);
  //     examListResponse.data?.forEach((data) {
  //       studentList.add(data);
  //     });
  //     // update();
  //   }).onError((error, stackTrace) {
  //     setRxStudentRequestStatus(ApiStatus.error);
  //     Utils.snackBar('Error: ', error.toString());
  //   });
  // }
  //

  void callGetQuestionAnswerAPI(String testID) {
    setRxQARequestStatus(ApiStatus.loading);
    _examRepository
        .callGetQuestionAnswer(testID)
        .then((value) {
      setRxQARequestStatus(ApiStatus.completed);
      var savedQAResponse = SavedTestQuestionAnswerResponse.fromJson(value);
      savedQAResponse.data?.questions?.forEach((data) {
        qaList.add(data);
      });
      // update();
    }).onError((error, stackTrace) {
      setRxQARequestStatus(ApiStatus.error);
      Utils.snackBar('Error: ', error.toString());
    });
  }

  ///full answer of question
  void callGetAllQuestionWithAnswerAPI(
      List<int> topicsID,
      int courseID,
      int type,
      List<int> year,
      String subjectID,
      int numberOfQuestion,
      int userID,
      bool isExam,
      int totalQuestion,
      int randomQuestion,
      int flagQuestion,
      ) {
    setRxQARequestStatus(ApiStatus.loading);
    _examRepository
        .callGetAllQuestionWithAnswer(topicsID, courseID, type, year, subjectID, numberOfQuestion,
         isExam, totalQuestion, randomQuestion, flagQuestion)
        .then((value) {
      setRxQARequestStatus(ApiStatus.completed);
      var savedQAResponse = SaveAllQuestionWithAnswerModel.fromJson(value);
      savedQAResponse.data?.questions?.forEach((data) {
        quesAndAnsList.add(data);
      });
    }).onError((error, stackTrace) {
      setRxQARequestStatus(ApiStatus.error);
      Utils.snackBar('Error: ', error.toString());
    });
  }

  ///send student answer of a single question
  RxInt rightOption = 0.obs;

  void sendStudentAnswerAPI(
      String testID,
      String quesID,
      String chosenOption,
      ) {
    _examRepository
        .callSendQuestionAnswer(testID, quesID, chosenOption)
        .then((value) {
      setRxQARequestStatus(ApiStatus.completed);
      print('=====>$value');
      rightOption.value = value['result']['rightOption'];
      callGetQuestionAnswerAPI(selectedExam.value.testId.toString());
      qaList[currentQuestionsIndex.value].userOption = selectedAnswerIndex.value;
    }).onError((error, stackTrace) {
      setRxQARequestStatus(ApiStatus.error);
      Utils.snackBar('Error: ', error.toString());
    });
  }


  void sendSpentTimeAPI(
      String testID,
      String spentTime,
      ) {
    _examRepository
        .callSendTime(testID, spentTime)
        .then((value) {
      setRxQARequestStatus(ApiStatus.completed);
      print('=====>$value');
      Get.back();
    }).onError((error, stackTrace) {
      setRxQARequestStatus(ApiStatus.error);
      Utils.snackBar('Error: ', error.toString());
    });
  }

  void sendSaveTestAPI(
      String testID,
      String spentTime,
      ) {
    _examRepository
        .callSaveTest(testID, spentTime)
        .then((value) {
      setRxQARequestStatus(ApiStatus.completed);
      print('=====>$value');
      Get.back();
    }).onError((error, stackTrace) {
      setRxQARequestStatus(ApiStatus.error);
      Utils.snackBar('Error: ', error.toString());
    });
  }
}
