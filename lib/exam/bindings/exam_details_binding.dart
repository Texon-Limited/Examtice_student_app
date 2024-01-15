
import 'package:examtice_teacher/exam/presentation/pages/cr_ex_select_student_screen.dart';
import 'package:examtice_teacher/exam/view_models/exam_details_vm.dart';
import 'package:examtice_teacher/exam/view_models/exam_screen_vm.dart';
import 'package:get/get.dart';

import '../view_models/select_exam_vm.dart';

class ExamDetailsBinding extends Bindings {
  @override
  void dependencies() {
    void dependencies() {
      Get.lazyPut(() => ExamDetailsViewModel());
    }
  }
}