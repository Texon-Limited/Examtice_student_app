
import 'package:examtice_teacher/auth/view_models/sign_in_vm.dart';
import 'package:get/get.dart';

import '../view_models/sign_up_vm.dart';
class SignUpScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpViewModel());
  }
}