import 'package:cached_network_image/cached_network_image.dart';
import 'package:examtice_teacher/exam/view_models/select_topic_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../resources/AppConfigs.dart';
import '../../../resources/RoundButtonWidget.dart';
import '../../../resources/api_status.dart';
import '../../../resources/colors.dart';
import '../../../resources/constants.dart';
import '../../../resources/styles.dart';
import '../widgets/selection_item.dart';
import '../widgets/topic_selection_item_widget.dart';

class SelectTopicScreen extends GetView<SelectTopicViewModel> {
  const SelectTopicScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SelectTopicViewModel());

    return SafeArea(
      child: Scaffold(
          backgroundColor: currentTheme.getCurrentTheme() == ThemeMode.dark
              ? Colors.black
              : ColorManager.uiBackgroundColor,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(185), // Set this height
            child: AppBar(
              centerTitle: true,
              elevation: 0,
              title: Text(
                'Create Test',
                style: getTextStyle(16, FontWeight.w600, Colors.white),
              ),
              flexibleSpace: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(
                        AssetConstant.threeCircleIcon,
                      )),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 60,
                    ),
                    // SvgPicture.asset(AssetConstant.stepperSelectTopicIcon),
                    InkWell(
                      onTap: () {
                        controller.flagQuestion();
                      },
                      child: ListTile(
                        leading: (controller.isFlagSelected == false)
                            ? Icon(
                                Icons.toggle_off_outlined,
                                color: Colors.white,
                              )
                            : Icon(
                                Icons.toggle_on_outlined,
                                color: ColorManager.green,
                              ),
                        title: Text(
                          'Flag Questions',
                          style:
                              getTextStyle(16, FontWeight.w400, Colors.white),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        controller.randomQuestionSelection();
                      },
                      child: ListTile(
                        leading: (controller.isRandomQuestionSelected == false)
                            ? Icon(
                                Icons.toggle_off_outlined,
                                color: Colors.white,
                              )
                            : Icon(
                                Icons.toggle_on_outlined,
                                color: ColorManager.green,
                              ),
                        title: Text(
                          'Random Questions',
                          style:
                              getTextStyle(16, FontWeight.w400, Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: Row(
            children: [
              InkWell(
                onTap: () {
                  controller.getToTestDetailsScreen();
                },
                child: Container(
                  // height: 88,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: RoundButtonWidget(
                      loading: false,
                      title: 'Study',
                      width: Get.width / 2.5,
                      height: 48,
                      onPress: () {
                        controller.getToTestDetailsScreen();
                      },
                      textColor: Colors.white,
                      buttonColor: ColorManager.brandColor,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  controller.getToTestDetailsScreen();

                },
                child: Container(
                  // height: 88,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: RoundButtonWidget(
                      loading: false,
                      title: 'Exam',
                      width: Get.width / 2.5,
                      height: 48,
                      onPress: () {
                        controller.getToTestDetailsScreen();
                      },
                      textColor: Colors.white,
                      buttonColor: ColorManager.brandColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
          body: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                  child: InkWell(
                  onTap: () {
                    // controller.changeAllSelectionStatus(!controller.isAllSelected.value);
                  },
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // controller.isAllSelected.value
                      //     ? Padding(
                      //         padding: const EdgeInsets.all(8.0),
                      //         child: Icon(
                      //           Icons.check_box,
                      //           color: ColorManager.brandColor,
                      //           size: 16,
                      //         ),
                      //       )
                      //     : Padding(
                      //         padding: const EdgeInsets.all(8.0),
                      //         child: Icon(
                      //           Icons.check_box_outline_blank,
                      //           color: ColorManager.brandColor,
                      //           size: 16,
                      //         ),
                      //       ),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(
                      //       vertical: 8.0, horizontal: 0),
                      //   child: Container(
                      //     width: Get.width - 48,
                      //     decoration: BoxDecoration(
                      //         // borderRadius: const BorderRadius.all(Radius.circular(5)),
                      //
                      //         ),
                      //     child: ListTile(
                      //       title: Text(
                      //         'Select Topic',
                      //         style: getTextStyle(
                      //             16, FontWeight.w600, ColorManager.grayLight),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
              buildSliverList(controller)
            ],
          ),
      ),
    );
  }

  Obx buildSliverList(SelectTopicViewModel controller) {
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
              childCount: controller.allTopicList.length,
              (context, index) => buildStudentListItem(controller, index),
            ),
          );
      }
    });
  }

  Widget buildStudentListItem(SelectTopicViewModel homeController, int index) {
    return TopicSelectionItem(
        item: homeController.allTopicList[index],
        isSelectedCallBack: (value) {
          if (value) {
            print(value);

            controller.selectedTopicList
                .add(homeController.allTopicList[index]);
          } else {
            controller.selectedTopicList
                .remove(homeController.allTopicList[index]);
          }
          selectedTopicListGlobalData = controller.selectedTopicList;

          print(controller.selectedTopicList.length);
          print(selectedTopicListGlobalData.length);
        },
        key: Key(homeController.allTopicList[index].topicId.toString()),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0),
          child: Container(
            width: Get.width - 48,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                color: currentTheme.getCurrentTheme() == ThemeMode.dark
                    ? ColorManager.darkModeCard
                    : Colors.white),
            child: ListTile(
              title: Text(
                homeController.allTopicList[index].topicName.toString(),
                style:
                    getTextStyle(14, FontWeight.w400, ColorManager.grayLight),
              ),
              trailing: Text(
                homeController.allTopicList[index].count.toString(),
                style:
                    getTextStyle(14, FontWeight.w400, ColorManager.grayLight),
              ),
            ),
          ),
        ),
    );
  }
}
