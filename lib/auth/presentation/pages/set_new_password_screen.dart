import 'package:examtice_teacher/auth/presentation/pages/forgot_password_screen.dart';
import 'package:examtice_teacher/auth/presentation/pages/landing_screen.dart';
import 'package:examtice_teacher/auth/presentation/pages/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import '../../../resources/colors.dart';
import '../../../resources/constants.dart';
import '../../../resources/styles.dart';
import '../widgets/search_field_widget.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({Key? key}) : super(key: key);

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  var _formKey = new GlobalKey<FormState>();
  var _emailController = TextEditingController();
  var _emailControllerFocus = FocusNode();
  var _passwordController = TextEditingController();
  var _passwordControllerFocus = FocusNode();
  bool isNewPasswordVisible = false;
  bool isPasswordVisible = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            CustomScrollView(slivers: [
              SliverList(
                delegate: SliverChildListDelegate([
                  Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          sizeVer(140),
                          Text("Set a New Password",
                              style: getTextStyle(
                                  24, FontWeight.w700, ColorManager.deepBlack)),
                          Text(
                              "Your new password must be different from previously used password.",
                              style: getTextStyle(
                                  14, FontWeight.w400, ColorManager.grayLight)),
                          sizeVer(40),


                          SearchWidget(
                            controller: _passwordController,
                            obscureText:
                            isPasswordVisible == false ? true : false,
                            prefixIcon: Icon(
                              FeatherIcons.key,
                              color: ColorManager.deepBlack,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isPasswordVisible = !isPasswordVisible;
                                });
                              },
                              icon: isPasswordVisible == false
                                  ? Icon(
                                FeatherIcons.eyeOff,
                                color: ColorManager.deepBlack,
                              )
                                  : Icon(
                                FeatherIcons.eye,
                                color: ColorManager.deepBlack,
                              ),
                            ),
                            border: Border.all(color: ColorManager.grayBorder),
                            backgroundColor: Colors.white,
                            isEnabled: true,
                            hintText: 'new password',
                          ),

                          sizeVer(16),
                          SearchWidget(
                            controller: _passwordController,
                            obscureText:
                            isNewPasswordVisible == false ? true : false,
                            prefixIcon: Icon(
                              FeatherIcons.key,
                              color: ColorManager.deepBlack,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isNewPasswordVisible = !isNewPasswordVisible;
                                });
                              },
                              icon: isNewPasswordVisible == false
                                  ? Icon(
                                FeatherIcons.eyeOff,
                                color: ColorManager.deepBlack,
                              )
                                  : Icon(
                                FeatherIcons.eye,
                                color: ColorManager.deepBlack,
                              ),
                            ),
                            border: Border.all(color: ColorManager.grayBorder),
                            backgroundColor: Colors.white,
                            isEnabled: true,
                            hintText: 'confirm new password',
                          ),
                          sizeVer(16),

                          Container(
                            height: 52,
                            margin: EdgeInsets.all(40),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: ColorManager.brandColor,
                              borderRadius:
                              BorderRadius.all(Radius.circular(4)),
                            ),
                            child: TextButton(
                              child: Text(
                                "Proceed",
                                style: getTextStyle(
                                    16, FontWeight.w600, Colors.white),
                              ),
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      fullscreenDialog: true,
                                      builder: (context) =>
                                      const LandingScreen(), //const LandingScreen(),
                                    ));
                              },
                              // textColor: Colors.white,
                              // shape: RoundedRectangleBorder(
                              //   borderRadius: BorderRadius.circular(25),
                              // ),
                            ),
                          ),
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
}
