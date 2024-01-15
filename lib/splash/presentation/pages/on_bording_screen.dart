import 'package:examtice_teacher/auth/presentation/pages/sign_in_screen.dart';
import 'package:examtice_teacher/auth/presentation/pages/sign_up_screen.dart';
import 'package:examtice_teacher/resources/colors.dart';
import 'package:examtice_teacher/resources/constants.dart';
import 'package:examtice_teacher/resources/styles.dart';
import 'package:examtice_teacher/splash/view_models/on_boarding_vm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../resources/AppConfigs.dart';
import '../../../routes/app_routes.dart';
import '../../models/slider.dart';
import '../widgets/slider_item.dart';

class OnBoardingScreen extends GetView<OnBoardingViewModel> {
  const OnBoardingScreen({Key? key}) : super(key: key);
//
//   @override
//   State<OnBoardingScreen> createState() => _OnBoardingScreenState();
// }
//
// class _OnBoardingScreenState extends State<OnBoardingScreen> {
  // int currentIndex = 0;
  // List<SliderModel> slides = [];
  // PageController _controller = PageController(initialPage: 0);
  //
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //
  //   slides = getSlides();
  // }
  //
  // @override
  // void dispose() {
  //   _controller.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingViewModel());

    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Expanded(
            // PageView Builder
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: PageView.builder(
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (value) {
                    controller.onPageIndex.value = value;
                    debugPrint(' onPageChanged.onPageIndex.value ${controller.onPageIndex.value} --- index $value' );

                  },
                  itemCount: controller.slides.length,
                  itemBuilder: (context, index) {
                    // Contents of Slider that we
                    // created in Modal Class
                    return SliderItem(
                      image: controller.slides[index].getImage(),
                      title: controller.slides[index].getTitle(),
                      description: controller.slides[index].getDescription(),
                    );
                  }),
            ),
          ),

          // Container created for dots
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                controller.slides.length,
                (index) => Obx((){
                    return buildDot(index, context);
                  })
                ),
              ),
            ),

          Container(
            height: 52,
            margin: EdgeInsets.all(40),
            width: double.infinity,
            decoration: BoxDecoration(
              color: ColorManager.brandColor,
              borderRadius: BorderRadius.all(Radius.circular(4)),
            ),
            child: TextButton(
              child: Text(
                   "Get Started",style: getTextStyle(16, FontWeight.w600, Colors.white),),
              onPressed: (){

                Get.offAllNamed(
                  AppRoutes.signInScreen,
                );
                // Navigator.pushReplacement(
                //     context,
                //     MaterialPageRoute(
                //       fullscreenDialog: true,
                //       builder: (context) =>
                //       const SignInScreen(), //const LandingScreen(),
                //     ));
              },
              // textColor: Colors.white,
              // shape: RoundedRectangleBorder(
              //   borderRadius: BorderRadius.circular(25),
              // ),
            ),

          ),
        ],
      ),
    ));
  }

  Container buildDot(int index, BuildContext context) {

    debugPrint(' build dot -- controller.onPageIndex.value ${controller.onPageIndex.value} --- index $index' );
// Another Container returned
    return Container(
      height: 2,
      width: controller.onPageIndex.value == index ? 30 : 18,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: controller.onPageIndex.value == index ?ColorManager.brandColor:ColorManager.grey4,
      ),
    );
  }

  Container buildButton() {
    return Container(
      height: 60,
      margin: EdgeInsets.all(40),
      width: double.infinity,
      color: Colors.green,

      // Button
      child: ElevatedButton(
        child: const Text("Get Started"),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(ColorManager.brandColor),
        ),
        onPressed: () {
          // if(currentIndex == slides.length - 1){
          //
          //   // Navigate to next screen
          //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Screen1()),
          //   );
          // }
          // _controller.nextPage(duration: Duration(milliseconds: 100), curve: Curves.bounceIn);
        },

        // Border radius to button
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(25),
        // ),
      ),
    );
  }
}


// List created
