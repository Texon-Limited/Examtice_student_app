
import 'package:examtice_teacher/exam/view_models/select_course_vm.dart';
import 'package:get/get.dart';

class SelectCourseBinding extends Bindings {
  @override
  void dependencies() {
    void dependencies() {
      Get.lazyPut(() => SelectCourseViewModel());
    }
  }
}