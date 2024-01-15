import 'package:examtice_teacher/forum/view_models/forum_controller_vm.dart';
import 'package:get/get.dart';

class ForumBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ForumDetailsViewModel());
  }
}