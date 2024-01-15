import 'package:examtice_teacher/auth/view_models/landing_screen_vm.dart';
import 'package:get/get.dart';

import '../view_models/sign_in_vm.dart';
class LandingScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LandingScreenViewModel());
  }
}