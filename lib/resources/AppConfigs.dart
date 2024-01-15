import 'package:examtice_teacher/auth/models/login_response.dart';
import 'package:examtice_teacher/main.dart';
import 'package:examtice_teacher/profile/models/support_list_response.dart';
import 'package:examtice_teacher/test/models/saved_test_list_response.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../exam/models/course_list_response.dart';
import '../exam/models/exam_list_response.dart';
import '../exam/models/question_list_response.dart';
import '../exam/models/subject_list_response.dart';
import '../exam/models/topic_list_response.dart';
import '../home/models/student_list_response.dart';

MyTheme currentTheme = MyTheme();
LoginResponse? sessionLoginData;

List<Student> selectedListGlobalData = [];
String examNameGlobalData = '';
Rx<CourseDatum> selectedCourseGlobalData = Rx<CourseDatum>(CourseDatum());
Rx<SubjectDatum> selectedSubjectGlobalData = Rx<SubjectDatum>(SubjectDatum());
Rx<UserSelectedYearData> selectedSubjectYearGlobalData = Rx<UserSelectedYearData>(UserSelectedYearData());
var selectedYearGlobalData = 2006.obs;
List<TopicDatum> selectedTopicListGlobalData = [];

List<Question> selectedQuestionList = [];

Rx<ExamDatum> selectedExamGlobalData = Rx<ExamDatum>(ExamDatum());
Rx<SupportDatum> selectedSupportGlobalData = Rx<SupportDatum>(SupportDatum());


Rx<SavedTestDatum> selectedTestGlobalData = Rx<SavedTestDatum>(SavedTestDatum());

List<GlobalKey<FormState>> formKeys = [
  GlobalKey<FormState>(),
  GlobalKey<FormState>(),
  GlobalKey<FormState>(),
  GlobalKey<FormState>()
];