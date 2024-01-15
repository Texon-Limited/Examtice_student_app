import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../resources/AppConfigs.dart';
import '../resources/RoundButtonWidget.dart';
import '../resources/colors.dart';
import '../resources/constants.dart';
import '../resources/styles.dart';

class AffiliateScreen extends StatefulWidget {
  const AffiliateScreen({Key? key}) : super(key: key);

  @override
  State<AffiliateScreen> createState() => _AffiliateSceenState();
}

class _AffiliateSceenState extends State<AffiliateScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: currentTheme.getCurrentTheme() == ThemeMode.dark
          ? Colors.black
          : ColorManager.uiBackgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(300), // Set this height
        child: AppBar(
          centerTitle: true,
          elevation: 0,
          title: Text(
            'Affiliate',
            style: getTextStyle(16, FontWeight.w600, Colors.white),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(AssetConstant.threeCircleIcon)),
              // gradient: LinearGradient(colors: [
              //   HexColor.fromHex("#F0478C"),
              //   HexColor.fromHex("#CC0B5A"),
              // ]),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 60,
                ),
                Text(
                  'Refer Friend & Earn Money',
                  style: getTextStyle(20, FontWeight.w600, Colors.white),
                ),
                SvgPicture.asset('assets/icons/undraw_referral_re_0aji 1.svg'),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Text(
                    'Introduce Your Friend To Examtice And You\'ll Be Credited 20% To Your Account',
                    style: getTextStyle(14, FontWeight.normal, Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: InkWell(
        onTap: () {},
        child: Container(
          // height: 88,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: RoundButtonWidget(
              loading: false,
              title: 'Quick Withdraw',
              width: Get.width,
              height: 48,
              onPress: () {},
              textColor: Colors.white,
              buttonColor: ColorManager.brandColor,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              ListTile(
                leading: Icon(FeatherIcons.creditCard),
                title: Text(
                  'This Month Profit',style: TextStyle(fontSize: 16),
                  // style: getTextStyle(16, FontWeight.w600, Colors.white),
                ),
                trailing: Text(
                  '${getCurrency()} 250',
                  // style: getTextStyle(14, FontWeight.w600, Colors.white),
                ),
              ),
              ListTile(
                leading: Icon(Icons.wallet),
                title: Text(
                  'Total Balance',style: TextStyle(fontSize: 16),
                  // style: getTextStyle(16, FontWeight.w600, Colors.white),
                ),
                trailing: Text(
                  '${getCurrency()} 975',
                  // style: getTextStyle(14, FontWeight.w600, Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
