
import 'package:examtice_teacher/exam/presentation/pages/cr_ex_select_student_screen.dart';
import 'package:get/get.dart';

import '../view_models/select_exam_vm.dart';

class CreateExamBinding extends Bindings {
  @override
  void dependencies() {
    void dependencies() {
      Get.lazyPut(() => SelectExamViewModel());
    }
  }
}