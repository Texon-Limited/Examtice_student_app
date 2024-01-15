
import 'package:examtice_teacher/notifications/notification_vm.dart';
import 'package:get/get.dart';


class NotificationScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NotificationViewModel());
  }
}