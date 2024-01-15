import 'dart:async';

import 'package:examtice_teacher/eshop/models/eshop_list_response.dart';
import 'package:examtice_teacher/eshop/repositories/eshops_repository.dart';
import 'package:examtice_teacher/exam/models/all_report_response.dart';
import 'package:examtice_teacher/exam/presentation/pages/report_details_screen.dart';
import 'package:examtice_teacher/exam/repositories/reports_repository.dart';
import 'package:examtice_teacher/home/models/student_list_response.dart';
import 'package:examtice_teacher/home/repositories/home_repository.dart';
import 'package:examtice_teacher/resources/AppConfigs.dart';
import 'package:examtice_teacher/resources/api_status.dart';
import 'package:examtice_teacher/students/models/all_students_list_response.dart';
import 'package:examtice_teacher/students/repositories/students_repository.dart';
import 'package:examtice_teacher/subscriptions/models/subscription_details_response.dart';
import 'package:examtice_teacher/subscriptions/models/subscription_list_response.dart';
import 'package:examtice_teacher/subscriptions/repositories/subscriptions_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../resources/constants.dart';
import '../../resources/utis.dart';
import '../../routes/app_routes.dart';
import '../models/exam_details_response.dart';

class ReportsViewModel extends GetxController
    with GetSingleTickerProviderStateMixin {
  final ReportsRepository _shopRepository = ReportsRepository();

  final searchController = TextEditingController().obs;
  final searchControllerFocus = FocusNode().obs;
  RxBool loading = false.obs;

  final rxRequestStatus = ApiStatus.loading.obs;

  Rx<AllReportResponse> listDetails =
      Rx<AllReportResponse>(AllReportResponse());

  void setRxRequestStatus(ApiStatus status) => rxRequestStatus.value = status;

  var rxList = [].obs;
  void setRxList(List<UserReport> data) => rxList.value = data;

  List<UserReport> allSubscriptionItemList = [];

  Rx<UserReport> selectedReport = Rx<UserReport>(UserReport());
  Rx<ResultLmsExam> subscriptionDetailsResponse =
      Rx<ResultLmsExam>(ResultLmsExam());

  var correctlyAnswered = 0.obs;
  String dateString = ' ';
  var percentage = 10.0.obs;
  var totalQues = 0.obs;

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
    });

    getAllReports();
  }

  setSelectedReport(UserReport? value) {
    selectedReport.value = value!;
    update();

    callSubscriptionDetailsApi();
  }

  void callSubscriptionDetailsApi() {
    _shopRepository
        .getAllSubscriptionDetailsAPI(selectedReport.value.testId.toString())
        .then((value) {
      setRxRequestStatus(ApiStatus.completed);
      var examDetailsResponse = LmsExamDetailsResponse.fromJson(value);
      if (examDetailsResponse.result != null) {
        subscriptionDetailsResponse.value = examDetailsResponse.result!;
        calcaulateData(examDetailsResponse.result!);
      }

      Get.to(const ReportDetailsScreen());
      // update();
    }).onError((error, stackTrace) {
      setRxRequestStatus(ApiStatus.error);
      // Utils.snackBar('Error: ', error.toString());
    });
  }

  void calcaulateData(ResultLmsExam examDetails) {
    if (examDetails != null) {
      totalQues.value = examDetails!.questionsData?.length ?? 0;

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

  void getAllReports() {
    _shopRepository.getAllItemsAPI().then((value) {
      setRxRequestStatus(ApiStatus.completed);
      var studentListResponse = AllReportResponse.fromJson(value);
      listDetails.value = studentListResponse;
      // allShopItemList = studentListResponse.data ?? [];
      studentListResponse.data?.userReport?.forEach((data) {
        allSubscriptionItemList.add(data);
      });

      setRxList(allSubscriptionItemList);
    }).onError((error, stackTrace) {
      setRxRequestStatus(ApiStatus.error);
    });
  }
}
