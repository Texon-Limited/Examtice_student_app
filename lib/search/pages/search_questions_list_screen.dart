import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

import '../../resources/AppConfigs.dart';
import '../../resources/RoundButtonWidget.dart';
import '../../resources/colors.dart';
import '../../resources/constants.dart';
import '../../resources/styles.dart';

class SearchQuestionListScreen extends StatefulWidget {
  const SearchQuestionListScreen({Key? key}) : super(key: key);

  @override
  State<SearchQuestionListScreen> createState() =>
      _SearchQuestionListScreenState();
}

class _SearchQuestionListScreenState extends State<SearchQuestionListScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: currentTheme.getCurrentTheme() == ThemeMode.dark
          ? Colors.black
          : ColorManager.uiBackgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60), // Set this height
        child: AppBar(
          centerTitle: true,
          elevation: 0,
          title: Text(
            'Search Questions',
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
          ),
        ),
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
          Get.back();
        },
        child: Container(
          // height: 88,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: RoundButtonWidget(
              loading: false,
              title: 'Back',
              width: Get.width,
              height: 48,
              onPress: () {
                Get.back();

              },
              textColor: Colors.white,
              buttonColor: ColorManager.brandColor,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
      child: Column(
        children: setUpEshopData(),
      ),
      ),
    ));
  }
  setUpEshopData() {
    List<Widget> children = [];

    for (var index = 0; index < 5; index++) {
      // var tmp =
      //     DateTime.parse(examController.rxList[index].createdAt.toString());
      // var dateString = DateFormat.yMMMMd().format(tmp);

      children.add(Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Container(
              decoration: BoxDecoration(
                color: currentTheme.getCurrentTheme() == ThemeMode.dark
                    ? ColorManager.deepBlack
                    : Colors.white,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(8), bottomLeft: Radius.circular(8)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Course Name: \t  UTME JAMB',
                            style: getTextStyle(
                                16, FontWeight.w600, ColorManager.brandColor),
                          ),
                          Text(
                            'Subject Name: \t ACCOUNTS / PRINCIPLES OF ACCOUNTS',
                            style: getTextStyle(
                                14,
                                FontWeight.w400,
                                currentTheme.getCurrentTheme() == ThemeMode.dark
                                    ? Colors.white54
                                    : ColorManager.deepBlack),
                          ),
                          Text(
                            'Topic Name: \t PRINCIPLES OF DOUBLE ENTY',
                            style: getTextStyle(
                                14,
                                FontWeight.w400,
                                currentTheme.getCurrentTheme() == ThemeMode.dark
                                    ? Colors.white54
                                    : ColorManager.deepBlack),
                          ),
                          sizeVer(16),
                          Html(data: '''Fatima withdraws goods from the business for personal use. The accounting treatment is to debit?'''),
                          sizeVer(16),

                        ],
                      ),
                    ),
                    Icon(FeatherIcons.arrowRight)
                  ],
                ),
              ),
            ),
          ],
        ),
      ));
    }
    return children;
  }

}
