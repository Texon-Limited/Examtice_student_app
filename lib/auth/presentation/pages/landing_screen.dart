import 'package:examtice_teacher/auth/view_models/landing_screen_vm.dart';
import 'package:examtice_teacher/eshop/presentation/pages/eshop_screen.dart';
import 'package:examtice_teacher/exam/presentation/pages/exam_screen.dart';
import 'package:examtice_teacher/home/presentation/pages/home_screen.dart';
import 'package:examtice_teacher/profile/presentation/pages/profile_screen.dart';
import 'package:examtice_teacher/resources/colors.dart';
import 'package:examtice_teacher/resources/constants.dart';
import 'package:examtice_teacher/students/presentation/pages/students_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class LandingScreen extends GetView<LandingScreenViewModel> {
  const LandingScreen({Key? key}) : super(key: key);
//
//   @override
//   State<LandingScreen> createState() => _LandingScreenState();
// }
//
// class _LandingScreenState extends State<LandingScreen> {
//
//
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//   }

  buildBottomNavigationMenu(context, landingPageController) {
    return Obx(() => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: SizedBox(
          height: 54,
          child: Theme(
            // color: ColorManager.brandColor,
            // height: 54,
            data: Theme.of(context).copyWith(
              canvasColor:  ColorManager.brandColor,
              primaryColor:  ColorManager.brandColor,
            ),
            child: BottomNavigationBar(
              showUnselectedLabels: true,
              type: BottomNavigationBarType.fixed, // Fixed
              showSelectedLabels: true,
              onTap: landingPageController.changeTabIndex,
              currentIndex: landingPageController.tabIndex.value,
              backgroundColor: ColorManager.brandColor,
              unselectedItemColor:  Colors.white.withOpacity(0.5),
              selectedItemColor: Colors.white,
              // unselectedLabelStyle: unselectedLabelStyle,
              // selectedLabelStyle: selectedLabelStyle,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(PhosphorIcons.house),
                  label: ("Home"),
                  backgroundColor: Color.fromRGBO(36, 54, 101, 1.0),
                ),
                BottomNavigationBarItem(
                  icon: Icon(PhosphorIcons.exam),
                  label: ("LMS Exam"),
                  backgroundColor: Color.fromRGBO(36, 54, 101, 1.0),
                ),
                BottomNavigationBarItem(
                  icon: Icon(PhosphorIcons.shopping_bag),
                  label: ("Eshop"),
                  backgroundColor: Color.fromRGBO(36, 54, 101, 1.0),
                ),
                BottomNavigationBarItem(
                  icon: Icon(PhosphorIcons.user),
                  label: ("Profile"),
                  backgroundColor: Color.fromRGBO(36, 54, 101, 1.0),
                ),
              ],
            ),
          ),
        ),
    ),);
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LandingScreenViewModel());

    return SafeArea(
        child: Scaffold(
          bottomNavigationBar:
          buildBottomNavigationMenu(context, controller),
          body: Obx(() => IndexedStack(
            index: controller.tabIndex.value,
            children: [
              HomeScreen(),
              LMSExamScreen(),
              EshopScreen(),
              ProfileScreen()
            ],
          )),
        ));

    // return Obx(
    //   () {
    //     return PersistentTabView(
    //       context,
    //
    //       controller: controller.tabController,
    //       screens: controller.buildScreens(),
    //       items: controller.navBarsItems(),
    //       confineInSafeArea: true,
    //       backgroundColor: ColorManager.brandColor, // Default is Colors.white.
    //       handleAndroidBackButtonPress: true, // Default is true.
    //       resizeToAvoidBottomInset:
    //           true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
    //       stateManagement: true, // Default is true.
    //       hideNavigationBarWhenKeyboardShows:
    //           true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
    //       decoration: NavBarDecoration(
    //         // borderRadius: BorderRadius.circular(10.0),
    //         colorBehindNavBar: Colors.white,
    //       ),
    //       popAllScreensOnTapOfSelectedTab: true,
    //       popActionScreens: PopActionScreensType.all,
    //       itemAnimationProperties: const ItemAnimationProperties(
    //         // Navigation Bar's items animation properties.
    //         duration: Duration(milliseconds: 200),
    //         curve: Curves.ease,
    //       ),
    //       screenTransitionAnimation: const ScreenTransitionAnimation(
    //         // Screen transition animation on change of selected tab.
    //         animateTabTransition: true,
    //         curve: Curves.ease,
    //         duration: Duration(milliseconds: 200),
    //       ),
    //       navBarStyle:
    //           NavBarStyle.simple, // Choose the nav bar style with this property.
    //     );
    //   }
    // );
  }
}
