import 'package:cached_network_image/cached_network_image.dart';
import 'package:examtice_teacher/auth/view_models/landing_screen_vm.dart';
import 'package:examtice_teacher/eshop/view_models/eshop_screen_vm.dart';
import 'package:examtice_teacher/home/view_models/home_vm.dart';
import 'package:examtice_teacher/resources/api_status.dart';
import 'package:examtice_teacher/resources/colors.dart';
import 'package:examtice_teacher/resources/constants.dart';
import 'package:examtice_teacher/resources/styles.dart';
import 'package:examtice_teacher/routes/app_routes.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../affiliate/affiliate_screen.dart';
import '../../../exam/presentation/widgets/webview_widget.dart';
import '../../../exam/view_models/exam_screen_vm.dart';
import '../../../resources/AppConfigs.dart';
import '../../../resources/AppUrls.dart';
import '../../../resources/RoundButtonWidget.dart';
import '../../../search/pages/search_questions_screen.dart';
import '../../../subscriptions/pages/subscriptions_screen.dart';
import '../widgets/left_menu_drawer.dart';

class HomeScreen extends GetView<HomeViewModel> {
  const HomeScreen({super.key});

  //   const HomeScreen({Key? key}) : super(key: key);
  //
  //   @override
  //   State<HomeScreen> createState() => _HomeScreenState();
  // }
  //
  // class _HomeScreenState extends State<HomeScreen> {
  //
  //

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeViewModel());
    final examController = Get.put(ExamViewModel());
    final landingController = Get.put(LandingScreenViewModel());
    final eshopController = Get.put(EShopsViewModel());

    return SafeArea(
      key: controller.scaffoldKey,
      child: Scaffold(
        backgroundColor: currentTheme.getCurrentTheme() == ThemeMode.dark
            ? Colors.black
            : ColorManager.uiBackgroundColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          iconTheme: IconThemeData(
            color: currentTheme.getCurrentTheme() == ThemeMode.dark
                ? ColorManager.uiBackgroundColor
                : Colors.black,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0.0),
              child: InkWell(
                  onTap: () {
                    Get.toNamed(AppRoutes.scoreboardScreen);
                  }, child: const Icon(FeatherIcons.barChart)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: InkWell(
                onTap: () {
                  Get.toNamed(AppRoutes.notificationScreen);
                },
                child: Icon(
                  FeatherIcons.bell,
                  color: currentTheme.getCurrentTheme() == ThemeMode.dark
                      ? Colors.white
                      : ColorManager.deepBlack,
                ),
              ),
            ),
          ],
        ),
        drawer: const LeftMenuDrawer(),
        body: Stack(
          children: [
            CustomScrollView(slivers: [
              buildHeaderSection(),
              // buildChart(),

              const SliverPadding(padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 7.0,),),
              // SliverPadding(padding: EdgeInsets.all(16)),
              // buildRecentExamHeaderSection(landingController),
              // buildRecentExamListSection(examController),
              // buildEshopHeaderSection(landingController),
              // buildEshopItemListSection(eshopController),
              SliverPadding(
                  padding: EdgeInsets.all(8),
                  sliver: SliverGrid.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8.0,
                    crossAxisSpacing: 8.0,
                    childAspectRatio: 1.5,
                    children: [
                      ///test
                      InkWell(
                        onTap: () {
                          Get.toNamed(AppRoutes.savedTestScreen);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: currentTheme.getCurrentTheme() ==
                                      ThemeMode.dark
                                  ? ColorManager.blackGridBackground
                                  : ColorManager.smallTextBlack,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          child: Wrap(
                            direction: Axis.vertical,
                            alignment: WrapAlignment.center,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            runAlignment: WrapAlignment.center,
                            children: [
                              Icon(
                                FeatherIcons.settings,
                                color: ColorManager.brandColor,
                              ),
                              Text(
                                'Test',
                                style: getTextStyle(
                                    16,
                                    FontWeight.w400,
                                    currentTheme.getCurrentTheme() ==
                                            ThemeMode.dark
                                        ? Colors.white
                                        : ColorManager.grayLight),
                              ),
                            ],
                          ),
                        ),
                      ),

                      ///Reports
                      InkWell(
                        onTap: () {
                          Get.toNamed(AppRoutes.reportsScreen);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: currentTheme.getCurrentTheme() ==
                                  ThemeMode.dark
                                  ? ColorManager.blackGridBackground
                                  : ColorManager.smallTextBlack,
                              borderRadius:
                              BorderRadius.all(Radius.circular(8))),
                          child: Wrap(
                            direction: Axis.vertical,
                            alignment: WrapAlignment.center,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            runAlignment: WrapAlignment.center,
                            children: [
                              SvgPicture.asset(
                                AssetConstant.reportIcon,
                              ),
                              Text(
                                'Reports',
                                style: getTextStyle(
                                    16,
                                    FontWeight.w400,
                                    currentTheme.getCurrentTheme() ==
                                        ThemeMode.dark
                                        ? Colors.white
                                        : ColorManager.grayLight),
                              ),
                            ],
                          ),
                        ),
                      ),

                      ///Subscriptions
                      InkWell(
                        onTap: () {
                          Get.to(const SubscriptionScreen());
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: currentTheme.getCurrentTheme() ==
                                      ThemeMode.dark
                                  ? ColorManager.blackGridBackground
                                  : ColorManager.smallTextBlack,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          child: Wrap(
                            direction: Axis.vertical,
                            alignment: WrapAlignment.center,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            runAlignment: WrapAlignment.center,
                            children: [
                              Icon(
                                Icons.subscriptions,
                                color: ColorManager.brandColor,
                              ),
                              Text(
                                'Subscriptions',
                                style: getTextStyle(
                                    16,
                                    FontWeight.w400,
                                    currentTheme.getCurrentTheme() ==
                                            ThemeMode.dark
                                        ? Colors.white
                                        : ColorManager.grayLight),
                              ),
                            ],
                          ),
                        ),
                      ),

                      ///Search/Feedback Question
                      InkWell(
                        onTap: () {
                          Get.toNamed(AppRoutes.reportsScreen);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: currentTheme.getCurrentTheme() ==
                                      ThemeMode.dark
                                  ? ColorManager.blackGridBackground
                                  : ColorManager.smallTextBlack,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          child: Wrap(
                            direction: Axis.vertical,
                            alignment: WrapAlignment.center,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            runAlignment: WrapAlignment.center,
                            children: [
                              Icon(
                                FeatherIcons.search,
                                color: ColorManager.brandColor,
                              ),
                              Text(
                                'Search/Feedback \nQuestion',
                                textAlign: TextAlign.center,
                                style: getTextStyle(
                                    16,
                                    FontWeight.w400,
                                    currentTheme.getCurrentTheme() ==
                                            ThemeMode.dark
                                        ? Colors.white
                                        : ColorManager.grayLight),
                              ),
                            ],
                          ),
                        ),
                      ),

                      ///Faq
                      InkWell(
                        onTap: () {
                          Get.to(WebViewScreens(
                            argument: "FAQ",
                          ));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: currentTheme.getCurrentTheme() ==
                                      ThemeMode.dark
                                  ? ColorManager.blackGridBackground
                                  : ColorManager.smallTextBlack,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          child: Wrap(
                            direction: Axis.vertical,
                            alignment: WrapAlignment.center,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            runAlignment: WrapAlignment.center,
                            children: [
                              Icon(
                                FeatherIcons.helpCircle,
                                color: ColorManager.brandColor,
                              ),
                              Text(
                                'Faq',
                                style: getTextStyle(
                                    16,
                                    FontWeight.w400,
                                    currentTheme.getCurrentTheme() ==
                                            ThemeMode.dark
                                        ? Colors.white
                                        : ColorManager.grayLight),
                              ),
                            ],
                          ),
                        ),
                      ),

                      ///NEWS
                      InkWell(
                        onTap: () {
                          Get.to(WebViewScreens(
                            argument: "NEWS",
                          ));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: currentTheme.getCurrentTheme() ==
                                  ThemeMode.dark
                                  ? ColorManager.blackGridBackground
                                  : ColorManager.smallTextBlack,
                              borderRadius:
                              BorderRadius.all(Radius.circular(8))),
                          child: Wrap(
                            direction: Axis.vertical,
                            alignment: WrapAlignment.center,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            runAlignment: WrapAlignment.center,
                            children: [
                              Icon(
                                FeatherIcons.wifi,
                                color: ColorManager.brandColor,
                              ),
                              Text(
                                'NEWS',
                                style: getTextStyle(
                                    16,
                                    FontWeight.w400,
                                    currentTheme.getCurrentTheme() ==
                                        ThemeMode.dark
                                        ? Colors.white
                                        : ColorManager.grayLight),
                              ),
                            ],
                          ),
                        ),
                      ),

                      ///Forum
                      InkWell(
                        onTap: () {
                          // Get.to(WebViewScreens(
                          //   argument: "FORUM",
                          // ));
                          Get.toNamed(AppRoutes.forum);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: currentTheme.getCurrentTheme() ==
                                      ThemeMode.dark
                                  ? ColorManager.blackGridBackground
                                  : ColorManager.smallTextBlack,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          child: Wrap(
                            direction: Axis.vertical,
                            alignment: WrapAlignment.center,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            runAlignment: WrapAlignment.center,
                            children: [
                              Icon(
                                Icons.question_answer_outlined,

                                color: ColorManager.brandColor,
                              ),
                              Text(
                                'Forum',
                                style: getTextStyle(
                                    16,
                                    FontWeight.w400,
                                    currentTheme.getCurrentTheme() ==
                                            ThemeMode.dark
                                        ? Colors.white
                                        : ColorManager.grayLight),
                              ),
                            ],
                          ),
                        ),
                      ),


                      ///Subscribe Teacher
                      InkWell(
                        onTap: () {
                          Get.toNamed(AppRoutes.studentsScreen);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: currentTheme.getCurrentTheme() ==
                                      ThemeMode.dark
                                  ? ColorManager.blackGridBackground
                                  : ColorManager.smallTextBlack,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          child: Wrap(
                            direction: Axis.vertical,
                            alignment: WrapAlignment.center,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            runAlignment: WrapAlignment.center,
                            children: [
                              SvgPicture.asset(
                                AssetConstant.subscribeTeacherIcon,
                                color: ColorManager.brandColor,
                              ),
                              Text(
                                'Subscribe Teachers / \nParent',textAlign: TextAlign.center,
                                style: getTextStyle(
                                    16,
                                    FontWeight.w400,
                                    currentTheme.getCurrentTheme() ==
                                            ThemeMode.dark
                                        ? Colors.white
                                        : ColorManager.grayLight),
                              ),

                            ],
                          ),
                        ),
                      ),

                      ///Support
                      InkWell(
                        onTap: () {
                          Get.toNamed(AppRoutes.supportList);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: currentTheme.getCurrentTheme() ==
                                      ThemeMode.dark
                                  ? ColorManager.blackGridBackground
                                  : ColorManager.smallTextBlack,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          child: Wrap(
                            direction: Axis.vertical,
                            alignment: WrapAlignment.center,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            runAlignment: WrapAlignment.center,
                            children: [
                              Icon(
                                Icons.headset_mic_outlined,
                                color: ColorManager.brandColor,
                              ),
                              Text(
                                'Support',
                                style: getTextStyle(
                                    16,
                                    FontWeight.w400,
                                    currentTheme.getCurrentTheme() ==
                                            ThemeMode.dark
                                        ? Colors.white
                                        : ColorManager.grayLight),
                              ),
                            ],
                          ),
                        ),
                      ),


                      ///Affiliate
                      InkWell(
                        onTap: () {
                          Get.to(const AffiliateScreen());
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: currentTheme.getCurrentTheme() ==
                                  ThemeMode.dark
                                  ? ColorManager.blackGridBackground
                                  : ColorManager.smallTextBlack,
                              borderRadius:
                              BorderRadius.all(Radius.circular(8))),
                          child: Wrap(
                            direction: Axis.vertical,
                            alignment: WrapAlignment.center,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            runAlignment: WrapAlignment.center,
                            children: [
                              SvgPicture.asset(
                                AssetConstant.shareIcon,
                                color: ColorManager.brandColor,
                              ),
                              Text(
                                'Affiliate',
                                style: getTextStyle(
                                    16,
                                    FontWeight.w400,
                                    currentTheme.getCurrentTheme() ==
                                        ThemeMode.dark
                                        ? Colors.white
                                        : ColorManager.grayLight),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )),
              // SliverToBoxAdapter(
              //   child: Center(
              //     child: Column(
              //       mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
              //       children: [
              //
              //       ],
              //     ),
              //   ),
              // ),
            ]),
          ],
        ),
        // floatingActionButton: InkWell(
        //   onTap: () {
        //     Get.toNamed(AppRoutes.createExam);
        //   },
        //   child: CircleAvatar(
        //     backgroundColor: ColorManager.brandColor,
        //     radius: 28,
        //     child: const Icon(
        //       FeatherIcons.plus,
        //       color: Colors.white,
        //     ),
        //   ),
        // ),
      ),
    );
  }

  Obx buildEshopItemListSection(EShopsViewModel controller) {
    return Obx(() {
      return SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 16),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: setUpEshopData(controller),
            ),
          ),
        ),
      );
    });
  }

  // Widget buildStudentListItem(HomeViewModel controller, int index) {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
  //     child: Container(
  //       decoration: BoxDecoration(
  //           borderRadius: const BorderRadius.all(Radius.circular(5)),
  //           color: currentTheme.getCurrentTheme() == ThemeMode.dark
  //               ? ColorManager.darkModeCard
  //               : Colors.white),
  //       child: ListTile(
  //           leading: CircleAvatar(
  //             backgroundColor: ColorManager.brandColor,
  //             radius: 25,
  //           ),
  //           title: Text(
  //             controller.eshopItemList[index].firstName.toString() +
  //                 controller.eshopItemList[index].lastName.toString(),
  //             style: getTextStyle(16, FontWeight.w600, ColorManager.grayLight),
  //           ),
  //           subtitle: Column(
  //             mainAxisAlignment: MainAxisAlignment.start,
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Text(
  //                 controller.eshopItemList[index].email.toString(),
  //                 style: getTextStyle(
  //                     14,
  //                     FontWeight.w400,
  //                     currentTheme.getCurrentTheme() == ThemeMode.dark
  //                         ? Colors.white
  //                         : ColorManager.deepBlack),
  //               ),
  //               Padding(
  //                 padding: const EdgeInsets.symmetric(vertical: 8.0),
  //                 child: Row(
  //                   mainAxisAlignment: MainAxisAlignment.start,
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     if (controller.eshopItemList[index].status.toString() ==
  //                         '1')
  //                       Container(
  //                         decoration: BoxDecoration(
  //                           borderRadius:
  //                               const BorderRadius.all(Radius.circular(3)),
  //                           color: Colors.green.shade100,
  //                         ),
  //                         child: Padding(
  //                           padding: const EdgeInsets.all(8.0),
  //                           child: Text(
  //                             'Active',
  //                             style: getTextStyle(
  //                                 12, FontWeight.w600, ColorManager.green),
  //                           ),
  //                         ),
  //                       ),
  //                     sizeHor(8),
  //                     Container(
  //                       decoration: BoxDecoration(
  //                         borderRadius:
  //                             const BorderRadius.all(Radius.circular(3)),
  //                         color: ColorManager.brandColor,
  //                       ),
  //                       child: Padding(
  //                         padding: const EdgeInsets.all(8.0),
  //                         child: Text(
  //                           'Report',
  //                           style:
  //                               getTextStyle(12, FontWeight.w600, Colors.white),
  //                         ),
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ],
  //           ),
  //           trailing: InkWell(
  //             onTap: () {
  //               Get.defaultDialog(
  //                 title: 'Delete Student',
  //                 content: Text('Are you sure?'),
  //                 textCancel: 'Cancel',
  //                 cancelTextColor: Colors.red,
  //                 textConfirm: 'Confirm',
  //                 confirmTextColor: Colors.green,
  //                 onCancel: () {
  //                   // Action to perform when the cancel button is pressed.
  //                 },
  //                 onConfirm: () {
  //                   // Action to perform when the confirm button is pressed.
  //                 },
  //               );
  //             },
  //             child: CircleAvatar(
  //               backgroundColor: const Color.fromRGBO(247, 82, 82, 0.1),
  //               child: SvgPicture.asset(AssetConstant.deleteIcon),
  //             ),
  //           )),
  //     ),
  //   );
  // }

  SliverToBoxAdapter buildEshopHeaderSection(
      LandingScreenViewModel landingController) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Eshop',
              style: getTextStyle(
                  20,
                  FontWeight.w600,
                  currentTheme.getCurrentTheme() == ThemeMode.dark
                      ? Colors.white
                      : ColorManager.deepBlack),
            ),
            InkWell(
              onTap: () {
                landingController.changeTabIndex(2);
              },
              child: Text(
                'See all',
                style: getTextStyle(
                    14, FontWeight.w600, ColorManager.blueTextColor),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Obx buildRecentExamListSection(ExamViewModel examController) {
    return Obx(() {
      return SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 16),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: setUpRecentExams(examController),
            ),
          ),
        ),
      );
    });
  }

  SliverToBoxAdapter buildHeaderSection() {
    return SliverToBoxAdapter(
      child: Padding(
        // padding: const EdgeInsets.symmetric(vertical: 32.0),
        padding: const EdgeInsets.only(top: 0.0, bottom: 0.0),
        child: ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(33.0),
            child: CachedNetworkImage(
              fit: BoxFit.fill,
              imageUrl: sessionLoginData?.data?.user?.image?.toString() ?? '',
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  CircularProgressIndicator(value: downloadProgress.progress),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          title: Text(
            'Hello',
            style: getTextStyle(
                14,
                FontWeight.w400,
                currentTheme.getCurrentTheme() == ThemeMode.dark
                    ? Colors.white
                    : ColorManager.grayLight),
          ),
          subtitle: (sessionLoginData != null)
              ? Text(
                  '${sessionLoginData?.data?.user?.firstName?.toString()} '
                  '${sessionLoginData?.data?.user?.lastName?.toString()}',
                  style: getTextStyle(
                      24,
                      FontWeight.w600,
                      currentTheme.getCurrentTheme() == ThemeMode.dark
                          ? Colors.white
                          : ColorManager.deepBlack),
                )
              : const SizedBox(),
        ),
      ),
    );
  }

  SliverToBoxAdapter buildChart() {
    return SliverToBoxAdapter(
        child: Stack(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 1.70,
            child: Padding(
              padding: const EdgeInsets.only(
                right: 18,
                left: 12,
                top: 24,
                bottom: 12,
              ),
              child: LineChart(
                controller.showAvg ? avgData() : mainData(),
              ),
            ),
          ),
          SizedBox(
            width: 60,
            height: 34,
            child: TextButton(
              onPressed: () {
                controller.showAvg = !controller.showAvg;
              },
              child: Text(
                'avg',
                style: TextStyle(
                  fontSize: 12,
                  color: controller.showAvg
                      ? Colors.white.withOpacity(0.5)
                      : Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  SliverToBoxAdapter buildRecentExamHeaderSection(
      LandingScreenViewModel landingController) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Recent Exam',
              style: getTextStyle(
                  20,
                  FontWeight.w600,
                  currentTheme.getCurrentTheme() == ThemeMode.dark
                      ? Colors.white
                      : ColorManager.deepBlack),
            ),
            InkWell(
              onTap: () {
                landingController.changeTabIndex(1);
              },
              child: Text(
                'See all',
                style: getTextStyle(
                    14, FontWeight.w600, ColorManager.blueTextColor),
              ),
            ),
          ],
        ),
      ),
    );
  }

  setUpRecentExams(ExamViewModel examController) {
    List<Widget> childrens = [];
    var count = examController.rxList.length;
    if (examController.rxList.length > 5) {
      count = 5;
    }
    for (var i = 0; i < count; i++) {
      var tmp = DateTime.parse(examController.rxList[i].createdAt.toString());
      var dateString = DateFormat.yMMMMd().format(tmp);

      childrens.add(Padding(
        padding: const EdgeInsets.all(4.0),
        child: GestureDetector(
            onTap: () {
              // Navigator.pushNamed(
              //     context, ScreenRouteConst.foodDetails,arguments: topSellingFoods[i]);
            },
            child: Container(
              width: 260,
              height: 160,
              decoration: BoxDecoration(
                  color: ColorManager.randomGenerator(),
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  image: const DecorationImage(
                    alignment: Alignment.bottomRight,
                    image: AssetImage(
                        "assets/icons/home/Exam Card Abstract shape.png"),
                    fit: BoxFit.contain,
                  )),
              child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (examController.rxList[i].examName != null)
                        Text(
                          examController.rxList[i].examName.toString(),
                          style:
                              getTextStyle(16, FontWeight.w600, Colors.white),
                        ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          'Course - ${examController.rxList[i].coursesName}',
                          style:
                              getTextStyle(14, FontWeight.w400, Colors.white),
                        ),
                      ),
                      Text(
                        dateString,
                        style: getTextStyle(14, FontWeight.w400, Colors.white),
                      ),
                    ],
                  )),
            )),
      ));
    }
    return childrens;
  }

  setUpEshopData(EShopsViewModel examController) {
    List<Widget> children = [];
    var count = examController.rxList.length;
    if (examController.rxList.length > 5) {
      count = 5;
    }
    for (var index = 0; index < count; index++) {
      // var tmp =
      //     DateTime.parse(examController.rxList[index].createdAt.toString());
      // var dateString = DateFormat.yMMMMd().format(tmp);

      children.add(Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8), topRight: Radius.circular(8)),
              child: CachedNetworkImage(
                height: 120,
                width: Get.width,
                fit: BoxFit.fitWidth,
                imageUrl:
                    '${AppUrls.pictureUrl}${examController.rxList[index].image}',
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Center(
                        child: CircularProgressIndicator(
                            value: downloadProgress.progress)),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: currentTheme.getCurrentTheme() == ThemeMode.dark
                    ? ColorManager.deepBlack
                    : Colors.white,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(8),
                    bottomLeft: Radius.circular(8)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      examController.rxList[index].name.toString(),
                      style: getTextStyle(
                          16, FontWeight.w600, ColorManager.brandColor),
                    ),
                    Text(
                      examController.rxList[index].description.toString(),
                      style: getTextStyle(
                          14,
                          FontWeight.w400,
                          currentTheme.getCurrentTheme() == ThemeMode.dark
                              ? Colors.white54
                              : ColorManager.deepBlack),
                    ),
                    sizeVer(16),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${getCurrency()} ${examController.rxList[index].priceNgn}',
                          // style: getTextStyle(14, FontWeight.w400,
                          //     ColorManager.brandColor),
                        ),
                        RoundButtonWidget(
                          title: 'Buy Now',
                          loading: false,
                          width: 100,
                          height: 32,
                          onPress: () {},
                          textColor: Colors.white,
                          buttonColor: ColorManager.brandColor,
                        )
                      ],
                    )
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

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    Widget text;
    switch (value.toInt()) {
      case 1:
        text = const Text('JAN', style: style);
        break;

      case 3:
        text = const Text('MAR', style: style);
        break;
      case 6:
        text = const Text('JUN', style: style);
        break;
      case 8:
        text = const Text('SEP', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 15,
    );
    String text;
    switch (value.toInt()) {
      case 1:
        text = '10';
        break;
      case 2:
        text = '20';
        break;
      case 3:
        text = '30';
        break;
      case 4:
        text = '40';
        break;
      case 5:
        text = '50';
        break;
      case 7:
        text = '50';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: ColorManager.mainGridLineColor,
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: ColorManager.mainGridLineColor,
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3),
            FlSpot(2.6, 2),
            FlSpot(4.9, 5),
            FlSpot(6.8, 3.1),
            FlSpot(8, 4),
            FlSpot(9.5, 3),
            FlSpot(11, 4),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: controller.gradientColors,
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: controller.gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }

  LineChartData avgData() {
    return LineChartData(
      lineTouchData: LineTouchData(enabled: false),
      gridData: FlGridData(
        show: true,
        drawHorizontalLine: true,
        verticalInterval: 1,
        horizontalInterval: 1,
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: bottomTitleWidgets,
            interval: 1,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
            interval: 1,
          ),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3.44),
            FlSpot(2.6, 3.44),
            FlSpot(4.9, 3.44),
            FlSpot(6.8, 3.44),
            FlSpot(8, 3.44),
            FlSpot(9.5, 3.44),
            FlSpot(11, 3.44),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: [
              ColorTween(
                      begin: controller.gradientColors[0],
                      end: controller.gradientColors[1])
                  .lerp(0.2)!,
              ColorTween(
                      begin: controller.gradientColors[0],
                      end: controller.gradientColors[1])
                  .lerp(0.2)!,
            ],
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: [
                ColorTween(
                        begin: controller.gradientColors[0],
                        end: controller.gradientColors[1])
                    .lerp(0.2)!
                    .withOpacity(0.1),
                ColorTween(
                        begin: controller.gradientColors[0],
                        end: controller.gradientColors[1])
                    .lerp(0.2)!
                    .withOpacity(0.1),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
