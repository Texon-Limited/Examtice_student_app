import 'dart:async';

import 'package:get/get.dart';

import '../../routes/app_routes.dart';
import '../services/splash_service.dart';

class SplashViewModel extends GetxController {
  var progressValue = 0.0.obs;

  SplashServices ss = SplashServices();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _updateProgress();
  }

  void _updateProgress() {
    const oneSec = Duration(seconds: 1);

    Timer.periodic(oneSec, (Timer t) {
      // we "finish" downloading here
      progressValue.value += 0.25;

      print(progressValue.value);
      if (progressValue.value == 1.0) {
        t.cancel();

        ss.isLogin();

        // Get.offAllNamed(
        //   AppRoutes.onBoardingScreen,
        // );

        // Navigator.pushReplacement(
        //     context,
        //     MaterialPageRoute(
        //       fullscreenDialog: true,
        //       builder: (context) =>
        //       const OnBordingScreen(), //const LandingScreen(),
        //     ));
        return;
      }
    });
  }
}
