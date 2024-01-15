
import 'package:examtice_teacher/profile/view_models/support_vm.dart';
import 'package:get/get.dart';

class SupportDetailsScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SupportViewModel());
  }
}