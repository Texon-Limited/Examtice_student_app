import 'package:examtice_teacher/splash/view_models/splash_vm.dart';
import 'package:get/get.dart';

import '../presentation/pages/splash_screen.dart';

class SplashScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() =>  SplashViewModel());
  }
}
