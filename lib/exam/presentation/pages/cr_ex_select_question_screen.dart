import 'package:cached_network_image/cached_network_image.dart';
import 'package:examtice_teacher/exam/view_models/select_question_vm.dart';
import 'package:examtice_teacher/exam/view_models/select_topic_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../resources/AppConfigs.dart';
import '../../../resources/RoundButtonWidget.dart';
import '../../../resources/api_status.dart';
import '../../../resources/colors.dart';
import '../../../resources/constants.dart';
import '../../../resources/styles.dart';
import '../widgets/question_selection_widget.dart';
import '../widgets/selection_item.dart';
import '../widgets/topic_selection_item_widget.dart';

class SelectQuestionScreen extends GetView<SelectQuestionViewModel> {
  const SelectQuestionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SelectQuestionViewModel());

    return SafeArea(
      child: Scaffold(
          backgroundColor: currentTheme.getCurrentTheme() == ThemeMode.dark
              ? Colors.black
              : ColorManager.uiBackgroundColor,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(150), // Set this height
            child: AppBar(
              centerTitle: true,
              elevation: 0,
              title: Text(
                'Select Topic',
                style: getTextStyle(16, FontWeight.w600, Colors.white),
              ),
              flexibleSpace: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(AssetConstant.threeCircleIcon)),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 90,
                    ),
                    SvgPicture.asset(AssetConstant.stepperSelectQuestionIcon),
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: InkWell(
            onTap: () {
              controller.createQuestion();
            },
            child: Container(
              // height: 88,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: RoundButtonWidget(
                  loading: false,
                  title: 'Create Exam',
                  width: Get.width,
                  height: 48,
                  onPress: () {
                    controller.createQuestion();
                  },
                  textColor: Colors.white,
                  buttonColor: ColorManager.brandColor,
                ),
              ),
            ),
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
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 0),
                      child: Container(
                        width: Get.width - 48,
                        decoration: BoxDecoration(
                            // borderRadius: const BorderRadius.all(Radius.circular(5)),

                            ),
                        child: ListTile(
                          title: Text(
                            'Select Questions',
                            style: getTextStyle(
                                16, FontWeight.w600, ColorManager.grayLight),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )),
              buildSliverList(controller)
            ],
          )),
    );
  }

  Obx buildSliverList(SelectQuestionViewModel controller) {
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
              childCount: controller.allQuestionList.length,
              (context, index) => buildStudentListItem(controller, index),
            ),
          );
      }
    });
  }

  Widget buildStudentListItem(
      SelectQuestionViewModel homeController, int index) {

    return QuestionSelectionItem(
        item: homeController.allQuestionList[index],
        isSelectedCallBack: (value) {
          if (value) {
            print(value);

            controller.selectedQuestionList
                .add(homeController.allQuestionList[index]);
          } else {
            controller.selectedQuestionList
                .remove(homeController.allQuestionList[index]);
          }
          print(controller.selectedQuestionList.length);
        },
        key: Key(homeController.allQuestionList[index].id.toString()),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0),
          child: Container(
            width: Get.width - 48,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                color: currentTheme.getCurrentTheme() == ThemeMode.dark
                    ? ColorManager.darkModeCard
                    : Colors.white),
            child: Wrap(
              children: [
                ListTile(
                  dense: true,
                  title: Text(
                    homeController.allQuestionList[index].name.toString(),
                    style:
                        getTextStyle(14, FontWeight.w400, ColorManager.grayLight),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Text(homeController.allQuestionList[index].question.toString()),
                // ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Html(data: homeController.allQuestionList[index].question.toString(),),
                )
                //   data:'r${homeController.allQuestionList[index].question.toString()}',
                //   //homeController.allQuestionList[index].question.toString(),
                // ),
              ],
            ),
          ),
        ));
  }
}
const htmlData = """<div>
        <h1>Demo Page</h1>
        <p>This is a fantastic product that you should buy!</p>
        <h3>Features</h3>
        <ul>
          <li>It actually works</li>
          <li>It exists</li>
          <li>It doesn't cost much!</li>
        </ul>
        <!--You can pretty much put any html in here!-->
      </div>""";