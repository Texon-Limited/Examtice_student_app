

import 'package:examtice_teacher/exam/view_models/select_topic_vm.dart';
import 'package:get/get.dart';

class SelectTopicBinding extends Bindings {
  @override
  void dependencies() {
    void dependencies() {
      Get.lazyPut(() => SelectTopicViewModel());
    }
  }
}