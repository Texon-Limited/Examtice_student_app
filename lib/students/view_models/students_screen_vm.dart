import 'dart:async';

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
import '../models/all_teachers_response.dart';

class StudentsViewModel extends GetxController {
  final StudentsRepository _studentsRepository = StudentsRepository();

  final searchController = TextEditingController().obs;
  final searchControllerFocus = FocusNode().obs;
  RxBool loading = false.obs;

  final rxRequestStatus = ApiStatus.loading.obs;

  void setRxRequestStatus(ApiStatus status) => rxRequestStatus.value = status;

  List<TeacherDatum> acceptedStudentList = [];
  List<TeacherDatum> waitingForConfirmationStudentList = [];
  List<TeacherDatum> pendingStudentList = [];


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    allTeachersListApi();
  }

  void allTeachersListApi() {
    _studentsRepository.getAllTeachersListAPI().then((value) {
      setRxRequestStatus(ApiStatus.completed);
      var studentListResponse = TeacherListResponse.fromJson(value);
      acceptedStudentList = studentListResponse.data?.accepted ?? [];
      waitingForConfirmationStudentList = studentListResponse.data?.pendingConfirm ?? [];
      pendingStudentList = studentListResponse.data?.pendingRequest ?? [];

    }).onError((error, stackTrace) {
      setRxRequestStatus(ApiStatus.error);
    });
  }
}
