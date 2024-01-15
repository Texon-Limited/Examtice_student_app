import 'package:examtice_teacher/splash/view_models/on_boarding_vm.dart';
import 'package:get/get.dart';

class OnBoardingScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OnBoardingViewModel());
  }
}
