import 'dart:async';

import 'package:examtice_teacher/eshop/models/eshop_list_response.dart';
import 'package:examtice_teacher/eshop/repositories/eshops_repository.dart';
import 'package:examtice_teacher/home/models/student_list_response.dart';
import 'package:examtice_teacher/home/repositories/home_repository.dart';
import 'package:examtice_teacher/resources/AppConfigs.dart';
import 'package:examtice_teacher/resources/api_status.dart';
import 'package:examtice_teacher/students/models/all_students_list_response.dart';
import 'package:examtice_teacher/students/repositories/students_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../resources/constants.dart';
import '../../routes/app_routes.dart';

class EShopsViewModel extends GetxController {
  final EshopRepository _shopRepository = EshopRepository();

  final searchController = TextEditingController().obs;
  final searchControllerFocus = FocusNode().obs;
  RxBool loading = false.obs;

  final rxRequestStatus = ApiStatus.loading.obs;

  void setRxRequestStatus(ApiStatus status) => rxRequestStatus.value = status;


  var rxList = [].obs;
  void setRxList(List<EshopDatum> data) => rxList.value = data;

  List<EshopDatum> allShopItemList = [];



  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    allStudentsListApi();
  }

  void allStudentsListApi() {
    _shopRepository.getAllSubscriptionItemsAPI().then((value) {
      setRxRequestStatus(ApiStatus.completed);
      var studentListResponse = EshopResponseList.fromJson(value);
      // allShopItemList = studentListResponse.data ?? [];
      studentListResponse.data?.forEach((data) {
        allShopItemList.add(data);
      });

      setRxList(allShopItemList);

    }).onError((error, stackTrace) {
      setRxRequestStatus(ApiStatus.error);
    });
  }
}
