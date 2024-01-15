
import 'package:examtice_teacher/exam/view_models/exam_details_vm.dart';
import 'package:examtice_teacher/exam/view_models/exam_screen_vm.dart';
import 'package:get/get.dart';

import '../view_models/reports_vm.dart';

class ExamScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ExamViewModel());
    Get.lazyPut(() => ReportsViewModel());
  }
}