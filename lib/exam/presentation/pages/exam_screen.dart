import 'package:examtice_teacher/auth/presentation/widgets/search_field_widget.dart';
import 'package:examtice_teacher/exam/view_models/exam_screen_vm.dart';
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
import '../../../resources/api_status.dart';
import '../../../resources/colors.dart';
import '../../../resources/constants.dart';

class LMSExamScreen extends GetView<ExamViewModel> {
  LMSExamScreen({Key? key}) : super(key: key);

//   @override
//   State<ExamScreen> createState() => _ExamScreenState();
// }
//
// class _ExamScreenState extends State<ExamScreen> {

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ExamViewModel());

    return SafeArea(
      child: Scaffold(
        backgroundColor: currentTheme.getCurrentTheme() == ThemeMode.dark
            ? Colors.black
            : ColorManager.uiBackgroundColor,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Exam List',
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0.0),
              child: InkWell(
                  onTap: () {}, child: const Icon(FeatherIcons.barChart)),
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
              // buildSearchSection(controller),
              buildExamListSection(controller),
            ]),
          ],
        ),
      ),
    );
  }

  Obx buildExamListSection(ExamViewModel controller) {
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
                    print('on tapp called');
                    controller.setSelectedExam(controller.examList[index]);
                    Get.toNamed(AppRoutes.examDetails);
                  }, child: buildExamListItem(controller, index)),
            ),
          );
      }
    });
  }

  Widget buildExamListItem(ExamViewModel controller, int index) {
    var tmp = DateTime.parse(controller.examList[index].createdAt.toString());
    var dateString = DateFormat.yMMMMd().format(tmp);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            color: currentTheme.getCurrentTheme() == ThemeMode.dark
                ? ColorManager.darkModeCard
                : Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 if(controller.examList[index].examName != null) Text(
                    '${controller.examList[index].examName.toString()} ',
                    style: getTextStyle(
                        16, FontWeight.w600, ColorManager.brandColor),
                  ),
                  RichText(
                    text: TextSpan(
                      style: getTextStyle(
                          14, FontWeight.w400, ColorManager.grayLight),
                      children: [
                        const TextSpan(
                          text: 'Created By - ',
                        ),
                        TextSpan(
                          text:
                             '${controller.examList[index].firstName ?? '' } '
                                 '${controller.examList[index].lastName ?? ''}',
                          style: getTextStyle(
                              14,
                              FontWeight.w400,
                              currentTheme.getCurrentTheme() == ThemeMode.dark
                                  ? Colors.white
                                  : ColorManager.deepBlack),
                        ),
                      ],
                    ),
                  ),
                  if(controller.examList[index].email != null)RichText(
                    text: TextSpan(
                      style: getTextStyle(
                          14, FontWeight.w400, ColorManager.grayLight),
                      children: [
                        const TextSpan(
                          text: 'Email - ',
                        ),
                        TextSpan(
                          text: controller.examList[index].email
                              .toString(),
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
                  if(controller.examList[index].coursesName != null)RichText(
                    text: TextSpan(
                      style: getTextStyle(
                          14, FontWeight.w400, ColorManager.grayLight),
                      children: [
                        const TextSpan(
                          text: 'Course - ',
                        ),
                        TextSpan(
                          text: ' ${controller.examList[index].coursesName}',
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
                  if(controller.examList[index].subjectsName != null)RichText(
                    text: TextSpan(
                      style: getTextStyle(
                          14, FontWeight.w400, ColorManager.grayLight),
                      children: [
                        const TextSpan(
                          text: 'Subject - ',
                        ),
                        TextSpan(
                          text: ' ${controller.examList[index].subjectsName}',
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
                  if(controller.examList[index].totalQuestions != null)Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
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
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter buildSearchSection(ExamViewModel controller) {
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
