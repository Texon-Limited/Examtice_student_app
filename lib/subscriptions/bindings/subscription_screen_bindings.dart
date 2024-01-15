
import 'package:examtice_teacher/profile/view_models/support_vm.dart';
import 'package:examtice_teacher/subscriptions/view_models/subscription_vm.dart';
import 'package:get/get.dart';

class SubscriptionScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SubscriptionViewModel());
  }
}