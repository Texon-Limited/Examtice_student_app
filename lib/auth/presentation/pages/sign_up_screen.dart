import 'package:examtice_teacher/auth/presentation/pages/sign_in_screen.dart';
import 'package:examtice_teacher/auth/view_models/sign_up_vm.dart';
import 'package:examtice_teacher/resources/styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:unicons/unicons.dart';

import '../../../resources/AppConfigs.dart';
import '../../../resources/colors.dart';
import '../../../resources/constants.dart';
import '../../../resources/utis.dart';
import '../../../resources/validators.dart';
import '../widgets/search_field_widget.dart';

class SignUpScreen extends GetView<SignUpViewModel> {
//   const SignUpScreen({Key? key}) : super(key: key);
//
//   @override
//   State<SignUpScreen> createState() => _SignUpScreenState();
// }
//
// class _SignUpScreenState extends State<SignUpScreen> {
//   var _formKey = new GlobalKey<FormState>();
//
//   TextEditingController _fnameController = TextEditingController();
//   TextEditingController _lnameController = TextEditingController();
//
//   TextEditingController _phoneController = TextEditingController();
//   bool isPasswordVisible = false;
//
//   TextEditingController _confirmPasswordController = TextEditingController();
//   bool isConfirmPasswordVisible = false;
//
//   bool agreedToTerms = false;
//
//   @override
//   void initState() {
//     super.initState();
//   }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpViewModel());

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            CustomScrollView(slivers: [
              SliverList(
                delegate: SliverChildListDelegate([
                  Form(
                    key: controller.formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          sizeVer(140),
                          Text("Create New Account",
                              style: getTextStyle(
                                  24,
                                  FontWeight.w700,
                                  currentTheme.getCurrentTheme() ==
                                          ThemeMode.dark
                                      ? Colors.white
                                      : ColorManager.deepBlack)),
                          Text(
                              "Enter the email associated with your account to change your password.",
                              style: getTextStyle(
                                  14, FontWeight.w400, ColorManager.grayLight)),
                          sizeVer(40),
                          buildFirstName(controller),
                          sizeVer(16),
                          buildLastName(controller),
                          sizeVer(16),
                          buildEmail(controller),
                          sizeVer(16),
                          buildPhoneNumber(controller),
                          sizeVer(16),
                          buildPassword(controller),
                          sizeVer(16),
                          buildConfirmPassword(controller),
                          sizeVer(16),
                          buildReferCode(controller),
                          sizeVer(16),
                          buildTermsCondition(controller),
                          sizeVer(40),
                          buildSignUpButton(controller),
                          buildAlreadyLoggedInSection(context),
                          sizeVer(40),
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
            ]),
          ],
        ),
      ),
    );
  }

  Row buildAlreadyLoggedInSection(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("Already have an account? ",
            style: getTextStyle(14, FontWeight.w400, ColorManager.grayLight)),
        InkWell(
          onTap: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  fullscreenDialog: true,
                  builder: (context) =>
                      const SignInScreen(), //const LandingScreen(),
                ));
          },
          child: Text("Sign In",
              style:
                  getTextStyle(14, FontWeight.w600, ColorManager.brandColor)),
        ),
      ],
    );
  }

  Obx buildSignUpButton(SignUpViewModel controller) {
    return Obx(() => (controller.loading.value == true)
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Container(
            height: 52,
            margin: EdgeInsets.all(40),
            width: double.infinity,
            decoration: BoxDecoration(
              color: ColorManager.brandColor,
              borderRadius: BorderRadius.all(Radius.circular(4)),
            ),
            child: TextButton(
              child: Text(
                "Sign Up",
                style: getTextStyle(16, FontWeight.w600, Colors.white),
              ),
              onPressed: () {
                final isValid = controller.formKey.currentState!.validate();
                Get.focusScope!.unfocus();

                if (isValid) {
                  if (controller.agreedToTerms.value == true) {
                    controller.signUpAPI();
                  } else {
                    Utils.snackBar(
                        'Validation Error', MessageConstant.agreeTerm);
                  }
                } else {
                  Utils.snackBar(
                      'Validation Error', MessageConstant.formEmptyMessage);
                }

                // Navigator.pushReplacement(
                //     context,
                //     MaterialPageRoute(
                //       fullscreenDialog: true,
                //       builder: (context) =>
                //       const SignUpScreen(), //const LandingScreen(),
                //     ));
              },
              // textColor: Colors.white,
              // shape: RoundedRectangleBorder(
              //   borderRadius: BorderRadius.circular(25),
              // ),
            ),
          ));
  }

  Row buildTermsCondition(SignUpViewModel controller) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Obx(() {
          return IconButton(
            onPressed: () {
              controller.agreedToTerms.value = !controller.agreedToTerms.value;
            },
            icon: controller.agreedToTerms.value == false
                ? const Icon(FeatherIcons.square)
                : const Icon(FeatherIcons.checkSquare),
            padding: EdgeInsets.zero,
            alignment: Alignment.centerLeft,
          );
        }),
        RichText(
          text: TextSpan(
            style: getTextStyle(
                14,
                FontWeight.w400,
                currentTheme.getCurrentTheme() == ThemeMode.dark
                    ? Colors.white
                    : ColorManager.deepBlack),
            children: [
              TextSpan(
                text: 'I agree to the ',
              ),
              TextSpan(
                text: 'Examtice ',
                style: TextStyle(color: ColorManager.brandColor),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    // setState(() {
                    //   // mode = mode == AuthMode.login
                    //   //     ? AuthMode.register
                    //   //     : AuthMode.login;
                    // });
                  },
              ),
              TextSpan(text: 'Terms & Condition')
            ],
          ),
        ),
      ],
    );
  }

  SearchWidget buildReferCode(SignUpViewModel controller) {
    return SearchWidget(
      controller: controller.referCodeController.value,
      prefixIcon: Icon(
        FeatherIcons.phone,
        color: currentTheme.getCurrentTheme() == ThemeMode.dark
            ? Colors.white70
            : ColorManager.deepBlack,
      ),
      border: Border.all(color: ColorManager.grayBorder),
      backgroundColor: currentTheme.getCurrentTheme() == ThemeMode.dark
          ? ColorManager.darkModeCard
          : Colors.white,
      isEnabled: true,
      hintText: 'Refer code',
    );
  }

  Obx buildConfirmPassword(SignUpViewModel controller) {
    return Obx(() {
      return SearchWidget(
        controller: controller.confirmPasswordController.value,
        obscureText:
            controller.isConfirmPasswordVisible.value == false ? true : false,
        prefixIcon: Icon(
          FeatherIcons.key,
          color: currentTheme.getCurrentTheme() == ThemeMode.dark
              ? Colors.white70
              : ColorManager.deepBlack,
        ),
        suffixIcon: IconButton(
          onPressed: () {
            controller.isConfirmPasswordVisible.value =
                !controller.isConfirmPasswordVisible.value;
          },
          icon: controller.isConfirmPasswordVisible.value == false
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
        hintText: 'confirm password',
        validator: (value) => MyCustomValidator.validateMultiLine(value),
      );
    });
  }

  Obx buildPassword(SignUpViewModel controller) {
    return Obx(() {
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
        validator: (value) => MyCustomValidator.passwordValidation(value),
      );
    });
  }

  SearchWidget buildPhoneNumber(SignUpViewModel controller) {
    return SearchWidget(
      controller: controller.phoneController.value,
      prefixIcon: Icon(
        FeatherIcons.phone,
        color: currentTheme.getCurrentTheme() == ThemeMode.dark
            ? Colors.white70
            : ColorManager.deepBlack,
      ),
      border: Border.all(color: ColorManager.grayBorder),
      backgroundColor: currentTheme.getCurrentTheme() == ThemeMode.dark
          ? ColorManager.darkModeCard
          : Colors.white,
      isEnabled: true,
      hintText: 'phone number',
      validator: (value) => MyCustomValidator.phoneNumberValidation(value),
    );
  }

  SearchWidget buildEmail(SignUpViewModel controller) {
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

  SearchWidget buildLastName(SignUpViewModel controller) {
    return SearchWidget(
      controller: controller.lnameController.value,
      prefixIcon: Icon(
        FeatherIcons.user,
        color: currentTheme.getCurrentTheme() == ThemeMode.dark
            ? Colors.white70
            : ColorManager.deepBlack,
      ),
      border: Border.all(color: ColorManager.grayBorder),
      backgroundColor: currentTheme.getCurrentTheme() == ThemeMode.dark
          ? ColorManager.darkModeCard
          : Colors.white,
      isEnabled: true,
      hintText: 'last name',
      validator: (value) => MyCustomValidator.validateMultiLine(value),
    );
  }

  SearchWidget buildFirstName(SignUpViewModel controller) {
    return SearchWidget(
      controller: controller.fnameController.value,
      prefixIcon: Icon(
        FeatherIcons.user,
        color: currentTheme.getCurrentTheme() == ThemeMode.dark
            ? Colors.white70
            : ColorManager.deepBlack,
      ),
      border: Border.all(color: ColorManager.grayBorder),
      backgroundColor: currentTheme.getCurrentTheme() == ThemeMode.dark
          ? ColorManager.darkModeCard
          : Colors.white,
      isEnabled: true,
      hintText: 'first name',
      validator: (value) => MyCustomValidator.validateMultiLine(value),
    );
  }
}
