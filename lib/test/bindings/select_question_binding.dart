
import 'package:examtice_teacher/exam/view_models/select_question_vm.dart';
import 'package:get/get.dart';

class SelectQuestionBinding extends Bindings {
  @override
  void dependencies() {
    void dependencies() {
      Get.lazyPut(() => SelectQuestionViewModel());
    }
  }
}