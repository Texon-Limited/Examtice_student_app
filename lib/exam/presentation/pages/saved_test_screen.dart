import 'package:examtice_teacher/auth/presentation/widgets/search_field_widget.dart';
import 'package:examtice_teacher/exam/view_models/saved_test_view_model.dart';
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

class SavedTestScreen extends GetView<SavedTestViewModel> {
  SavedTestScreen({Key? key}) : super(key: key);

//   @override
//   State<ExamScreen> createState() => _ExamScreenState();
// }
//
// class _ExamScreenState extends State<ExamScreen> {

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SavedTestViewModel());

    return SafeArea(
      child: Scaffold(
        backgroundColor: currentTheme.getCurrentTheme() == ThemeMode.dark
            ? Colors.black
            : ColorManager.uiBackgroundColor,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Saved Test',
            style: getTextStyle(16, FontWeight.w600, Colors.white),
          ),
          flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  HexColor.fromHex("#F0478C"),
                  HexColor.fromHex("#CC0B5A"),
                ]),
              )),
          iconTheme: IconThemeData(
            color: currentTheme.getCurrentTheme() == ThemeMode.dark
                ? ColorManager.uiBackgroundColor
                : Colors.black,
          ),
          actions: [
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 0.0),
            //   child: InkWell(
            //       onTap: () {}, child: const Icon(FeatherIcons.barChart)),
            // ),
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
        // drawer: const LeftMenuDrawer(),
        // bottomNavigationBar: InkWell(
        //   onTap: () {
        //     Get.toNamed(AppRoutes.selectCourse);
        //   },
        //   // child: CircleAvatar(
        //   //   backgroundColor: ColorManager.brandColor,
        //   //   radius: 28,
        //   //   child: const Icon(
        //   //     FeatherIcons.plus,
        //   //     color: Colors.white,
        //   //   ),
        //   // ),
        //   child: Container(
        //     height: 50.0,
        //     // width: MediaQuery.of(context).size.width - 30,
        //     alignment: Alignment.center,
        //     decoration: BoxDecoration(
        //       gradient: LinearGradient(
        //         colors: [
        //           HexColor.fromHex("#F0478C"),
        //           HexColor.fromHex("#CC0B5A"),
        //         ],
        //       ),
        //     ),
        //     child: const Text('Create New Test', style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500,),),
        //   ),
        // ),
        bottomNavigationBar: InkWell(
          onTap: () {
            Get.toNamed(AppRoutes.selectCourse);
          },
          child: Container(
            // height: 88,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: RoundButtonWidget(
                loading: false,
                title: 'Create New Test',
                width: Get.width,
                height: 48,
                onPress: () {},
                textColor: Colors.white,
                buttonColor: ColorManager.brandColor,
              ),
            ),
          ),
        ),
        body: Stack(
          children: [
            CustomScrollView(slivers: [
              // buildSearchSection(controller),
              buildExamListSection(controller),
            ]),
          ],
        ),
      ),
    );
  }

  Obx buildExamListSection(SavedTestViewModel controller) {
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
              childCount: controller.examList.length,
                  (context, index) => InkWell(
                  onTap: () {
                    print('testDetailsScreen tapp called');
                    controller.setSelectedTest(controller.examList[index]);
                    Get.toNamed(AppRoutes.testDetailsScreen);
                  },
                    child: buildExamListItem(controller, index),
                  ),
            ),
          );
      }
    });
  }

  Widget buildExamListItem(SavedTestViewModel controller, int index) {
    var tmp = DateTime.parse(controller.examList[index].createdAt.toString());
    var dateString = DateFormat.yMMMMd().format(tmp);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            color: currentTheme.getCurrentTheme() == ThemeMode.dark
                ? ColorManager.darkModeCard
                : Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 11,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if(controller.examList[index].courseName != null) Text(
                          '${controller.examList[index].courseName.toString()} ',
                          style: getTextStyle(
                              16, FontWeight.w600, ColorManager.brandColor,),
                        ),
                        // RichText(
                        //   text: TextSpan(
                        //     style: getTextStyle(
                        //         14, FontWeight.w400, ColorManager.grayLight),
                        //     children: [
                        //       const TextSpan(
                        //         text: 'Created By - ',
                        //       ),
                        //       TextSpan(
                        //         text:
                        //         '${controller.examList[index].firstName } ${controller.examList[index].lastName}',
                        //         style: getTextStyle(
                        //             14,
                        //             FontWeight.w400,
                        //             currentTheme.getCurrentTheme() == ThemeMode.dark
                        //                 ? Colors.white
                        //                 : ColorManager.deepBlack),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        // if(controller.examList[index].email != null)RichText(
                        //   text: TextSpan(
                        //     style: getTextStyle(
                        //         14, FontWeight.w400, ColorManager.grayLight),
                        //     children: [
                        //       const TextSpan(
                        //         text: 'Email - ',
                        //       ),
                        //       TextSpan(
                        //         text: controller.examList[index].email
                        //             .toString(),
                        //         style: getTextStyle(
                        //             14,
                        //             FontWeight.w400,
                        //             currentTheme.getCurrentTheme() == ThemeMode.dark
                        //                 ? Colors.white60
                        //                 : ColorManager.deepBlack),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        // if(controller.examList[index].courseName != null)RichText(
                        //   text: TextSpan(
                        //     style: getTextStyle(
                        //         14, FontWeight.w400, ColorManager.grayLight),
                        //     children: [
                        //       const TextSpan(
                        //         text: 'Course - ',
                        //       ),
                        //       TextSpan(
                        //         text: ' ${controller.examList[index].courseName}',
                        //         style: getTextStyle(
                        //             14,
                        //             FontWeight.w400,
                        //             currentTheme.getCurrentTheme() == ThemeMode.dark
                        //                 ? Colors.white60
                        //                 : ColorManager.deepBlack),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        ///
                        // if(controller.examList[index].courseName != null)RichText(
                        //   text: TextSpan(
                        //     style: getTextStyle(
                        //         14, FontWeight.w400, ColorManager.grayLight),
                        //     children: [
                        //       const TextSpan(
                        //         text: 'Course - ',
                        //       ),
                        //       TextSpan(
                        //         text: ' ${controller.examList[index].courseName}',
                        //         style: getTextStyle(
                        //             14,
                        //             FontWeight.w400,
                        //             currentTheme.getCurrentTheme() == ThemeMode.dark
                        //                 ? Colors.white60
                        //                 : ColorManager.deepBlack),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        if(controller.examList[index].subjectName != null)RichText(
                          text: TextSpan(
                            style: getTextStyle(
                                14, FontWeight.w400, ColorManager.grayLight),
                            children: [
                              const TextSpan(
                                text: 'Subject - ',
                              ),
                              TextSpan(
                                text: ' ${controller.examList[index].subjectName}',
                                style: getTextStyle(
                                    14,
                                    FontWeight.w400,
                                    currentTheme.getCurrentTheme() == ThemeMode.dark
                                        ? Colors.white60
                                        : ColorManager.deepBlack),
                              ),
                            ],
                          ),
                        ),
                         // Row(
                         //    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         //    crossAxisAlignment: CrossAxisAlignment.start,
                         //    children: [
                         //      if(controller.examList[index].totalQuestions != null)RichText(
                         //        text: TextSpan(
                         //          style: getTextStyle(
                         //              14, FontWeight.w400, ColorManager.grayLight),
                         //          children: [
                         //            const TextSpan(
                         //              text: 'Total Questions - ',
                         //            ),
                         //            TextSpan(
                         //              text: controller.examList[index].totalQuestions
                         //                  .toString(),
                         //              style: getTextStyle(
                         //                  14,
                         //                  FontWeight.w400,
                         //                  currentTheme.getCurrentTheme() ==
                         //                      ThemeMode.dark
                         //                      ? Colors.white70
                         //                      : ColorManager.deepBlack),
                         //            ),
                         //          ],
                         //        ),
                         //      ),
                         //      RichText(
                         //        text: TextSpan(
                         //          style: getTextStyle(
                         //              14, FontWeight.w400, ColorManager.grayLight),
                         //          children: [
                         //            const TextSpan(
                         //              text: 'Saved On - ',
                         //            ),
                         //            TextSpan(
                         //              text: dateString,
                         //              style: getTextStyle(
                         //                  14,
                         //                  FontWeight.w400,
                         //                  currentTheme.getCurrentTheme() ==
                         //                      ThemeMode.dark
                         //                      ? Colors.white70
                         //                      : ColorManager.deepBlack),
                         //            ),
                         //          ],
                         //        ),
                         //      ),
                         //    ],
                         //  ),
                        if(controller.examList[index].totalQuestions != null)RichText(
                          text: TextSpan(
                            style: getTextStyle(
                                14, FontWeight.w400, ColorManager.grayLight),
                            children: [
                              const TextSpan(
                                text: 'Total Questions - ',
                              ),
                              TextSpan(
                                text: controller.examList[index].totalQuestions
                                    .toString(),
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
                                text: 'Saved On - ',
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
                        // if(controller.examList[index].timeSpent != null)RichText(
                        //   text: TextSpan(
                        //     style: getTextStyle(
                        //         14, FontWeight.w400, ColorManager.grayLight),
                        //     children: [
                        //       const TextSpan(
                        //         text: 'Time Spent - ',
                        //       ),
                        //       TextSpan(
                        //         text: controller.examList[index].timeSpent.toString(),
                        //         style: getTextStyle(
                        //             14,
                        //             FontWeight.w400,
                        //             currentTheme.getCurrentTheme() ==
                        //                 ThemeMode.dark
                        //                 ? Colors.white70
                        //                 : ColorManager.deepBlack),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: SvgPicture.asset('assets/icons/delete.svg'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter buildSearchSection(SavedTestViewModel controller) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32.0),
        child: ListTile(
          minVerticalPadding: 0,
          //contentPadding: EdgeInsets.zero,
          // horizontalTitleGap:0,
          title: SearchWidget(
            controller: controller.searchController.value,
            validator: (value) => MyCustomValidator.validateMultiLine(value),
            suffixIcon: IconButton(
              onPressed: () {},
              icon: Icon(
                FeatherIcons.search,
                color: ColorManager.brandColor,
              ),
            ),
            border: Border.all(color: ColorManager.grayBorder),
            backgroundColor: currentTheme.getCurrentTheme() == ThemeMode.dark
                ? ColorManager.darkModeCard
                : Colors.white,
            isEnabled: true,
            hintText: 'search exam by name',
          ),
          // subtitle: Text(
          //   'John Martin ',
          //   style: getTextStyle(
          //       24, FontWeight.w600, ColorManager.deepBlack),
          // ),
          trailing: Container(
            width: 54,
            height: 48,
            decoration: BoxDecoration(
              color: currentTheme.getCurrentTheme() == ThemeMode.dark
                  ? ColorManager.darkModeCard
                  : Colors.white,
              border: Border.all(color: ColorManager.grayBorder),
              borderRadius: const BorderRadius.all(Radius.circular(5)),
            ),
            child: Icon(
              PhosphorIcons.funnel_simple,
              color: ColorManager.brandColor,
            ),
          ),
        ),
      ),
    );
  }

}
