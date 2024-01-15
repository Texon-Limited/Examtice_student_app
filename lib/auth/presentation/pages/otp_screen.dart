import 'package:examtice_teacher/auth/presentation/pages/set_new_password_screen.dart';
import 'package:examtice_teacher/auth/presentation/pages/sign_in_screen.dart';
import 'package:examtice_teacher/auth/presentation/pages/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';

import '../../../resources/colors.dart';
import '../../../resources/constants.dart';
import '../../../resources/styles.dart';
import '../widgets/search_field_widget.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  var _formKey = new GlobalKey<FormState>();
  var _emailController = TextEditingController();
  var _emailControllerFocus = FocusNode();
  var _passwordController = TextEditingController();
  var _passwordControllerFocus = FocusNode();
  bool isPasswordVisible = false;


  bool _onEditing = false;
  String _code = '';


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
                          Text("Enter Verification Code",
                              style: getTextStyle(
                                  24, FontWeight.w700, ColorManager.deepBlack)),
                          Text(
                              "Enter the 4 digit verification code sent to your given email ",
                              style: getTextStyle(
                                  14, FontWeight.w400, ColorManager.grayLight)),
                          sizeVer(40),

                          Center(
                            child:  VerificationCode(
                              autofocus: true,digitsOnly: true,
                              textStyle: getTextStyle(16, FontWeight.w400, ColorManager.deepBlack),
                              underlineColor: ColorManager.brandColor,
                              keyboardType: TextInputType.number,cursorColor: ColorManager.deepBlack,
                              fullBorder: true,padding: EdgeInsets.all(16),margin: EdgeInsets.all(8),
                              length: 4,
                              // clearAll is NOT required, you can delete it
                              // takes any widget, so you can implement your design
                              // clearAll: Padding(
                              //   padding: const EdgeInsets.all(8.0),
                              //   child: Text(
                              //     'clear all',
                              //     style: TextStyle(
                              //         fontSize: 14.0,
                              //         decoration: TextDecoration.underline,
                              //         color: Colors.blue[700]),
                              //   ),
                              // ),
                              onCompleted: (String value) {
                                setState(() {
                                  _code = value;
                                });
                              },
                              onEditing: (bool value) {
                                setState(() {
                                  _onEditing = value;
                                });
                                if (!_onEditing) FocusScope.of(context).unfocus();
                              },
                            )
                          ),


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
                                "Verify",
                                style: getTextStyle(
                                    16, FontWeight.w600, Colors.white),
                              ),
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      fullscreenDialog: true,
                                      builder: (context) =>
                                      const NewPasswordScreen(), //const LandingScreen(),
                                    ));
                              },
                              // textColor: Colors.white,
                              // shape: RoundedRectangleBorder(
                              //   borderRadius: BorderRadius.circular(25),
                              // ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Code not received?  ",
                                  style: getTextStyle(14, FontWeight.w400,
                                      ColorManager.grayLight)),
                              InkWell(
                                onTap: () {
                                  // Navigator.pushReplacement(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //       fullscreenDialog: true,
                                  //       builder: (context) =>
                                  //       const SignInScreen(), //const LandingScreen(),
                                  //     ));
                                },
                                child: Text("Send again",
                                    style: getTextStyle(14, FontWeight.w600,
                                        ColorManager.blueTextColor)),
                              ),
                            ],
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
