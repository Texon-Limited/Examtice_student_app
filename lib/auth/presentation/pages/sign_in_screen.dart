import 'package:examtice_teacher/auth/presentation/pages/forgot_password_screen.dart';
import 'package:examtice_teacher/auth/presentation/pages/landing_screen.dart';
import 'package:examtice_teacher/auth/presentation/pages/sign_up_screen.dart';
import 'package:examtice_teacher/auth/view_models/sign_in_vm.dart';
import 'package:examtice_teacher/resources/validators.dart';
import 'package:examtice_teacher/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../resources/AppConfigs.dart';
import '../../../resources/colors.dart';
import '../../../resources/constants.dart';
import '../../../resources/styles.dart';
import '../../../resources/utis.dart';
import '../widgets/search_field_widget.dart';

class SignInScreen extends GetView<SignInViewModel> {
  const SignInScreen({Key? key}) : super(key: key);
//
//   @override
//   State<SignInScreen> createState() => _SignInScreenState();
// }
//
// class _SignInScreenState extends State<SignInScreen> {
//
//
//   @override
//   void initState() {
//     super.initState();
//   }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignInViewModel());

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            CustomScrollView(slivers: [
              SliverList(
                delegate: SliverChildListDelegate([
                  Obx(() {
                    return Form(
                      key: controller.formKey,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: buildColumn(controller),
                      ),
                    );
                  }),
                ]),
              ),
            ]),
          ],
        ),
      ),
    );
  }

  Column buildColumn(SignInViewModel controller) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        sizeVer(140),
        Text("Welcome Back",
            style: getTextStyle(
                24,
                FontWeight.w700,
                currentTheme.getCurrentTheme() == ThemeMode.dark
                    ? Colors.white
                    : ColorManager.deepBlack)),
        Text("Sign in to Continue",
            style: getTextStyle(14, FontWeight.w400, ColorManager.grayLight)),
        sizeVer(40),
        buildEmailWidget(controller),
        sizeVer(16),
        buildPasswordWidget(controller),
        sizeVer(16),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
              onTap: () {
                Get.to(const ForgotPasswordScreen());

                // Navigator.pushReplacement(
                //     context,
                //     MaterialPageRoute(
                //       fullscreenDialog: true,
                //       builder: (context) =>
                //           const ForgotPasswordScreen(), //const LandingScreen(),
                //     ));
              },
              child: Text("Forgot Password",
                  style: getTextStyle(
                      14, FontWeight.w400, ColorManager.blueTextColor)),
            ),
          ],
        ),
        sizeVer(40),
        Obx(
          () => (controller.loading.value == true)
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : buildSignInContainer(controller),
        ),
        buildSignUpContainer(),
        sizeVer(40),
      ],
    );
  }

  Row buildSignUpContainer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("Don’t have an account ? ",
            style: getTextStyle(14, FontWeight.w400, ColorManager.grayLight)),
        InkWell(
          onTap: () {
            Get.toNamed(AppRoutes.signUpScreen);
          },
          child: Text("Sign Up",
              style:
                  getTextStyle(14, FontWeight.w600, ColorManager.brandColor)),
        ),
      ],
    );
  }

  Container buildSignInContainer(SignInViewModel controller) {
    return Container(
      height: 52,
      margin: const EdgeInsets.all(40),
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorManager.brandColor,
        borderRadius: const BorderRadius.all(Radius.circular(4)),
      ),
      child: TextButton(
        child: Text(
          "Sign In",
          style: getTextStyle(16, FontWeight.w600, Colors.white),
        ),

        onPressed: () {
          final isValid = controller.formKey.currentState!.validate();
          Get.focusScope!.unfocus();

          if (isValid) {
            controller.loginAPI();
          } else {
            Utils.toastMessage(MessageConstant.formEmptyMessage);
          }

          // Navigator.pushReplacement(
          //     context,
          //     MaterialPageRoute(
          //       fullscreenDialog: true,
          //       builder: (context) =>
          //           const LandingScreen(), //const LandingScreen(),
          //     ));
        },
        // textColor: Colors.white,
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(25),
        // ),
      ),
    );
  }

  SearchWidget buildPasswordWidget(SignInViewModel controller) {
    return SearchWidget(
      controller: controller.passwordController.value,
      obscureText: controller.isPasswordVisible.value == false ? true : false,
      prefixIcon: Icon(
        FeatherIcons.key,
        color: currentTheme.getCurrentTheme() == ThemeMode.dark
            ? Colors.white70
            : ColorManager.deepBlack,
      ),
      suffixIcon: IconButton(
        onPressed: () {
          controller.isPasswordVisible.value =
              !controller.isPasswordVisible.value;
        },
        icon: controller.isPasswordVisible.value == false
            ? Icon(
                FeatherIcons.eyeOff,
                color: currentTheme.getCurrentTheme() == ThemeMode.dark
                    ? Colors.white70
                    : ColorManager.deepBlack,
              )
            : Icon(
                FeatherIcons.eye,
                color: currentTheme.getCurrentTheme() == ThemeMode.dark
                    ? Colors.white70
                    : ColorManager.deepBlack,
              ),
      ),
      border: Border.all(color: ColorManager.grayBorder),
      backgroundColor: currentTheme.getCurrentTheme() == ThemeMode.dark
          ? ColorManager.darkModeCard
          : Colors.white,
      isEnabled: true,
      hintText: 'password',
      validator: (value) => MyCustomValidator.validateMultiLine(value),
    );
  }

  SearchWidget buildEmailWidget(SignInViewModel controller) {
    return SearchWidget(
      controller: controller.emailController.value,
      prefixIcon: Icon(
        FeatherIcons.send,
        color: currentTheme.getCurrentTheme() == ThemeMode.dark
            ? Colors.white70
            : ColorManager.deepBlack,
      ),
      border: Border.all(color: ColorManager.grayBorder),
      backgroundColor: currentTheme.getCurrentTheme() == ThemeMode.dark
          ? ColorManager.darkModeCard
          : Colors.white,
      isEnabled: true,
      hintText: 'email',
      validator: (value) => MyCustomValidator.validateEmail(value),
    );
  }
}
