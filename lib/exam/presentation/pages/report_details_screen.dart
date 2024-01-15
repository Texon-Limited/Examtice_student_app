import 'package:cached_network_image/cached_network_image.dart';
import 'package:examtice_teacher/exam/view_models/exam_details_vm.dart';
import 'package:examtice_teacher/exam/view_models/reports_vm.dart';
import 'package:examtice_teacher/exam/view_models/reports_vm.dart';
import 'package:examtice_teacher/exam/view_models/reports_vm.dart';
import 'package:examtice_teacher/exam/view_models/reports_vm.dart';
import 'package:examtice_teacher/exam/view_models/reports_vm.dart';
import 'package:examtice_teacher/exam/view_models/reports_vm.dart';
import 'package:examtice_teacher/exam/view_models/reports_vm.dart';
import 'package:examtice_teacher/resources/utis.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../resources/AppConfigs.dart';
import '../../../resources/api_status.dart';
import '../../../resources/colors.dart';
import '../../../resources/constants.dart';
import '../../../resources/styles.dart';
import '../widgets/selection_item.dart';

class ReportDetailsScreen extends GetView<ReportsViewModel> {
  const ReportDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ReportsViewModel());

    // var tmp =
    //     DateTime.parse(controller.subscriptionDetailsResponse.value!.createdAt!);

    return SafeArea(
        child: Scaffold(
            backgroundColor: currentTheme.getCurrentTheme() == ThemeMode.dark
                ? Colors.black
                : ColorManager.uiBackgroundColor,
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(44), // Set this height
              child: AppBar(
                centerTitle: true,
                backgroundColor: ColorManager.brandColor,
                elevation: 0,
                title: Text(
                  'Report Details',
                  style: getTextStyle(16, FontWeight.w600, Colors.white),
                ),
              ),
            ),
            body: Obx(() {
              switch (controller.rxRequestStatus.value) {
                case ApiStatus.loading:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                case ApiStatus.error:
                  return Center(
                    child: Text(MessageConstant.errorMessage),
                  );

                case ApiStatus.completed:
                  if (controller.subscriptionDetailsResponse.value
                              ?.questionsData ==
                          null ||
                      controller.subscriptionDetailsResponse.value
                              ?.questionsData?.isEmpty ==
                          true) {
                    return const Center(
                      child: Text(MessageConstant.noDataMessage),
                    );
                  } else {
                    return Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Column(
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(
                                      AssetConstant.threeCircleIcon)),
                              // gradient: LinearGradient(colors: [
                              //   HexColor.fromHex("#F0478C"),
                              //   HexColor.fromHex("#CC0B5A"),
                              // ]),
                            ),
                            child: (controller
                                        .subscriptionDetailsResponse.value !=
                                    null)
                                ? Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16.0, horizontal: 16),
                                    child: Stack(
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            sizeVer(16),
                                            RichText(
                                              text: TextSpan(
                                                style: getTextStyle(
                                                    14,
                                                    FontWeight.w400,
                                                    Colors.white),
                                                children: [
                                                  const TextSpan(
                                                    text: 'Course - ',
                                                  ),
                                                  TextSpan(
                                                    text: controller
                                                        .subscriptionDetailsResponse
                                                        .value
                                                        ?.courseName
                                                        .toString(),
                                                    style: getTextStyle(
                                                        14,
                                                        FontWeight.w600,
                                                        Colors.white),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            RichText(
                                              text: TextSpan(
                                                style: getTextStyle(
                                                    14,
                                                    FontWeight.w400,
                                                    Colors.white),
                                                children: [
                                                  const TextSpan(
                                                    text: 'Subject - ',
                                                  ),
                                                  TextSpan(
                                                    text: controller
                                                        .subscriptionDetailsResponse
                                                        .value
                                                        ?.subjectName
                                                        .toString(),
                                                    style: getTextStyle(
                                                        14,
                                                        FontWeight.w600,
                                                        Colors.white),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                RichText(
                                                  text: TextSpan(
                                                    style: getTextStyle(
                                                        14,
                                                        FontWeight.w400,
                                                        Colors.white),
                                                    children: [
                                                      const TextSpan(
                                                        text:
                                                            'Total Questions - ',
                                                      ),
                                                      TextSpan(
                                                        text: controller
                                                            .subscriptionDetailsResponse
                                                            .value
                                                            ?.totalQuestions
                                                            .toString(),
                                                        style: getTextStyle(
                                                            14,
                                                            FontWeight.w400,
                                                            Colors.white),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                RichText(
                                                  text: TextSpan(
                                                    style: getTextStyle(
                                                        14,
                                                        FontWeight.w400,
                                                        Colors.white),
                                                    children: [
                                                      const TextSpan(
                                                        text: 'Date - ',
                                                      ),
                                                      TextSpan(
                                                        text: DateFormat
                                                                .yMMMMd()
                                                            .format(controller
                                                                .subscriptionDetailsResponse
                                                                .value!
                                                                .createdAt!)
                                                            .toString(),
                                                        style: getTextStyle(
                                                            14,
                                                            FontWeight.w400,
                                                            Colors.white),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Obx(() {
                                                  return RichText(
                                                    text: TextSpan(
                                                      style: getTextStyle(
                                                          14,
                                                          FontWeight.w400,
                                                          Colors.white),
                                                      children: [
                                                        const TextSpan(
                                                          text:
                                                              'Correctly Answered - ',
                                                        ),
                                                        TextSpan(
                                                          text: controller
                                                              .correctlyAnswered
                                                              .value
                                                              .toString(),
                                                          //controller.subscriptionDetailsResponse.value?.totalQuestions .toString(),
                                                          style: getTextStyle(
                                                              14,
                                                              FontWeight.w400,
                                                              Colors.white),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                }),
                                                RichText(
                                                  text: TextSpan(
                                                    style: getTextStyle(
                                                        14,
                                                        FontWeight.w400,
                                                        Colors.white),
                                                    children: [
                                                      const TextSpan(
                                                        text: 'Time Spend - ',
                                                      ),
                                                      TextSpan(
                                                        text: controller
                                                            .subscriptionDetailsResponse
                                                            .value
                                                            ?.timeSpent
                                                            .toString(),
                                                        // text: dateString,
                                                        style: getTextStyle(
                                                            14,
                                                            FontWeight.w400,
                                                            Colors.white),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Align(
                                            alignment: Alignment.topRight,
                                            child: CircleAvatar(
                                              radius: 25,
                                              backgroundColor: Colors.orange,
                                              child: Text(
                                                '${controller.percentage.value.toStringAsFixed(0)}%',
                                                style: getTextStyle(
                                                    16,
                                                    FontWeight.w600,
                                                    Colors.white),
                                              ),
                                            )),
                                      ],
                                    ),
                                  )
                                : const SizedBox(),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: ColorManager.brandColor),
                                  borderRadius: BorderRadius.circular(8),
                                  color: currentTheme.getCurrentTheme() ==
                                          ThemeMode.dark
                                      ? Colors.black
                                      : ColorManager.uiBackgroundColor),
                              child: TabBar(
                                labelColor: Colors.white,
                                controller: controller.tabController,
                                indicatorColor: Colors.transparent,
                                unselectedLabelColor: ColorManager.brandColor,
                                indicator: BoxDecoration(
                                  color: ColorManager.brandColor,
                                ),
                                tabs: const [
                                  Tab(
                                    text: 'Question & Answer',
                                  ),
                                  Tab(
                                    text: 'Test Details',
                                  ),
                                ],
                                onTap: (index) {
                                  controller.tabIndex.value = index;
                                },
                              ),
                            ),
                          ),
                          Expanded(
                            child: TabBarView(
                              controller: controller.tabController,
                              children: const [
                                QuestionsAndAnswerScreen(),
                                StudentListPage(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }
              }
            })));
  }
}

class QuestionsAndAnswerScreen extends StatefulWidget {
  const QuestionsAndAnswerScreen({super.key});

  @override
  _QuestionsAndAnswerScreenState createState() =>
      _QuestionsAndAnswerScreenState();
}

class _QuestionsAndAnswerScreenState extends State<QuestionsAndAnswerScreen>
    with AutomaticKeepAliveClientMixin {
  final controller = Get.put(ReportsViewModel());

  @override
  Widget build(BuildContext context) {
    print('>>> Build Car Page');
    super.build(context);
    return CustomScrollView(
      slivers: [buildSliverList(controller)],
    );
  }

  @override
  bool get wantKeepAlive => true;

  Obx buildSliverList(ReportsViewModel homeController) {
    return Obx(() {
      switch (homeController.rxRequestStatus.value) {
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
          if (homeController.subscriptionDetailsResponse.value?.questionsData ==
                  null ||
              homeController.subscriptionDetailsResponse.value?.questionsData
                      ?.isEmpty ==
                  true) {
            return const SliverToBoxAdapter(
              child: Center(
                child: Text(MessageConstant.noDataMessage),
              ),
            );
          } else {
            return SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: homeController
                    .subscriptionDetailsResponse.value?.questionsData?.length,
                (context, index) => buildQAListItem(homeController, index),
              ),
            );
          }
      }
    });
  }

  Widget buildQAListItem(ReportsViewModel homeController, int index) {
    var questionList =
        homeController.subscriptionDetailsResponse.value!.questionsData;

    var pwdWidgets = <Widget>[];
    if (controller.subscriptionDetailsResponse.value?.questionsData![index]
            .comments.isBlank ==
        false) {
      for (var comment in controller
          .subscriptionDetailsResponse.value!.questionsData![index].comments!) {
        var tmp = DateTime.parse(comment.createdAt.toString());
        var dateString = DateFormat.yMMMMd().format(tmp);

        pwdWidgets.add(ListTile(
          title: Text(comment.firstName.toString()),
          subtitle: Text(comment.comment.toString()),
          trailing: Text(dateString),
        )); // TODO: Whatever layout you need foreach widget.
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0),
      child: Container(
        width: Get.width - 48,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            color: currentTheme.getCurrentTheme() == ThemeMode.dark
                ? ColorManager.darkModeCard
                : Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Html(data: questionList![index].question.toString()),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: ListTile(
                dense: true,
                contentPadding: EdgeInsets.zero,
                leading: const Icon(
                  FeatherIcons.checkSquare,
                  color: Colors.green,
                ),
                title: (questionList[index].answer == 1)
                    ? Html(data: questionList?[index].option1.toString())
                    : (questionList[index].answer == 2)
                        ? Html(data: questionList[index].option2.toString())
                        : (questionList[index].answer == 3)
                            ? Html(data: questionList[index].option3.toString())
                            : Html(data: questionList[index].option4.toString()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: ListTile(
                dense: true,
                contentPadding: EdgeInsets.zero,
                leading: const Icon(
                  FeatherIcons.checkSquare,
                  color: Colors.red,
                ),
                title: (questionList[index].answer == 4)
                    ? Html(data: questionList[index].option1.toString())
                    : (questionList[index].answer == 3)
                        ? Html(data: questionList[index].option2.toString())
                        : (questionList[index].answer == 2)
                            ? Html(data: questionList[index].option3.toString())
                            : Html(data: questionList[index].option4.toString()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0, bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      if (homeController.subscriptionDetailsResponse.value!
                              .questionsData![index].explanation !=
                          null) {
                        showGeneralDialog(
                          context: context,
                          barrierColor: Colors.black12
                              .withOpacity(0.6), // Background color
                          barrierDismissible: false,
                          barrierLabel: 'Dialog',
                          transitionDuration: const Duration(milliseconds: 400),
                          pageBuilder: (_, __, ___) {
                            return Container(
                              height: 400,
                              child: Material(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 48.0),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: <Widget>[
                                        Html(
                                          data: homeController
                                              .subscriptionDetailsResponse
                                              .value!
                                              .questionsData![index]
                                              .explanation,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                        // Get.defaultDialog(
                        //   title: "Explanation",
                        //   // middleText: "Hello world!",
                        //   // backgroundColor: Colors.green,
                        //   titleStyle: TextStyle(color: Colors.white),
                        //   middleTextStyle: TextStyle(color: Colors.white),
                        //   // textConfirm: "Confirm",
                        //   textCancel: "Back",
                        //   cancelTextColor: Colors.white,
                        //   confirmTextColor: Colors.white,
                        //   buttonColor: Colors.red,
                        //   barrierDismissible: false,
                        //   radius: 0,
                        //   content: Container(
                        //     height: 400,
                        //     child: SingleChildScrollView(
                        //       child: Padding(
                        //         padding: const EdgeInsets.all(8.0),
                        //         child: Html(
                        //           data: homeController.subscriptionDetailsResponse.value!
                        //               .questionsData![index].explanation,
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // );
                      } else {
                        Utils.snackBar('Explanation', 'No Explanation found.');
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.lightbulb,
                          color: ColorManager.brandColor,
                        ),
                        Text(
                          'Explanation',
                          style: getTextStyle(
                              14, FontWeight.w600, ColorManager.brandColor),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      if (homeController.subscriptionDetailsResponse.value!
                              .questionsData![index].comments?.isBlank ==
                          false) {
                        Get.defaultDialog(
                            title: "Comments",
                            // middleText: "Hello world!",
                            // backgroundColor: Colors.green,
                            titleStyle: TextStyle(color: Colors.white),
                            middleTextStyle: TextStyle(color: Colors.white),
                            // textConfirm: "Confirm",
                            textCancel: "Back",
                            cancelTextColor: Colors.white,
                            confirmTextColor: Colors.white,
                            buttonColor: Colors.red,
                            barrierDismissible: false,
                            radius: 0,
                            content: Column(
                              children: pwdWidgets,
                            ));
                      } else {
                        Utils.snackBar('Comments', 'No Comment found.');
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.message,
                          color: ColorManager.grayLight,
                        ),
                        Text(
                          'Comments',
                          style: getTextStyle(
                              14, FontWeight.w600, ColorManager.grayLight),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CarPageController extends GetxController {
  final car = ''.obs;

  @override
  void onInit() {
    print('Call API Car'); // called only once
    car.value = 'Ferrari';
    super.onInit();
  }
}

class StudentListPage extends StatefulWidget {
  const StudentListPage({super.key});

  @override
  _StudentListPageState createState() => _StudentListPageState();
}

class _StudentListPageState extends State<StudentListPage>
    with AutomaticKeepAliveClientMixin {
  final controller = Get.put(ReportsViewModel());

  @override
  Widget build(BuildContext context) {
    print('>>> Build Car Page');
    super.build(context);
    return CustomScrollView(
      slivers: [
        SliverPadding(padding: EdgeInsets.all(16)),
        if (controller.subscriptionDetailsResponse?.value.questionsData != null)
          buildSliverList(controller)
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;

  Obx buildSliverList(ReportsViewModel homeController) {
    return Obx(() {
      switch (homeController.rxRequestStatus.value) {
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
          return
              //   SliverList(
              //   delegate: SliverChildBuilderDelegate(
              //     childCount: homeController.studentList.length,
              //     (context, index) => buildStudentListItem(homeController, index),
              //   ),
              // );
              SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      // mainAxisExtent: 3,crossAxisSpacing: 3,
                      mainAxisSpacing: 8,
                      childAspectRatio: 1.8,
                      crossAxisSpacing: 8,
                      crossAxisCount: 3),
                  delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    return Container(
                      height: 20,
                      width: 40,
                      decoration: BoxDecoration(
                          color: controller.subscriptionDetailsResponse.value!
                                      .questionsData![index].isCorrect ==
                                  true
                              ? Colors.green
                              : Colors.red),
                      child: Center(
                        child: Text('${index + 1}'),
                      ),
                    );
                  },
                      childCount: homeController.subscriptionDetailsResponse
                          .value?.questionsData?.length));
      }
    });
  }
}

// class BikePageController extends GetxController {
//   final bike = ''.obs;
//
//   @override
//   void onInit() {
//     print('Call API Bike'); // called only once
//     bike.value = 'BMC';
//     super.onInit();
//   }
// }
