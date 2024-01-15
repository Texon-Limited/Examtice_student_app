import 'package:cached_network_image/cached_network_image.dart';
import 'package:examtice_teacher/exam/view_models/exam_screen_vm.dart';
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

class ExamDetailsScreen extends GetView<ExamViewModel> {
  const ExamDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ExamViewModel());

    var tmp =
        DateTime.parse(controller.selectedExam.value.createdAt.toString());
    var dateString = DateFormat.yMMMMd().format(tmp);

    return SafeArea(
        child: Scaffold(
      backgroundColor: currentTheme.getCurrentTheme() == ThemeMode.dark
          ? Colors.black
          : ColorManager.uiBackgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(170), // Set this height
        child: AppBar(
          centerTitle: true,
          elevation: 0,
          title: Text(
            'Exam Details',
            style: getTextStyle(16, FontWeight.w600, Colors.white),
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(AssetConstant.threeCircleIcon)),
              // gradient: LinearGradient(colors: [
              //   HexColor.fromHex("#F0478C"),
              //   HexColor.fromHex("#CC0B5A"),
              // ]),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 25.0, horizontal: 32),
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      sizeVer(16),
                      Text(
                        controller.selectedExam.value.examName.toString(),
                        style: getTextStyle(16, FontWeight.w600, Colors.white),
                      ),
                      RichText(
                        text: TextSpan(
                          style:
                              getTextStyle(14, FontWeight.w400, Colors.white),
                          children: [
                            const TextSpan(
                              text: 'Course - ',
                            ),
                            TextSpan(
                              text: controller.selectedExam.value.coursesName
                                  .toString(),
                              style: getTextStyle(
                                  14, FontWeight.w600, Colors.white),
                            ),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          style:
                              getTextStyle(14, FontWeight.w400, Colors.white),
                          children: [
                            const TextSpan(
                              text: 'Subject - ',
                            ),
                            TextSpan(
                              text: controller.selectedExam.value.subjectsName
                                  .toString(),
                              style: getTextStyle(
                                  14, FontWeight.w600, Colors.white),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              style: getTextStyle(
                                  14, FontWeight.w400, Colors.white),
                              children: [
                                const TextSpan(
                                  text: 'Total Questions - ',
                                ),
                                TextSpan(
                                  text: controller
                                      .selectedExam.value.totalQuestions
                                      .toString(),
                                  style: getTextStyle(
                                      14, FontWeight.w400, Colors.white),
                                ),
                              ],
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              style: getTextStyle(
                                  14, FontWeight.w400, Colors.white),
                              children: [
                                const TextSpan(
                                  text: 'Date - ',
                                ),
                                TextSpan(
                                  text: dateString,
                                  style: getTextStyle(
                                      14, FontWeight.w400, Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              style: getTextStyle(
                                  14, FontWeight.w400, Colors.white),
                              children: [
                                const TextSpan(
                                  text: 'Correctly Answered - ',
                                ),
                                TextSpan(
                                  text: '4',
                                  //controller.selectedExam.value.totalQuestions .toString(),
                                  style: getTextStyle(
                                      14, FontWeight.w400, Colors.white),
                                ),
                              ],
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              style: getTextStyle(
                                  14, FontWeight.w400, Colors.white),
                              children: [
                                const TextSpan(
                                  text: 'Time Spend - ',
                                ),
                                TextSpan(
                                  text: '0.1.30',
                                  // text: dateString,
                                  style: getTextStyle(
                                      14, FontWeight.w400, Colors.white),
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
                        child: Text(
                          '16%',
                          style:
                              getTextStyle(16, FontWeight.w600, Colors.white),
                        ),
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: ColorManager.brandColor),
                  borderRadius: BorderRadius.circular(8),
                  color: currentTheme.getCurrentTheme() == ThemeMode.dark
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
      ),
    ));
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
  final controller = Get.put(ExamViewModel());

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

  Obx buildSliverList(ExamViewModel homeController) {
    return Obx(() {
      switch (homeController.rxQARequestStatus.value) {
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
              childCount: homeController.qaList.length,
              (context, index) => buildQAListItem(homeController, index),
            ),
          );
      }
    });
  }

  Widget buildQAListItem(ExamViewModel homeController, int index) {
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
            Html(data: homeController.qaList[index].question.toString()),
            ListTile(
              dense: true,
              contentPadding: EdgeInsets.zero,
              leading: const Icon(
                FeatherIcons.checkSquare,
                color: Colors.green,
              ),
              title: (homeController.qaList[index].answer == 1)
                  ? Html(data: homeController.qaList[index].option1.toString())
                  : (homeController.qaList[index].answer == 2)
                      ? Html(
                          data: homeController.qaList[index].option2.toString())
                      : (homeController.qaList[index].answer == 3)
                          ? Html(
                              data: homeController.qaList[index].option3
                                  .toString())
                          : Html(
                              data: homeController.qaList[index].option4
                                  .toString()),
            ),
            ListTile(
              dense: true,
              contentPadding: EdgeInsets.zero,
              leading: const Icon(
                FeatherIcons.checkSquare,
                color: Colors.red,
              ),
              title: (homeController.qaList[index].answer == 4)
                  ? Html(data: homeController.qaList[index].option1.toString())
                  : (homeController.qaList[index].answer == 3)
                      ? Html(
                          data: homeController.qaList[index].option2.toString())
                      : (homeController.qaList[index].answer == 2)
                          ? Html(
                              data: homeController.qaList[index].option3
                                  .toString())
                          : Html(
                              data: homeController.qaList[index].option4
                                  .toString()),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0, bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Utils.snackBar('Explanation', 'No Explanation found.');
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
                      Utils.snackBar('Comments', 'No Comment found.');
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
  final controller = Get.put(ExamViewModel());

  @override
  Widget build(BuildContext context) {
    print('>>> Build Car Page');
    super.build(context);
    return CustomScrollView(
      slivers: [
        SliverPadding(padding: EdgeInsets.all(16)),
        buildSliverList(controller)
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;

  Obx buildSliverList(ExamViewModel homeController) {
    return Obx(() {
      switch (homeController.rxStudentRequestStatus.value) {
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
                    mainAxisSpacing: 8,crossAxisSpacing: 8,
                      crossAxisCount: 3),
                  delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    return Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: index % 2 == 0 ? Colors.green: Colors.red
                      ),
                      child: Center(
                        child: Text('${index + 1}'),
                      ),
                    );
                  }, childCount: homeController.qaList.length));
      }
    });
  }

  Widget buildStudentListItem(ExamViewModel homeController, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0),
      child: Container(
        width: Get.width - 48,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            color: currentTheme.getCurrentTheme() == ThemeMode.dark
                ? ColorManager.darkModeCard
                : Colors.white),
        child: ListTile(
          // leading: CircleAvatar(
          //   backgroundColor: ColorManager.brandColor,
          //   radius: 25,
          //   child: CachedNetworkImage(
          //     imageUrl: homeController.studentList[index].image.toString(),
          //   ),
          // ),
          title: Text(
            homeController.studentList[index].firstName.toString() +
                homeController.studentList[index].lastName.toString(),
            style: getTextStyle(16, FontWeight.w600, ColorManager.grayLight),
          ),
          subtitle: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                homeController.studentList[index].email.toString(),
                style: getTextStyle(
                    14,
                    FontWeight.w400,
                    currentTheme.getCurrentTheme() == ThemeMode.dark
                        ? Colors.white
                        : ColorManager.deepBlack),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (homeController.studentList[index].status.toString() ==
                        '1')
                      Container(
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(3)),
                          color: Colors.green.shade100,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Active',
                            style: getTextStyle(
                                12, FontWeight.w600, ColorManager.green),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
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
