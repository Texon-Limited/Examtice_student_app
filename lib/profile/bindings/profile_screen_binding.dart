import 'package:examtice_teacher/home/view_models/home_vm.dart';
import 'package:examtice_teacher/profile/view_models/profile_vm.dart';
import 'package:get/get.dart';

class ProfileScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileViewModel());
  }
}

