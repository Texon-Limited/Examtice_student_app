
import 'package:examtice_teacher/students/view_models/students_screen_vm.dart';
import 'package:get/get.dart';

import '../view_models/eshop_screen_vm.dart';

class EShopScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EShopsViewModel());
  }
}