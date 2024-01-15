import 'package:examtice_teacher/exam/models/create_exam_response.dart';
import 'package:examtice_teacher/exam/models/question_list_response.dart';
import 'package:examtice_teacher/exam/repositories/select_question_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/models/student_list_response.dart';
import '../../resources/AppConfigs.dart';
import '../../resources/api_status.dart';
import '../../resources/utis.dart';
import '../../routes/app_routes.dart';

class SelectQuestionViewModel extends GetxController {
  QuestionRepository questionRepository = QuestionRepository();

  var currentStep = 0.obs;
  var activeForm = 0.obs;
  var searchController = TextEditingController().obs;

  final rxRequestStatus = ApiStatus.loading.obs;

  List<Question> allQuestionList = [];
  List<Question> selectedQuestionList = [];

  void setRxRequestStatus(ApiStatus status) => rxRequestStatus.value = status;

  @override
  void onInit() {
    super.onInit();
    callQuestionListApi();
  }

  void callQuestionListApi() {
    questionRepository
        .getQuestionListAPI(
            subjectId: selectedSubjectGlobalData.value.id.toString())
        .then((value) {
      setRxRequestStatus(ApiStatus.completed);
      var topicListResponse = QuestionListResponse.fromJson(value);
      topicListResponse.data?.questions?.forEach((data) {
        allQuestionList.add(data);
      });

      if (kDebugMode) {
        print('allCourses.length ${allQuestionList.length}');
      }
      update();
    }).onError((error, stackTrace) {
      setRxRequestStatus(ApiStatus.error);
      Utils.snackBar('Error: ', error.toString());
    });
  }

  void callCreateExamAPI() {
    List<int> questionIds = [];
    for (var element in selectedQuestionList) {
      questionIds.add(element.id!);
    }

    questionRepository
        .createExamAPI(
            subjectId: selectedSubjectGlobalData.value.id.toString(),
            questionsIds: questionIds)
        .then((value) {
      setRxRequestStatus(ApiStatus.completed);
      // var createExamResponse = CreateExamResponse.fromJson(value);
      Utils.snackBar(
          'Congratulations!', "You have successfully submitted Lms Exam");
      Get.offAllNamed(AppRoutes.landingScreen);
      update();
    }).onError((error, stackTrace) {
      setRxRequestStatus(ApiStatus.error);
      Utils.snackBar('Error: ', error.toString());
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void createQuestion() {
    if (selectedQuestionList.isNotEmpty) {
      callCreateExamAPI();
    } else {
      Utils.toastMessage('Select Questions Please');
    }
  }
}
