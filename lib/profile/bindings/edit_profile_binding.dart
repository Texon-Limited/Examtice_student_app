

import 'package:get/get.dart';

import '../view_models/profile_vm.dart';

class EditProfileScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileViewModel());
  }
}