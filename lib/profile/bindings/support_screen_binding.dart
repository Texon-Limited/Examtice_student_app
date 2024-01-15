
import 'package:get/get.dart';

import '../view_models/support_vm.dart';

class SupportScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SupportViewModel());
  }
}