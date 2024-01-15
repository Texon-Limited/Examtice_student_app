import 'package:examtice_teacher/resources/constants.dart';
import 'package:examtice_teacher/subscriptions/pages/subscriptions_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../affiliate/affiliate_screen.dart';
import '../../../exam/presentation/widgets/webview_widget.dart';
import '../../../resources/AppConfigs.dart';
import '../../../resources/colors.dart';
import '../../../resources/styles.dart';
import '../../../routes/app_routes.dart';
import '../../../search/pages/search_questions_screen.dart';

class LeftMenuDrawer extends StatelessWidget {
  const LeftMenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: currentTheme.getCurrentTheme() == ThemeMode.dark
          ? ColorManager.deepBlack
          : ColorManager.uiBackgroundColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Image.asset(
              AssetConstant.splashImagePng,
            ),
            decoration: BoxDecoration(color: ColorManager.deepBlack),
          ),

          ListTile(
            leading: Icon(
              FeatherIcons.settings,
              color: ColorManager.brandColor,
            ),
            title: Text(
              'Test',
              style: getTextStyle(
                  16,
                  FontWeight.w400,
                  currentTheme.getCurrentTheme() == ThemeMode.dark
                      ? Colors.white
                      : ColorManager.grayLight),
            ),
            onTap: () {
              // print(Get.currentRoute);
              Get.back();
              Get.toNamed(AppRoutes.savedTestScreen);

              // Get.offNamed('/home');
            },
          ),
          ListTile(
            leading: Icon(
              FeatherIcons.settings,
              color: ColorManager.brandColor,
            ),
            title: Text(
              'Home',
              style: getTextStyle(
                  16,
                  FontWeight.w400,
                  currentTheme.getCurrentTheme() == ThemeMode.dark
                      ? Colors.white
                      : ColorManager.grayLight),
            ),
            onTap: () {
              // print(Get.currentRoute);
              Get.back();
              // Get.toNamed(AppRoutes.homeScreen);
              Get.offAllNamed(AppRoutes.landingScreen);

              // Get.offNamed('/home');
            },
          ),
          ListTile(
            leading: SvgPicture.asset(
              AssetConstant.reportIcon,
            ),
            title: Text(
              'Subscriptions',
              style: getTextStyle(
                  16,
                  FontWeight.w400,
                  currentTheme.getCurrentTheme() == ThemeMode.dark
                      ? Colors.white
                      : ColorManager.grayLight),
            ),
            onTap: () {
              // print(Get.currentRoute);
              Get.back();
              Get.to(const SubscriptionScreen());
              // Get.offNamed('/home');
            },
          ),
          ListTile(
            leading: SvgPicture.asset(
              AssetConstant.reportIcon,
            ),
            title: Text(
              'Reports',
              style: getTextStyle(
                  16,
                  FontWeight.w400,
                  currentTheme.getCurrentTheme() == ThemeMode.dark
                      ? Colors.white
                      : ColorManager.grayLight),
            ),
            onTap: () {
              // print(Get.currentRoute);
              Get.back();
              Get.toNamed(AppRoutes.reportsScreen);
              // Get.offNamed('/home');
            },
          ),
          ListTile(
            leading: Icon(
              FeatherIcons.search,
              color: ColorManager.brandColor,
            ),
            title: Text(
              'Search/Feedback Question',
              style: getTextStyle(
                  16,
                  FontWeight.w400,
                  currentTheme.getCurrentTheme() == ThemeMode.dark
                      ? Colors.white
                      : ColorManager.grayLight),
            ),
            onTap: () {
              // print(Get.currentRoute);
              Get.back();
              Get.to(SearchQuestionsScreen());
              // Get.offNamed('/home');
            },
          ),
          ListTile(
            leading: Icon(
              FeatherIcons.helpCircle,
              color: ColorManager.brandColor,
            ),
            title: Text(
              'Faq',
              style: getTextStyle(
                  16,
                  FontWeight.w400,
                  currentTheme.getCurrentTheme() == ThemeMode.dark
                      ? Colors.white
                      : ColorManager.grayLight),
            ),
            onTap: () {
              // print(Get.currentRoute);
              Get.back();
              Get.to(WebViewScreens(
                argument: "FAQ",
              ));
            },
          ),
          ListTile(
            leading: Icon(
              FeatherIcons.helpCircle,
              color: ColorManager.brandColor,
            ),
            title: Text(
              'Forum',
              style: getTextStyle(
                  16,
                  FontWeight.w400,
                  currentTheme.getCurrentTheme() == ThemeMode.dark
                      ? Colors.white
                      : ColorManager.grayLight),
            ),
            onTap: () {
              // print(Get.currentRoute);
              Get.back();
              Get.to(WebViewScreens(
                argument: "FORUM",
              ));
            },
          ),
          ListTile(
            leading: SvgPicture.asset(
              AssetConstant.shareIcon,
              color: ColorManager.brandColor,
            ),
            title: Text(
              'Affiliate',
              style: getTextStyle(
                  16,
                  FontWeight.w400,
                  currentTheme.getCurrentTheme() == ThemeMode.dark
                      ? Colors.white
                      : ColorManager.grayLight),
            ),
            onTap: () {
              // print(Get.currentRoute);
              Get.back();
              Get.to(const AffiliateScreen());
              // Get.offNamed('/home');
            },
          ),
          ListTile(
            leading: SvgPicture.asset(
              AssetConstant.subscribeTeacherIcon,
              color: ColorManager.brandColor,
            ),
            title: Text(
              'Subscribe Teacher',
              style: getTextStyle(
                  16,
                  FontWeight.w400,
                  currentTheme.getCurrentTheme() == ThemeMode.dark
                      ? Colors.white
                      : ColorManager.grayLight),
            ),
            onTap: () {
              Get.back();
              Get.toNamed(AppRoutes.studentsScreen);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.headset_mic_outlined,
              color: ColorManager.brandColor,
            ),
            title: Text(
              'Support',
              style: getTextStyle(
                  16,
                  FontWeight.w400,
                  currentTheme.getCurrentTheme() == ThemeMode.dark
                      ? Colors.white
                      : ColorManager.grayLight),
            ),
            onTap: () {
              // print(Get.currentRoute);
              Get.back();
              Get.toNamed(AppRoutes.supportList);
            },
          ),
          ListTile(
            leading: Icon(
              FeatherIcons.helpCircle,
              color: ColorManager.brandColor,
            ),
            title: Text(
              'News',
              style: getTextStyle(
                  16,
                  FontWeight.w400,
                  currentTheme.getCurrentTheme() == ThemeMode.dark
                      ? Colors.white
                      : ColorManager.grayLight),
            ),
            onTap: () {
              // print(Get.currentRoute);
              Get.back();
              Get.to(WebViewScreens(
                argument: "NEWS",
              ));
            },
          ),
          Divider(
            height: 2.0,
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    Wrap(
                      alignment: WrapAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            _launchSocialMediaAppIfInstalled(
                              url: 'https://www.facebook.com/examtice', // Facebook
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(FeatherIcons.facebook),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            _launchSocialMediaAppIfInstalled(
                              url: 'https://www.instagram.com/examtice.official/', // Facebook
                            );
                          },

                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(FeatherIcons.instagram),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            _launchSocialMediaAppIfInstalled(
                              url: 'https://twitter.com/examtice', // Facebook
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(FeatherIcons.twitter),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(32),
                          child: Text('All Rights Reserved. ©2021 Examtice. '),
                        )
                      ],
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }

  Future<void> _launchSocialMediaAppIfInstalled({
    required String url,
  }) async {
    try {
      bool launched = await launch(url, forceSafariVC: false); // Launch the app if installed!

      if (!launched) {
        launch(url); // Launch web view if app is not installed!
      }
    } catch (e) {
      launch(url); // Launch web view if app is not installed!
    }
  }
}
