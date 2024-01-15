
import 'package:examtice_teacher/exam/models/topic_list_response.dart';
import 'package:examtice_teacher/exam/repositories/select_topic_repository.dart';
import 'package:examtice_teacher/exam/view_models/select_course_vm.dart';
import 'package:examtice_teacher/resources/utis.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../resources/AppConfigs.dart';
import '../../resources/api_status.dart';
import '../../routes/app_routes.dart';

class SelectTopicViewModel extends GetxController {
  final TopicRepository _topicRepository = TopicRepository();
  final SelectCourseViewModel selectCourseViewModel = SelectCourseViewModel();
  final formKey = GlobalKey<FormState>();
  final scaffoldState = GlobalKey<ScaffoldState>();

  final rxRequestStatus = ApiStatus.loading.obs;


  void setRxRequestStatus(ApiStatus status) => rxRequestStatus.value = status;

  List<TopicDatum> allTopicList = [];
  List<TopicDatum> selectedTopicList = [];

  var isAllSelected = true.obs;


  @override
  void onInit() {
    super.onInit();

    callTopicListApi();
  }

  void changeAllSelectionStatus(bool status){
    isAllSelected.value = status;
    if(status == true){
      selectedTopicList.addAll(allTopicList);

    }else{
      selectedTopicList.clear();
    }
    selectedTopicListGlobalData = selectedTopicList;
    update();
  }

  void callTopicListApi() {
    _topicRepository
        .getTopicListAPI(
            subjectId: selectedSubjectGlobalData.value.id.toString())
        .then((value) {
      setRxRequestStatus(ApiStatus.completed);
      var topicListResponse = TopicListResponse.fromJson(value);
      topicListResponse.data?.forEach((data) {
        allTopicList.add(data);
        selectedTopicList.add(data);
      });
      selectedTopicListGlobalData = selectedTopicList;


      if (kDebugMode) {
        print('allCourses.length ${allTopicList.length}');
      }
      update();
    }).onError((error, stackTrace) {
      setRxRequestStatus(ApiStatus.error);
      Utils.snackBar('Error: ', error.toString());

    });
  }

  void getToQuestionScreen() {
    if (selectedTopicList.isNotEmpty == true) {
      Get.toNamed(
        AppRoutes.selectQuestion,
      );
    } else {
      Utils.toastMessage('Select a Topic please');
    }
  }
}
