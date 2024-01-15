import 'dart:ffi';

import 'package:examtice_teacher/exam/models/course_list_response.dart';
import 'package:examtice_teacher/exam/models/subject_list_response.dart';
import 'package:examtice_teacher/exam/repositories/course_repository.dart';
import 'package:examtice_teacher/resources/utis.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';

import '../../home/models/student_list_response.dart';
import '../../resources/AppConfigs.dart';
import '../../resources/api_status.dart';
import '../../routes/app_routes.dart';

class SelectCourseViewModel extends GetxController {
  final CourseRepository _courseRepository = CourseRepository();

  final formKey = GlobalKey<FormState>();
  final formKeyForSearch = GlobalKey<FormState>();
  final formKeyForFeedback = GlobalKey<FormState>();
  final scaffoldState = GlobalKey<ScaffoldState>();
  var examNameController = TextEditingController().obs;
  final examNameControllerFocus = FocusNode().obs;

  final rxRequestStatus = ApiStatus.loading.obs;

  void setRxRequestStatus(ApiStatus status) => rxRequestStatus.value = status;
  Rx<List<CourseDatum>> allCourses = Rx<List<CourseDatum>>(<CourseDatum>[]);
  Rx<CourseDatum> selectedCourse = Rx<CourseDatum>(CourseDatum());

  final rxSubjectListRequestStatus = ApiStatus.loading.obs;
  void setRxSubjectListRequestStatus(ApiStatus status) =>
      rxSubjectListRequestStatus.value = status;
  Rx<List<SubjectDatum>> allSubjects = Rx<List<SubjectDatum>>(<SubjectDatum>[]);
  Rx<SubjectDatum> selectedSubject = Rx<SubjectDatum>(SubjectDatum());

  final rxYearListRequestStatus = ApiStatus.loading.obs;
  void setRxYearListRequestStatus(ApiStatus status) =>
      rxYearListRequestStatus.value = status;
  Rx<List<UserSelectedYearData>> allYears = Rx<List<UserSelectedYearData>>(<UserSelectedYearData>[]);
  Rx<UserSelectedYearData> selectedYear = Rx<UserSelectedYearData>(UserSelectedYearData());

  var selectedDate = DateTime.now().obs;
  double kItemExtent = 32.0;
  List<int> yearsList = <int>[].obs;
  // var selectedYear = 2005.obs;

  List<String> allType = ['Multi-choice Questions', 'Theory Questions', 'Practical Questions' ];
  List<MultiSelectItem> yearItems = [];

  var selectedType = 'Multi-choice Questions'.obs;
  @override
  void onInit() {
    super.onInit();
    for (var i = DateTime.now().year; i > 2000; i--) {
      yearsList.add(i);
    }
    yearItems = yearsList
        .map((animal) => MultiSelectItem<String>(animal.toString(), animal.toString()))
        .toList();


    callCourseListApi();
  }

  void callCourseListApi() {
    _courseRepository.getCourseListAPI().then((value) {
      setRxRequestStatus(ApiStatus.completed);
      var examListResponse = CourseListResponse.fromJson(value);
      if (examListResponse.data?.isNotEmpty == true) {
        selectedCourse.value = examListResponse.data!.first;
        selectedCourseGlobalData.value = examListResponse.data!.first;
        callCourseSubjectListApi();
      }
      examListResponse.data?.forEach((data) {
        allCourses.value.add(data);
      });

      if (kDebugMode) {
        print('allCourses.length ${allCourses.value.length}');
      }
      update();
    }).onError((error, stackTrace) {
      setRxRequestStatus(ApiStatus.error);
    });
  }

  setSelectedCourse(CourseDatum? value) {
    selectedCourse.value = value!;
    selectedCourseGlobalData.value = value!;
    update();
    print(selectedCourse.value.name);

    callCourseSubjectListApi();
  }

  void callCourseSubjectListApi() {
    _courseRepository
        .getSubjectListAPI(courseId: selectedCourse.value.id.toString())
        .then((value) {
      setRxSubjectListRequestStatus(ApiStatus.completed);

      var subjectListResponse = SubjectListResponse.fromJson(value);
      if (subjectListResponse.data?.isNotEmpty == true) {
        selectedSubject.value = subjectListResponse.data!.first;
        selectedSubjectGlobalData.value = subjectListResponse.data!.first;

        allSubjects.value = subjectListResponse.data!;
      }
      // subjectListResponse.data?.forEach((data) {
      //   allSubjects.value.add(data);
      // });

      if (kDebugMode) {
        print('allSubjects.length ${allSubjects.value.length}');
      }
      update();
    }).onError((error, stackTrace) {
      setRxSubjectListRequestStatus(ApiStatus.error);
    });
  }

  setSelectedSubject(SubjectDatum? value) {
    selectedSubject.value = value!;
    selectedSubjectGlobalData.value = value!;
    update();
    if (kDebugMode) {
      print(selectedSubject.value.name);
    }
  }

  void callCourseYearListApi() {
    _courseRepository
        .getYearListAPI(courseId: selectedCourse.value.id.toString(), subjectId: selectedSubject.value.id.toString())
        .then((value) {
      setRxYearListRequestStatus(ApiStatus.completed);

      var subjectYearListResponse = UserSelectedYearListModel.fromJson(value);
      if (subjectYearListResponse.data?.isNotEmpty == true) {
        selectedYear.value = subjectYearListResponse.data!.first;
        selectedSubjectYearGlobalData.value = subjectYearListResponse.data!.first;

        allYears.value = subjectYearListResponse.data!;
      }
      // subjectListResponse.data?.forEach((data) {
      //   allSubjects.value.add(data);
      // });
      if (kDebugMode) {
        print('allSubjects.length ${allYears.value.length}');
      }
      update();
    }).onError((error, stackTrace) {
      setRxSubjectListRequestStatus(ApiStatus.error);
    });
  }

  setSelectedYear(UserSelectedYearData? value) {
    selectedYear.value = value!;
    selectedSubjectYearGlobalData.value = value!;
    update();
    if (kDebugMode) {
      print(selectedYear.value.value);
    }
  }

  void goToTopicSelection() {
    if (formKey.currentState!.validate()) {
      Utils.toastMessage('success');
      examNameGlobalData = examNameController.value.text;
      Get.toNamed(
        AppRoutes.selectTopic,
      );
    } else {
      //to do
      examNameGlobalData = 'name exam';

      // Utils.toastMessage('Type your exam name please');
    }
  }
}
