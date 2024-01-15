import 'package:examtice_teacher/splash/view_models/splash_vm.dart';
import 'package:examtice_teacher/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../resources/constants.dart';


class SplashScreen extends GetView<SplashViewModel> {
   const SplashScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SplashViewModel());

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // SvgPicture.asset(AssetConstant.splashIcon, fit: BoxFit.fill,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Image.asset(AssetConstant.splashImage),
                ),

                Obx((){
                    return Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.all(48.0),
                        child: LinearProgressIndicator(
                          backgroundColor: Colors.grey,
                          valueColor: AlwaysStoppedAnimation<Color>(
                              ColorManager.brandColor),
                          value: controller.progressValue.value,
                        ),
                      ),
                    );
                  }
                ),
              ],
            )),
      ),
    );
  }
}
