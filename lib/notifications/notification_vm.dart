import 'dart:async';

import 'package:examtice_teacher/home/models/student_list_response.dart';
import 'package:examtice_teacher/home/repositories/home_repository.dart';
import 'package:examtice_teacher/notifications/notification_list_response.dart';
import 'package:examtice_teacher/notifications/notification_repository.dart';
import 'package:examtice_teacher/resources/AppConfigs.dart';
import 'package:examtice_teacher/resources/api_status.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../auth/view_models/user_pref_vm.dart';
import '../../resources/constants.dart';
import '../../routes/app_routes.dart';

class NotificationViewModel extends GetxController {
  NotificationRepository notificationRepository = NotificationRepository();

  final rxRequestStatus = ApiStatus.loading.obs;
  List<NotificationDatum> studentList = [];

  void setRxRequestStatus(ApiStatus status) => rxRequestStatus.value = status;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    callNotificationListApi();


  }


  void callNotificationListApi() {

    notificationRepository.getNotificationListAPI().then((value) {
      setRxRequestStatus(ApiStatus.completed);
      var studentListResponse = NotificationListResponse.fromJson(value);
      studentListResponse.data?.data?.forEach((data) {
        studentList.add(data);
      });
    }).onError((error, stackTrace) {
      setRxRequestStatus(ApiStatus.error);
    });
  }

// void studentListApi() {
//   _homeRepository.getStudentListAPI().then((value) {
//     setRxRequestStatus(ApiStatus.completed);
//     var studentListResponse = StudentListResponse.fromJson(value);
//     studentListResponse.data?.forEach((data) {
//       studentList.add(data);
//     });
//   }).onError((error, stackTrace) {
//     setRxRequestStatus(ApiStatus.error);
//   });
// }
}
