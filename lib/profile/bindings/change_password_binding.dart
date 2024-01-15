
import 'package:get/get.dart';

import '../view_models/profile_vm.dart';

class ChangePasswordScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileViewModel());
  }
}