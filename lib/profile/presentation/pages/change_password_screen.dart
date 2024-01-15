import 'package:cached_network_image/cached_network_image.dart';
import 'package:examtice_teacher/main.dart';
import 'package:examtice_teacher/profile/view_models/profile_vm.dart';
import 'package:examtice_teacher/profile/view_models/support_vm.dart';
import 'package:examtice_teacher/resources/AppConfigs.dart';
import 'package:examtice_teacher/resources/constants.dart';
import 'package:examtice_teacher/routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../auth/presentation/widgets/search_field_widget.dart';
import '../../../resources/RoundButtonWidget.dart';
import '../../../resources/colors.dart';
import '../../../resources/styles.dart';
import '../../../resources/utis.dart';
import '../../../resources/validators.dart';
import '../../../splash/presentation/pages/on_bording_screen.dart';

class ChangePasswordScreen extends GetView<ProfileViewModel> {
  ChangePasswordScreen({Key? key}) : super(key: key);
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
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50), // Set this height
            child: AppBar(
              centerTitle: true,
              elevation: 0,
              title: Text(
                'Change Password',
                style: getTextStyle(16, FontWeight.w600, Colors.white),
              ),
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  // image: DecorationImage(
                  //     image: AssetImage(AssetConstant.threeCircleIcon)),
                  gradient: LinearGradient(colors: [
                    HexColor.fromHex("#F0478C"),
                    HexColor.fromHex("#CC0B5A"),
                  ]),
                ),
              ),
            ),
          ),
          body: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate([
                  Obx(() {
                    return Form(
                      key: controller.formKey,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: buildColumn(controller, context),
                      ),
                    );
                  }),
                ]),
              ),
            ],
          )),
    );
  }

  Column buildColumn(ProfileViewModel controller, BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Password",
            style: getTextStyle(
                16,
                FontWeight.w700,
                currentTheme.getCurrentTheme() == ThemeMode.dark
                    ? Colors.white
                    : ColorManager.deepBlack)),
        sizeVer(8),

        Obx(() {
          return SearchWidget(
            controller: controller.passwordController.value,
            obscureText:
            controller.isPasswordVisible.value == false
                ? true
                : false,
            prefixIcon: Icon(
              FeatherIcons.key,
              color: currentTheme.getCurrentTheme() ==
                  ThemeMode.dark
                  ? Colors.white70
                  : ColorManager.deepBlack,
            ),
            suffixIcon: IconButton(
              onPressed: () {
                controller.isPasswordVisible.value =
                !controller.isPasswordVisible.value;
              },
              icon: controller.isPasswordVisible.value ==
                  false
                  ? Icon(
                FeatherIcons.eyeOff,
                color: currentTheme.getCurrentTheme() ==
                    ThemeMode.dark
                    ? Colors.white70
                    : ColorManager.deepBlack,
              )
                  : Icon(
                FeatherIcons.eye,
                color: currentTheme.getCurrentTheme() ==
                    ThemeMode.dark
                    ? Colors.white70
                    : ColorManager.deepBlack,
              ),
            ),
            border:
            Border.all(color: ColorManager.grayBorder),
            backgroundColor: currentTheme.getCurrentTheme() ==
                ThemeMode.dark
                ? ColorManager.darkModeCard
                : Colors.white,
            isEnabled: true,
            hintText: 'password',
            validator: (value) =>
                MyCustomValidator.passwordValidation(value),
          );
        }),
        sizeVer(16),
        Text("Confirm Password",
            style: getTextStyle(
                16,
                FontWeight.w700,
                currentTheme.getCurrentTheme() == ThemeMode.dark
                    ? Colors.white
                    : ColorManager.deepBlack)),
        sizeVer(8),
        Obx(() {
          return SearchWidget(
            controller:
            controller.confirmPasswordController.value,
            obscureText:
            controller.isConfirmPasswordVisible.value ==
                false
                ? true
                : false,
            prefixIcon: Icon(
              FeatherIcons.key,
              color: currentTheme.getCurrentTheme() ==
                  ThemeMode.dark
                  ? Colors.white70
                  : ColorManager.deepBlack,
            ),
            suffixIcon: IconButton(
              onPressed: () {
                controller.isConfirmPasswordVisible.value =
                !controller
                    .isConfirmPasswordVisible.value;
              },
              icon: controller
                  .isConfirmPasswordVisible.value ==
                  false
                  ? Icon(
                FeatherIcons.eyeOff,
                color: currentTheme.getCurrentTheme() ==
                    ThemeMode.dark
                    ? Colors.white70
                    : ColorManager.deepBlack,
              )
                  : Icon(
                FeatherIcons.eye,
                color: currentTheme.getCurrentTheme() ==
                    ThemeMode.dark
                    ? Colors.white70
                    : ColorManager.deepBlack,
              ),
            ),
            border:
            Border.all(color: ColorManager.grayBorder),
            backgroundColor: currentTheme.getCurrentTheme() ==
                ThemeMode.dark
                ? ColorManager.darkModeCard
                : Colors.white,
            isEnabled: true,
            hintText: 'confirm password',
            validator: (value) =>
                MyCustomValidator.validateMultiLine(value),
          );
        }),



        sizeVer(80),
        InkWell(
          onTap: () {
            if (controller.formKey.currentState!.validate()) {
              controller.callUpdateProfileApi();
            } else {
              Utils.toastMessage(MessageConstant.formEmptyMessage);

            }
          },
          child: Container(
            // height: 88,
            decoration: BoxDecoration(
                color: ColorManager.brandColor,
                borderRadius: BorderRadius.circular(8)),
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: RoundButtonWidget(
                loading: false,
                title: 'Update',
                width: Get.width,
                height: 25,
                onPress: () {},
                textColor: Colors.white,
                buttonColor: ColorManager.brandColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
