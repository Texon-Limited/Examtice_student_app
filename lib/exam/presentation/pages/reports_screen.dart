import 'package:examtice_teacher/auth/presentation/widgets/search_field_widget.dart';
import 'package:examtice_teacher/exam/view_models/exam_screen_vm.dart';
import 'package:examtice_teacher/exam/view_models/reports_vm.dart';
import 'package:examtice_teacher/resources/styles.dart';
import 'package:examtice_teacher/resources/validators.dart';
import 'package:examtice_teacher/routes/app_pages.dart';
import 'package:examtice_teacher/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../home/presentation/widgets/left_menu_drawer.dart';
import '../../../resources/AppConfigs.dart';
import '../../../resources/RoundButtonWidget.dart';
import '../../../resources/api_status.dart';
import '../../../resources/colors.dart';
import '../../../resources/constants.dart';

class ReportsScreen extends GetView<ReportsViewModel> {
  ReportsScreen({Key? key}) : super(key: key);

//   @override
//   State<ExamScreen> createState() => _ExamScreenState();
// }
//
// class _ExamScreenState extends State<ExamScreen> {

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ReportsViewModel());

    return SafeArea(
      child: Scaffold(
        backgroundColor: currentTheme.getCurrentTheme() == ThemeMode.dark
            ? Colors.black
            : ColorManager.uiBackgroundColor,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(44), // Set this height

          child: AppBar(
            centerTitle: true,backgroundColor: ColorManager.brandColor,
            title: Text(
              'Reports',
              style: getTextStyle(16, FontWeight.w600, Colors.white),
            ),
      //       flexibleSpace: Container(
      //           decoration: BoxDecoration(
      //             gradient: LinearGradient(colors: [
      //               HexColor.fromHex("#F0478C"),
      //               HexColor.fromHex("#CC0B5A"),
      //             ]),
      //           ),
      //           child: Padding(
      //       padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
      //       child: Column(
      //         mainAxisAlignment: MainAxisAlignment.start,
      //         crossAxisAlignment: CrossAxisAlignment.center,
      //         children: [
      //           sizeVer(50),
      //
      //           RichText(
      //             text: TextSpan(
      //               style: getTextStyle(16, FontWeight.w400, Colors.white),
      //               children: [
      //                 const TextSpan(
      //                   text: 'Test Taken - ',
      //                 ),
      //                 TextSpan(
      //                   text: '240',
      //                   style:
      //                   getTextStyle(14, FontWeight.w400, Colors.white),
      //                 ),
      //               ],
      //             ),
      //           ),
      //           RichText(
      //             text: TextSpan(
      //               style: getTextStyle(16, FontWeight.w400, Colors.white),
      //               children: [
      //                 const TextSpan(
      //                   text: 'Questions Seen - ',
      //                 ),
      //                 TextSpan(
      //                   text: '3713',
      //                   style:
      //                   getTextStyle(14, FontWeight.w400, Colors.white),
      //                 ),
      //               ],
      //             ),
      //           ),
      //
      //           RichText(
      //             text: TextSpan(
      //               style: getTextStyle(16, FontWeight.w400, Colors.white),
      //               children: [
      //                 const TextSpan(
      //                   text: 'Time Spent - ',
      //                 ),
      //                 TextSpan(
      //                   text: '57:48:36',
      //                   style:
      //                   getTextStyle(14, FontWeight.w400, Colors.white),
      //                 ),
      //               ],
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      // ),
            iconTheme: IconThemeData(
              color: currentTheme.getCurrentTheme() == ThemeMode.dark
                  ? ColorManager.uiBackgroundColor
                  : Colors.black,
            ),
            // actions: [
            //   Padding(
            //     padding: const EdgeInsets.symmetric(horizontal: 0.0),
            //     child: InkWell(
            //         onTap: () {}, child: const Icon(FeatherIcons.barChart)),
            //   ),
            //   Padding(
            //     padding: const EdgeInsets.symmetric(horizontal: 24.0),
            //     child: InkWell(
            //       onTap: () {
            //         Get.toNamed(AppRoutes.notificationScreen);
            //       },
            //       child: Icon(
            //         FeatherIcons.bell,
            //         color: currentTheme.getCurrentTheme() == ThemeMode.dark
            //             ? Colors.white
            //             : ColorManager.deepBlack,
            //       ),
            //     ),
            //   ),
            // ],

          ),
        ),
        // drawer: const LeftMenuDrawer(),

        body: Stack(
          children: [
            CustomScrollView(slivers: [
              if(controller.listDetails.isBlank == false)buildSearchSection(controller),
              buildExamListSection(controller),
            ]),
          ],
        ),
      ),
    );
  }

  Obx buildExamListSection(ReportsViewModel controller) {
    return Obx(() {
      switch (controller.rxRequestStatus.value) {
        case ApiStatus.loading:
          return const SliverToBoxAdapter(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        case ApiStatus.error:
          return const SliverToBoxAdapter(
            child: Center(
              child: Text(MessageConstant.errorMessage),
            ),
          );

        case ApiStatus.completed:
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: controller.allSubscriptionItemList.length,
                  (context, index) => InkWell(
                  onTap: () {
                    print('on tapp called');
                    controller.setSelectedReport(controller.allSubscriptionItemList[index]);
                    // Get.toNamed(AppRoutes.examDetails);
                  }, child: buildExamListItem(controller, index)),
            ),
          );
      }
    });
  }

  Widget buildExamListItem(ReportsViewModel controller, int index) {


    var tmp = DateTime.parse(controller.allSubscriptionItemList[index].createdAt.toString());
    var data = controller.allSubscriptionItemList[index];

    var dateString = DateFormat.yMMMMd().format(tmp);

    var totalCorrectOption = controller.allSubscriptionItemList[index].totaCorrectOption ?? 0;
    print('totalCorrectOption $totalCorrectOption');

    var totalQuestions = controller.allSubscriptionItemList[index].totalQuestions ?? "0";
    print('totalQuestions $totalQuestions');

    var percentage = (totalCorrectOption/ int.parse(totalQuestions)) * 100 ;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            color: currentTheme.getCurrentTheme() == ThemeMode.dark
                ? ColorManager.darkModeCard
                : Colors.white),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              RichText(
                text: TextSpan(
                  style: getTextStyle(
                      14, FontWeight.w400, ColorManager.grayLight),
                  children: [
                    const TextSpan(
                      text: 'Date - ',
                    ),
                    TextSpan(
                      text: dateString,
                      style: getTextStyle(
                          14,
                          FontWeight.w400,
                          currentTheme.getCurrentTheme() ==
                              ThemeMode.dark
                              ? Colors.white70
                              : ColorManager.deepBlack),
                    ),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  style: getTextStyle(
                      14, FontWeight.w400, ColorManager.grayLight),
                  children: [
                    const TextSpan(
                      text: 'Time Spent - ',
                    ),
                    TextSpan(
                      text: data.timeSpent.toString(),
                      style: getTextStyle(
                          14,
                          FontWeight.w400,
                          currentTheme.getCurrentTheme() ==
                              ThemeMode.dark
                              ? Colors.white70
                              : ColorManager.deepBlack),
                    ),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  style: getTextStyle(
                      14, FontWeight.w400, ColorManager.grayLight),
                  children: [
                    const TextSpan(
                      text: 'Score - ',
                    ),
                    TextSpan(
                      text: '${percentage.toStringAsFixed(0)}%',
                      style: getTextStyle(
                          14,
                          FontWeight.w400,
                          currentTheme.getCurrentTheme() ==
                              ThemeMode.dark
                              ? Colors.white70
                              : ColorManager.deepBlack),
                    ),
                  ],
                ),
              ),

              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RoundButtonWidget(
                    loading: false,
                    title: 'View',
                    width: Get.width / 2.5,
                    height: 30,
                    onPress: () {
                      // controller.getToTestDetailsScreen();
                    },
                    textColor: Colors.white,
                    buttonColor: ColorManager.brandColor,
                  ),
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }

  SliverToBoxAdapter buildSearchSection(ReportsViewModel controller) {

    if(controller.listDetails.value.data == null){
      return const SliverToBoxAdapter(
        child: SizedBox(),
      );
    }else{

      var data = controller.listDetails.value.data! ;
      return SliverToBoxAdapter(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              HexColor.fromHex("#F0478C"),
              HexColor.fromHex("#CC0B5A"),
            ]),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                sizeVer(50),

                RichText(
                  text: TextSpan(
                    style: getTextStyle(16, FontWeight.w400, Colors.white),
                    children: [
                      const TextSpan(
                        text: 'Test Taken - ',
                      ),
                      TextSpan(
                        text: controller.listDetails.value.data!.userReport?.length.toString(),
                        style:
                        getTextStyle(14, FontWeight.w400, Colors.white),
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    style: getTextStyle(16, FontWeight.w400, Colors.white),
                    children: [
                      const TextSpan(
                        text: 'Questions Seen - ',
                      ),
                      TextSpan(
                        text: data!.totalQues.toString(),
                        style:
                        getTextStyle(14, FontWeight.w400, Colors.white),
                      ),
                    ],
                  ),
                ),

                RichText(
                  text: TextSpan(
                    style: getTextStyle(16, FontWeight.w400, Colors.white),
                    children: [
                      const TextSpan(
                        text: 'Time Spent - ',
                      ),
                      TextSpan(
                        text: data.totalTime.toString(),
                        style:
                        getTextStyle(14, FontWeight.w400, Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ) ,
          ),
        ),
      );

    }

  }
}
