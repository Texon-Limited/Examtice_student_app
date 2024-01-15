import 'dart:async';

import 'package:examtice_teacher/auth/models/login_response.dart';
import 'package:examtice_teacher/auth/view_models/user_pref_vm.dart';
import 'package:get/get.dart';

import '../../auth/presentation/pages/landing_screen.dart';
import '../../resources/AppConfigs.dart';
import '../../routes/app_routes.dart';

class SplashServices {
  UserPref userPref = UserPref();

  void isLogin() {
    userPref.getAccessToken().then((value) => {
          if (value != null && value != '')
            {
              userPref.getUser().then((data) {

                if(data != null && data != ''){
                  sessionLoginData = LoginResponse.fromJson(data);
                }
                Get.offAllNamed(AppRoutes.landingScreen);

              })
            }
          else
            {
              Get.offAllNamed(
                AppRoutes.onBoardingScreen,
              )
            }
        });
  }
  // RxDouble _progressValue = 0.0.obs;

  void _updateProgress() {
    // const oneSec = Duration(seconds: 1);
    // Timer.periodic(oneSec, (Timer t) {
    //   setState(() {
    //     _progressValue += 0.25;
    //     // we "finish" downloading here
    //     if (_progressValue.toStringAsFixed(1) == '1.0') {
    //       _loading = false;
    //       t.cancel();
    //       Navigator.pushReplacement(
    //           context,
    //           MaterialPageRoute(
    //             fullscreenDialog: true,
    //             builder: (context) =>
    //             const OnBordingScreen(), //const LandingScreen(),
    //           ));
    //       return;
    //     }
    //   });
    // });
  }
}
