import 'package:currency_symbols/currency_symbols.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'colors.dart';

const timeOutDuration = 30;

Widget sizeVer(double height) {
  return SizedBox(height: height,);
}

Widget sizeHor(double width) {
  return SizedBox(width: width);
}

String getCurrency(){
  return cSymbol("NGN",);
}

class PaddingConstant{
  static const  v12h16symmetricPadding = EdgeInsets.symmetric(vertical: 12,horizontal: 16);
  static const  h16Padding = EdgeInsets.symmetric(vertical: 0,horizontal: 16);
  static const  h12Padding = EdgeInsets.symmetric(vertical: 0,horizontal: 12);

}

class ScreenRouteConst {

  static const String searchScreen = "searchScreen";
  static const String filterScreen = "filterScreen";
  static const String productFilterScreen = "productFilterScreen";

  static const String viewProfile = "viewProfile";

  static const String editProfileScreen = "editProfileScreen";
  static const String updatePostScreen = "updatePostScreen";
  static const String commentScreen = "commentScreen";
  static const String signInScreen = "signInScreen";
  static const String signUpScreen = "signUpScreen";
  static const String forgotPasswordScreen = "forgotPasswordScreen";
  static const String changePasswordScreen = "changePasswordScreen";
  static const String deliveryLocationScreen = "deliveryLocationScreen";
  static const String splashScreen = "splashScreen";

  //Browse Menu
  static const String browseMenu = "browseMenu";

  //Brands
  static const String brands = "brands";
  static const String foodDetails = "foodDetails";

  static const String cartScreen = "cartScreen";
  static const String checkoutScreen = "checkoutScreen";
  static const String offersScreen = "offersScreen";

  ///orders
  static const String orderScreen = 'orderScreen';



  //Explore More
  static const String careScreen = "careScreen";
  static const String visionScreen = "visionScreen";
  static const String blogsScreen = "blogsScreen";
  static const String mediaScreen = "mediaScreen";
  static const String loyaltyScreen = "loyaltyScreen";
  static const String cateringScreen = "cateringScreen";
  static const String dineInScreen = "dineInScreen";
  static const String safetyStandardScreen = "safetyStandardScreen";




}

class AssetConstant {

  static const String splashIcon = "assets/icons/splash-icon.svg";
  static const String splashImage = "assets/images/splash.jpg";
  static const String splashImagePng = "assets/icons/white_logo.png";

  static const String slider1 = "assets/images/onbording_sliders/slider1.png";
  static const String slider2 = "assets/images/onbording_sliders/slider2.png";
  static const String slider3 = "assets/images/onbording_sliders/slider3.png";


  ///home
  static const String examIcon = "assets/icons/home/Exam.svg";
  static const String studentIcon = "assets/icons/home/Student.svg";
  static const String examBack = "assets/icons/home/Exam Card Abstract shape.svg";
  static const String reportIcon = "assets/icons/home/report.svg";
  static const String shareIcon = "assets/icons/home/Share.svg";
  static const String subscribeTeacherIcon = "assets/icons/home/ChalkboardTeacher.svg";

  static const String deleteIcon = "assets/icons/delete.svg";
  static const String circleIcon = "assets/icons/circle.png";
  static const String profileBackgroundImage = "assets/images/Profile.png";


  ///create exam
  static const String stepperSelectStudentsIcon = "assets/icons/stepper-select-students.svg";
  static const String threeCircleIcon = "assets/icons/three-circle.png";
  static const String stepperSelectCourseIcon = "assets/icons/stepper-select-course.svg";
  static const String stepperSelectTopicIcon = "assets/icons/stepper-select-topic.svg";
  static const String stepperSelectQuestionIcon = "assets/icons/stepper-select-question.svg";

}



class VariableConstant {
  static const String currentLocationString = 'Select your location';
  static const String bannerImageLink = "https://images.deliveryhero.io/image/fd-bd/LH/xylf-hero.jpg?width=1600&height=400&quality=45";
  static const String shopImageLink = "https://images.deliveryhero.io/image/fd-bd/LH/w6ni-hero.jpg?width=1600&height=400&quality=45";
  static const String foodImageLink = "https://images.deliveryhero.io/image/fd-bd/Products/4243817.jpg?width=1200";
  static const String offerImageLink = "https://images.deliveryhero.io/image/fd-bd/Products/4243817.jpg?width=1200";


}

class MessageConstant{
  static const String unverifiedUserMessage = 'You need to sign in before doing this !';
  static const String addressChangeMessage = 'Are you sure you want to change this location? Cart will refresh and may be empty if you change the area or type.';
  static const String formEmptyMessage = 'Please input all field';
  static const String unmatchedPasswordMessage = 'Password doesn\'t match';
  static const String errorMessage = 'Something went wrong!';
  static const noInternetMessage = "No Internet Available!";

  static const String loginSuccessful = "Login Success!";
  static const String agreeTerm = "You need agree to the terms and condition!";
  static const String fieldEmptyMessage = 'Please write something';
  static const String noDataMessage = 'No Data Found';


}


class KeyConstant{
  static const String accessToken = 'accessToken';
  static const String savedUser = 'savedUser';

}

void toast(String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: ColorManager.brandColor,
      textColor: Colors.white,
      fontSize: 16.0);
}
