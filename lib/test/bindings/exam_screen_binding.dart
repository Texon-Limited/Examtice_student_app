
import 'package:examtice_teacher/exam/view_models/exam_screen_vm.dart';
import 'package:get/get.dart';

class ExamScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ExamViewModel());
  }
}