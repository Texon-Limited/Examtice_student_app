import 'package:examtice_teacher/auth/presentation/widgets/search_field_widget.dart';
import 'package:examtice_teacher/resources/styles.dart';
import 'package:examtice_teacher/resources/utis.dart';
import 'package:examtice_teacher/students/view_models/students_screen_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../exam/presentation/widgets/empty_widget.dart';
import '../../../resources/AppConfigs.dart';
import '../../../resources/api_status.dart';
import '../../../resources/colors.dart';
import '../../../resources/constants.dart';

class SubscribedTeacherParentScreen extends GetView<StudentsViewModel> {
  const SubscribedTeacherParentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(StudentsViewModel());

    return SafeArea(
      child: Scaffold(
        backgroundColor: currentTheme.getCurrentTheme() == ThemeMode.dark
            ? Colors.black
            : ColorManager.uiBackgroundColor,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Teacher/Parent List',
            style: getTextStyle(16, FontWeight.w600, Colors.white),
          ),
          flexibleSpace: Container(
              decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              HexColor.fromHex("#F0478C"),
              HexColor.fromHex("#CC0B5A"),
            ]),
          )),
        ),
        body: Stack(
          children: [
            CustomScrollView(slivers: [
              // buildSearchSection(controller),

              SliverToBoxAdapter(
                child: SizedBox(
                  height: 32,
                ),
              ),

              ///accepted students
              buildSubscribeStudentsTitle(),
              buildSubscribeTeachersListSection(controller),

              ///waiting students
              buildWaitingStudentsTitle(),
              if (controller.waitingForConfirmationStudentList.isEmpty)
                const SliverToBoxAdapter(child: EmptyData()),
              buildWaitingStudentsListSection(controller),

              ///pending students
              buildPendingStudentsTitle(),
              if (controller.pendingStudentList.isEmpty)
                const SliverToBoxAdapter(child: EmptyData()),
              buildPendingStudentsListSection(controller),
            ]),
          ],
        ),
      ),
    );
  }

  Obx buildPendingStudentsListSection(StudentsViewModel controller) {
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
              childCount: controller.pendingStudentList.length,
              (context, index) => Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: currentTheme.getCurrentTheme() == ThemeMode.dark
                          ? ColorManager.darkModeCard
                          : Colors.white),
                  child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: ColorManager.brandColor,
                        radius: 25,
                      ),
                      title: Text(
                        '${controller.pendingStudentList[index].firstName.toString()}'
                        ' ${controller.pendingStudentList[index].lastName.toString()}',
                        style: getTextStyle(
                            16,
                            FontWeight.w600,
                            currentTheme.getCurrentTheme() == ThemeMode.dark
                                ? Colors.white
                                : ColorManager.grayLight),
                      ),
                      subtitle: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.pendingStudentList[index].email
                                .toString(),
                            style: getTextStyle(
                                14,
                                FontWeight.w400,
                                currentTheme.getCurrentTheme() == ThemeMode.dark
                                    ? Colors.white54
                                    : ColorManager.deepBlack),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(3)),
                                    color: Colors.green.shade100,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Active',
                                      style: getTextStyle(12, FontWeight.w600,
                                          ColorManager.green),
                                    ),
                                  ),
                                ),
                                sizeHor(8),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(3)),
                                    color: ColorManager.brandColor,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Report',
                                      style: getTextStyle(
                                          12, FontWeight.w600, Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      trailing: InkWell(
                        onTap: () {
                          Get.defaultDialog(
                            title: 'Delete Student',
                            content: Text('Are you sure?'),
                            textCancel: 'Cancel',
                            cancelTextColor: Colors.red,
                            textConfirm: 'Confirm',
                            confirmTextColor: Colors.green,
                            onCancel: () {
                              // Action to perform when the cancel button is pressed.
                            },
                            onConfirm: () {
                              // Action to perform when the confirm button is pressed.
                            },
                          );
                        },
                        child: CircleAvatar(
                          backgroundColor:
                              const Color.fromRGBO(247, 82, 82, 0.1),
                          child: SvgPicture.asset(AssetConstant.deleteIcon),
                        ),
                      )
                      // CircleAvatar(
                      //   backgroundColor: Color.fromRGBO(247, 82, 82, 0.1),
                      //   child: SvgPicture.asset(AssetConstant.deleteIcon),
                      // ),
                      ),
                ),
              ),
            ),
          );
      }
    });
  }

  SliverToBoxAdapter buildPendingStudentsTitle() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
        child: Text(
          'Pending for Confirmation',
          style: currentTheme.getCurrentTheme() == ThemeMode.dark
              ? getTextStyle(16, FontWeight.w600, Colors.white)
              : getTextStyle(16, FontWeight.w600, ColorManager.deepBlack),
        ),
      ),
    );
  }

  Obx buildWaitingStudentsListSection(StudentsViewModel controller) {
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
              childCount: controller.waitingForConfirmationStudentList.length,
              (context, index) => Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: currentTheme.getCurrentTheme() == ThemeMode.dark
                          ? ColorManager.darkModeCard
                          : Colors.white),
                  child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: ColorManager.brandColor,
                        radius: 25,
                      ),
                      title: Text(
                        '${controller.waitingForConfirmationStudentList[index].firstName.toString()}'
                        ' ${controller.waitingForConfirmationStudentList[index].lastName.toString()}',
                        style: getTextStyle(
                            16,
                            FontWeight.w600,
                            currentTheme.getCurrentTheme() == ThemeMode.dark
                                ? Colors.white
                                : ColorManager.grayLight),
                      ),
                      subtitle: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller
                                .waitingForConfirmationStudentList[index].email
                                .toString(),
                            style: getTextStyle(
                                14,
                                FontWeight.w400,
                                currentTheme.getCurrentTheme() == ThemeMode.dark
                                    ? Colors.white54
                                    : ColorManager.deepBlack),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(3)),
                                    color: Colors.green.shade100,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Active',
                                      style: getTextStyle(12, FontWeight.w600,
                                          ColorManager.green),
                                    ),
                                  ),
                                ),
                                sizeHor(8),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(3)),
                                    color: ColorManager.brandColor,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Report',
                                      style: getTextStyle(
                                          12, FontWeight.w600, Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      trailing: InkWell(
                        onTap: () {
                          Get.defaultDialog(
                            title: 'Delete Student',
                            content: Text('Are you sure?'),
                            textCancel: 'Cancel',
                            cancelTextColor: Colors.red,
                            textConfirm: 'Confirm',
                            confirmTextColor: Colors.green,
                            onCancel: () {
                              // Action to perform when the cancel button is pressed.
                            },
                            onConfirm: () {
                              // Action to perform when the confirm button is pressed.
                            },
                          );
                        },
                        child: CircleAvatar(
                          backgroundColor:
                              const Color.fromRGBO(247, 82, 82, 0.1),
                          child: SvgPicture.asset(AssetConstant.deleteIcon),
                        ),
                      )),
                ),
              ),
            ),
          );
      }
    });
  }

  SliverToBoxAdapter buildWaitingStudentsTitle() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
        child: Text(
          'Waiting for Confirmation',
          style: currentTheme.getCurrentTheme() == ThemeMode.dark
              ? getTextStyle(16, FontWeight.w600, Colors.white)
              : getTextStyle(16, FontWeight.w600, ColorManager.deepBlack),
        ),
      ),
    );
  }

  Obx buildSubscribeTeachersListSection(StudentsViewModel controller) {
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
              childCount: controller.acceptedStudentList.length,
              (context, index) => Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: currentTheme.getCurrentTheme() == ThemeMode.dark
                          ? ColorManager.darkModeCard
                          : Colors.white),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: ColorManager.brandColor,
                      radius: 25,
                    ),
                    title: Text(
                      '${controller.acceptedStudentList[index].firstName.toString()}'
                      ' ${controller.acceptedStudentList[index].lastName.toString()}',
                      style: getTextStyle(
                          16,
                          FontWeight.w600,
                          currentTheme.getCurrentTheme() == ThemeMode.dark
                              ? Colors.white
                              : ColorManager.grayLight),
                    ),
                    subtitle: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.acceptedStudentList[index].email
                              .toString(),
                          style: getTextStyle(
                              14,
                              FontWeight.w400,
                              currentTheme.getCurrentTheme() == ThemeMode.dark
                                  ? Colors.white54
                                  : ColorManager.deepBlack),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(3)),
                                  color: Colors.green.shade100,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Active',
                                    style: getTextStyle(12, FontWeight.w600,
                                        ColorManager.green),
                                  ),
                                ),
                              ),
                              sizeHor(8),
                              // Container(
                              //   decoration: BoxDecoration(
                              //     borderRadius:
                              //         BorderRadius.all(Radius.circular(3)),
                              //     color: ColorManager.brandColor,
                              //   ),
                              //   child: Padding(
                              //     padding: const EdgeInsets.all(8.0),
                              //     child: Text(
                              //       'Report',
                              //       style: getTextStyle(
                              //           12, FontWeight.w600, Colors.white),
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    trailing: InkWell(
                        onTap: () {
                          Get.defaultDialog(
                            title: 'Delete Student',
                            content: Text('Are you sure?'),
                            textCancel: 'Cancel',
                            cancelTextColor: Colors.red,
                            textConfirm: 'Confirm',
                            confirmTextColor: Colors.green,
                            onCancel: () {
                              // Action to perform when the cancel button is pressed.
                            },
                            onConfirm: () {
                              // Action to perform when the confirm button is pressed.
                            },
                          );
                        },
                        child: InkWell(
                          onTap: () {
                            Get.defaultDialog(
                              title: 'Delete Student',
                              content: Text('Are you sure?'),
                              textCancel: 'Cancel',
                              cancelTextColor: Colors.red,
                              textConfirm: 'Confirm',
                              confirmTextColor: Colors.green,
                              onCancel: () {
                                // Action to perform when the cancel button is pressed.
                              },
                              onConfirm: () {
                                // Action to perform when the confirm button is pressed.
                              },
                            );
                          },
                          child: CircleAvatar(
                            backgroundColor:
                                const Color.fromRGBO(247, 82, 82, 0.1),
                            child: SvgPicture.asset(AssetConstant.deleteIcon),
                          ),
                        )),
                  ),
                ),
              ),
            ),
          );
      }
    });
  }

  SliverToBoxAdapter buildSubscribeStudentsTitle() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
        child: Text(
          'List of Teacher/Parent',
          style: currentTheme.getCurrentTheme() == ThemeMode.dark
              ? getTextStyle(16, FontWeight.w600, Colors.white)
              : getTextStyle(16, FontWeight.w600, ColorManager.deepBlack),
        ),
      ),
    );
  }

  SliverToBoxAdapter buildSearchSection(StudentsViewModel controller) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0),
        child: ListTile(
          minVerticalPadding: 0,
          //contentPadding: EdgeInsets.zero,
          // horizontalTitleGap:0,
          title: SearchWidget(
            controller: controller.searchController.value,
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
            hintText: 'search student by email',
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
              borderRadius: BorderRadius.all(Radius.circular(5)),
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
