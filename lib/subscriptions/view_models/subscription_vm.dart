import 'dart:async';

import 'package:examtice_teacher/eshop/models/eshop_list_response.dart';
import 'package:examtice_teacher/eshop/repositories/eshops_repository.dart';
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
import '../pages/subscription_details_screen.dart';

class SubscriptionViewModel extends GetxController {
  final SubscriptionRepository _shopRepository = SubscriptionRepository();

  final searchController = TextEditingController().obs;
  final searchControllerFocus = FocusNode().obs;
  RxBool loading = false.obs;

  final rxRequestStatus = ApiStatus.loading.obs;

  void setRxRequestStatus(ApiStatus status) => rxRequestStatus.value = status;


  var rxList = [].obs;
  void setRxList(List<SubscriptionDatum> data) => rxList.value = data;

  List<SubscriptionDatum> allSubscriptionItemList = [];


  Rx<SubscriptionDatum> selectedSubscription = Rx<SubscriptionDatum>(SubscriptionDatum());
  Rx<SubscriptionDetailsResponse> subscriptionDetailsResponse = Rx<SubscriptionDetailsResponse>(SubscriptionDetailsResponse());

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAllSubscriptionItems();
  }


  setSelectedExam(SubscriptionDatum? value) {
    selectedSubscription.value = value!;
    update();

    callSubscriptionDetailsApi();
  }

  void callSubscriptionDetailsApi() {
    _shopRepository
        .getAllSubscriptionDetailsAPI(selectedSubscription.value.id.toString())
        .then((value) {
      setRxRequestStatus(ApiStatus.completed);
      var examListResponse = SubscriptionDetailsResponse.fromJson(value);
      subscriptionDetailsResponse.value = examListResponse;

      Get.to(const SubscriptionDetailsScreen());
      // update();
    }).onError((error, stackTrace) {
      setRxRequestStatus(ApiStatus.error);
      // Utils.snackBar('Error: ', error.toString());
    });
  }


  void getAllSubscriptionItems() {
    _shopRepository.getAllItemsAPI().then((value) {
      setRxRequestStatus(ApiStatus.completed);
      var studentListResponse = SubscriptionListResponse.fromJson(value);
      // allShopItemList = studentListResponse.data ?? [];
      studentListResponse.data?.forEach((data) {
        allSubscriptionItemList.add(data);
      });

      setRxList(allSubscriptionItemList);

    }).onError((error, stackTrace) {
      setRxRequestStatus(ApiStatus.error);
    });
  }
}
