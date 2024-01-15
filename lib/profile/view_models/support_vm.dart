import 'dart:async';

import 'package:examtice_teacher/home/models/student_list_response.dart';
import 'package:examtice_teacher/home/repositories/home_repository.dart';
import 'package:examtice_teacher/profile/models/support_comments_response.dart';
import 'package:examtice_teacher/profile/models/support_list_response.dart';
import 'package:examtice_teacher/profile/repositories/support_repository.dart';
import 'package:examtice_teacher/resources/AppConfigs.dart';
import 'package:examtice_teacher/resources/api_status.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../auth/models/sign_up_response.dart';
import '../../auth/view_models/user_pref_vm.dart';
import '../../resources/constants.dart';
import '../../resources/utis.dart';
import '../../routes/app_routes.dart';

class SupportViewModel extends GetxController {
  SupportRepository supportRepository = SupportRepository();

  final rxRequestStatus = ApiStatus.loading.obs;

  void setRxRequestStatus(ApiStatus status) => rxRequestStatus.value = status;

  Rx<List<SupportDatum>> allSupportList =
      Rx<List<SupportDatum>>(<SupportDatum>[]);
  Rx<SupportDatum> selectedSupport = Rx<SupportDatum>(SupportDatum());

  final rxRequestCommentsStatus = ApiStatus.loading.obs;
  setRxCommentRequestStatus(ApiStatus status) =>
      rxRequestCommentsStatus.value = status;
  Rx<List<CommentDatum>> allCommentsList =
      Rx<List<CommentDatum>>(<CommentDatum>[]);

  final rxRequestAddCommentsStatus = ApiStatus.completed.obs;

  setRxAddCommentRequestStatus(ApiStatus status) =>
      rxRequestAddCommentsStatus.value = status;

  final emailController = TextEditingController().obs;
  var emailControllerFocus = FocusNode();

  final formKey = GlobalKey<FormState>();

  var titleController = TextEditingController().obs;
  final titleControllerFocus = FocusNode().obs;

  var contentController = TextEditingController().obs;
  final contentControllerFocus = FocusNode().obs;

  final categoryList = [
    // 'Select a category',
    'Account Problem', 'Login Issues'
  ].obs;
  var selectedCategory = 'Account Problem'.obs;

  final rxRequestAddTicketStatus = ApiStatus.completed.obs;

  setRxAddTicketRequestStatus(ApiStatus status) =>
      rxRequestAddTicketStatus.value = status;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    callSupportListApi();
  }

  void callSupportListApi() {
    supportRepository.getSupportListAPI().then((value) {
      setRxRequestStatus(ApiStatus.completed);
      var supportListResponse = SupportListResponse.fromJson(value);

      allSupportList.value.clear();
      supportListResponse.data?.forEach((data) {
        allSupportList.value.add(data);
        allSupportList.refresh();

      });

      if (kDebugMode) {
        print('allSupportList.length ${allSupportList.value.length}');
      }
      update();
    }).onError((error, stackTrace) {
      setRxRequestStatus(ApiStatus.error);
    });
  }

  void setSelectedSupportTicket(SupportDatum value) {
    selectedSupport.value = value!;
    selectedSupportGlobalData.value = value!;
    update();
    callSupportCommentsApi();
  }

  void callSupportCommentsApi() {
    supportRepository
        .getSupportCommentsAPI(selectedSupport.value.id.toString())
        .then((value) {
      setRxCommentRequestStatus(ApiStatus.completed);
      var commentsListResponse = SupportCommentsResponse.fromJson(value);

      allCommentsList.value.clear();
      commentsListResponse.data?.forEach((data) {
        allCommentsList.value.add(data);
        allCommentsList.refresh();
      });

      if (kDebugMode) {
        print('allSupportList.length ${allCommentsList.value.length}');
      }
      update();
    }).onError((error, stackTrace) {
      setRxCommentRequestStatus(ApiStatus.error);
    });
  }

  void callAddNewCommentApi() {
    setRxAddCommentRequestStatus(ApiStatus.loading);
    supportRepository
        .addNewCommentApi(
            selectedSupport.value.id.toString(), emailController.value.text)
        .then((value) {
      setRxAddCommentRequestStatus(ApiStatus.completed);

      // var signUpResponse = SignUpResponse.fromJson(value);

      if (value["status"] == 200) {
        Utils.toastMessage(value["message"].toString());
        emailController.value.clear();
        callSupportCommentsApi();
      } else {
        Utils.toastMessage(value["message"].toString());
      }
      if (kDebugMode) {
        print('allSupportList.length ${allCommentsList.value.length}');
      }
      update();
    }).onError((error, stackTrace) {
      setRxAddCommentRequestStatus(ApiStatus.error);
    });
  }

  void callCreateTicketApi() {
    var categoryID = 0;
    if (selectedCategory.value == 'Account Problem') {
      categoryID = 4;
    } else if (selectedCategory.value == 'Login Issues') {
      categoryID = 5;
    } else {}
    setRxAddTicketRequestStatus(ApiStatus.loading);
    supportRepository
        .addNewTicketApi(
            title: titleController.value.text,
            content: contentController.value.text,
            categoryId: categoryID.toString())
        .then((value) {
      setRxAddTicketRequestStatus(ApiStatus.completed);

      // var signUpResponse = SignUpResponse.fromJson(value);

      if (value["status"] == 200) {
        Utils.toastMessage(value["message"].toString());
        titleController.value.clear();
        contentController.value.clear();
        callSupportListApi();

        Get.back();
      } else {
        Utils.toastMessage(value["message"].toString());
      }
      if (kDebugMode) {
        print('allSupportList.length ${allCommentsList.value.length}');
      }
      update();
    }).onError((error, stackTrace) {
      setRxAddTicketRequestStatus(ApiStatus.error);
    });
  }
}
