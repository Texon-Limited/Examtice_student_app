import 'package:cached_network_image/cached_network_image.dart';
import 'package:examtice_teacher/main.dart';
import 'package:examtice_teacher/profile/view_models/profile_vm.dart';
import 'package:examtice_teacher/resources/AppConfigs.dart';
import 'package:examtice_teacher/resources/constants.dart';
import 'package:examtice_teacher/routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../resources/colors.dart';
import '../../../resources/styles.dart';
import '../../../splash/presentation/pages/on_bording_screen.dart';

class ProfileScreen extends GetView<ProfileViewModel> {
  ProfileScreen({Key? key}) : super(key: key);
//
//   @override
//   State<ProfileScreen> createState() => _ProfileScreenState();
// }
//
// class _ProfileScreenState extends State<ProfileScreen> {

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(ProfileViewModel());


    return SafeArea(
      child: Scaffold(
        backgroundColor: currentTheme.getCurrentTheme() == ThemeMode.dark
            ? Colors.black
            : ColorManager.uiBackgroundColor,
        body: Stack(
          children: [
            CustomScrollView(slivers: [
              SliverToBoxAdapter(
                child: Container(
                  height: 320,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: ColorManager.brandColor,
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      image: const DecorationImage(
                        alignment: Alignment.centerRight,
                        image: AssetImage(AssetConstant.profileBackgroundImage),
                        fit: BoxFit.contain,
                      )),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.green,
                        radius: 43,
                        child: CachedNetworkImage(
                          imageUrl: sessionLoginData?.data?.user?.image?.toString() ?? '',
                          progressIndicatorBuilder: (context, url, downloadProgress) =>
                              CircularProgressIndicator(value: downloadProgress.progress),
                          errorWidget: (context, url, error) => Icon(Icons.error),
                        ),
                      ),
                      sizeVer(16),
                      if (sessionLoginData != null)
                        Text(
                          '${sessionLoginData?.data?.user?.firstName?.toString()} '
                          '${sessionLoginData?.data?.user?.lastName?.toString()}',
                          style:
                              getTextStyle(24, FontWeight.w600, Colors.white),
                        ),
                      Text(
                        sessionLoginData?.data?.user?.email?.toString() ??
                            'n/a',
                        style: getTextStyle(16, FontWeight.w400, Colors.white),
                      ),
                      Text(
                        sessionLoginData?.data?.user?.phoneno?.toString() ??
                            'n/a',
                        style: getTextStyle(16, FontWeight.w400, Colors.white),
                      ),
                      sizeVer(16),
                      InkWell(
                        onTap: (){
                          Get.toNamed(AppRoutes.editProfileScreen);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(5))),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Edit Profile',
                              textAlign: TextAlign.center,
                              style: getTextStyle(
                                  16, FontWeight.w400, ColorManager.brandColor),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              ///General
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 16),
                  child: Container(
                    decoration: BoxDecoration(
                        color: currentTheme.getCurrentTheme() == ThemeMode.dark
                            ? ColorManager.darkModeCard
                            : Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'General',
                              style: getTextStyle(
                                  16, FontWeight.w400, ColorManager.grayLight),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12.0, vertical: 0),
                            child: Container(
                              color: ColorManager.grey4,
                              height: 1,
                            ),
                          ),
                          ListTile(
                            onTap: (){
                              Get.toNamed(AppRoutes.changePassword);
                            },
                            leading: Icon(
                              PhosphorIcons.password,
                              color: ColorManager.brandColor,
                            ),
                            trailing: Icon(
                              Icons.chevron_right,
                              color: ColorManager.deepBlack,
                            ),
                            title: Text(
                              'Change Password',
                              style: getTextStyle(
                                  16, FontWeight.w400, ColorManager.grayLight),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              ///Preference
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 16),
                  child: Container(
                    decoration: BoxDecoration(
                        color: currentTheme.getCurrentTheme() == ThemeMode.dark
                            ? ColorManager.darkModeCard
                            : Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Preference',
                              style: getTextStyle(
                                  16, FontWeight.w400, ColorManager.grayLight),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12.0, vertical: 0),
                            child: Container(
                              color: ColorManager.grey4,
                              height: 1,
                            ),
                          ),
                          ListTile(
                            leading: Icon(
                              PhosphorIcons.bell,
                              color: ColorManager.brandColor,
                            ),
                            trailing: (controller.isAlertOn.value == false)
                                ? Icon(
                                    Icons.toggle_off_outlined,
                                    color: ColorManager.grayLight,
                                  )
                                : Icon(
                                    Icons.toggle_on_outlined,
                                    color: ColorManager.brandColor,
                                  ),
                            title: Text(
                              'Examination Alert',
                              style: getTextStyle(
                                  16, FontWeight.w400, ColorManager.grayLight),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12.0, vertical: 0),
                            child: Container(
                              color: ColorManager.grey4,
                              height: 1,
                            ),
                          ),
                          Obx(() {
                              return InkWell(
                                onTap: () {
                                  controller.changeTheme();
                                },
                                child: ListTile(
                                  leading: Icon(
                                    PhosphorIcons.moon,
                                    color: ColorManager.brandColor,
                                  ),
                                  trailing: (currentTheme.themeValue == false)
                                      ? Icon(
                                    Icons.toggle_off_outlined,
                                    color: ColorManager.grayLight,
                                  )
                                      : Icon(
                                    Icons.toggle_on_outlined,
                                    color: ColorManager.brandColor,
                                  ),
                                  title: Text(
                                    'Dark',
                                    style: getTextStyle(16, FontWeight.w400,
                                        ColorManager.grayLight),
                                  ),
                                ),
                              );
                            }
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                  child: Container(
                    decoration: BoxDecoration(
                        color: currentTheme.getCurrentTheme() == ThemeMode.dark
                            ? ColorManager.darkModeCard
                            : Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 8),
                      child: ListTile(
                        onTap: (){
                          Get.toNamed(AppRoutes.supportList);
                        },
                        leading: Icon(
                          PhosphorIcons.phone_call,
                          color: ColorManager.brandColor,
                        ),
                        title: Text(
                          'Support',
                          style: getTextStyle(
                              16, FontWeight.w400, ColorManager.grayLight),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                  child: Container(
                    decoration: BoxDecoration(
                        color: currentTheme.getCurrentTheme() == ThemeMode.dark
                            ? ColorManager.darkModeCard
                            : Colors.white,
                        borderRadius: const BorderRadius.all(Radius.circular(5))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 8),
                      child: ListTile(
                        onTap: () {
                          controller.logoutUser();
                        },
                        leading: Icon(
                          PhosphorIcons.sign_out,
                          color: ColorManager.brandColor,
                        ),
                        title: Text(
                          'Sign Out',
                          style: getTextStyle(
                              16, FontWeight.w400, ColorManager.grayLight),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
