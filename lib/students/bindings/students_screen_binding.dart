
import 'package:examtice_teacher/students/view_models/students_screen_vm.dart';
import 'package:get/get.dart';

class StudentScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StudentsViewModel());
  }
}