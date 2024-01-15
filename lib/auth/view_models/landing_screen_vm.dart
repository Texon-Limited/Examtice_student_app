import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../exam/presentation/pages/exam_screen.dart';
import '../../home/presentation/pages/home_screen.dart';
import '../../profile/presentation/pages/profile_screen.dart';
import '../../resources/colors.dart';
import '../../routes/app_routes.dart';
import '../../students/presentation/pages/students_screen.dart';

class LandingScreenViewModel extends GetxController{


  late PersistentTabController tabController;

  var tabIndex = 0.obs;

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }

  List<Widget> buildScreens() {
    return [
      HomeScreen(),
      LMSExamScreen(),
      SubscribedTeacherParentScreen(),
      ProfileScreen()
    ];
  }

  List<PersistentBottomNavBarItem> navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(PhosphorIcons.house),
        title: ("Home"),
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: ColorManager.inactiveTabColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(PhosphorIcons.exam),
        title: ("Exam"),
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: ColorManager.inactiveTabColor,
      ),

      PersistentBottomNavBarItem(
        icon: const Icon(PhosphorIcons.student),
        title: ("Students"),
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: ColorManager.inactiveTabColor,
      ),

      PersistentBottomNavBarItem(
        icon: const Icon(PhosphorIcons.user),
        title: ("Profile"),
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: ColorManager.inactiveTabColor,
      ),
    ];
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    tabController = PersistentTabController(initialIndex: 0);

  }



}