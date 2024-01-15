
import 'package:examtice_teacher/exam/view_models/saved_test_view_model.dart';
import 'package:get/get.dart';

class SavedTestScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SavedTestViewModel());
  }
}