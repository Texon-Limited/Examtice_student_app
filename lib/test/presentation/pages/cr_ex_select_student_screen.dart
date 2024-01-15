import 'package:cached_network_image/cached_network_image.dart';
import 'package:examtice_teacher/auth/presentation/widgets/search_field_widget.dart';
import 'package:examtice_teacher/exam/view_models/select_exam_vm.dart';
import 'package:examtice_teacher/home/models/student_list_response.dart';
import 'package:examtice_teacher/resources/RoundButtonWidget.dart';
import 'package:examtice_teacher/resources/styles.dart';
import 'package:examtice_teacher/routes/app_routes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../home/presentation/pages/select_student_screen.dart';
import '../../../home/view_models/home_vm.dart';
import '../../../resources/AppConfigs.dart';
import '../../../resources/api_status.dart';
import '../../../resources/colors.dart';
import '../../../resources/constants.dart';
import '../widgets/selection_item.dart';

class CreateExamSelectStudentScreen extends GetView<SelectExamViewModel> {

  CreateExamSelectStudentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SelectExamViewModel());
    final homeController = Get.put(HomeViewModel());

    controller.selectedStudentList = homeController.eshopItemList;
    selectedListGlobalData = homeController.eshopItemList;

    if (kDebugMode) {
      print('selectedListGlobalData.length ${selectedListGlobalData.length}');
    }

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
                'Create New Exam',
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
                child: Column(
                  children: [
                    const SizedBox(
                      height: 90,
                    ),
                    SvgPicture.asset(AssetConstant.stepperSelectStudentsIcon),
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: InkWell(
            onTap: (){
              print(controller.selectedStudentList.length);

              Get.toNamed(AppRoutes.selectCourse);
            },
            child: Container(
              // height: 88,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: RoundButtonWidget(
                  loading: false,
                  title: 'Next',
                  width: Get.width,
                  height: 48,
                  onPress: () {},
                  textColor: Colors.white,
                  buttonColor: ColorManager.brandColor,
                ),
              ),
            ),
          ),
          body: CustomScrollView(
            slivers: [buildSliverList(homeController)],
          )),
    );
  }

  Obx buildSliverList(HomeViewModel homeController) {
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
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: homeController.eshopItemList.length,
              (context, index) => buildStudentListItem(homeController, index),
            ),
          );
      }
    });
  }

  Widget buildStudentListItem(HomeViewModel homeController, int index) {
    return StudentSelectionItem(
        item: homeController.eshopItemList[index],
        isSelectedCallBack: (value) {
          if (value) {
            print(value);

            controller.selectedStudentList.add(homeController.eshopItemList[index]);
          } else {
            controller.selectedStudentList.remove(homeController.eshopItemList[index]);
          }
          selectedListGlobalData = controller.selectedStudentList;
          if (kDebugMode) {
            print('selectedListGlobalData.length ${selectedListGlobalData.length}');
          }
        },
        key: Key(homeController.eshopItemList[index].id.toString()),
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
              leading: CircleAvatar(
                backgroundColor: ColorManager.brandColor,
                radius: 25,
                child: CachedNetworkImage(
                  imageUrl: homeController.eshopItemList[index].image.toString(),
                ),
              ),
              title: Text(
                homeController.eshopItemList[index].firstName.toString() +
                    homeController.eshopItemList[index].lastName.toString(),
                style:
                    getTextStyle(16, FontWeight.w600, ColorManager.grayLight),
              ),
              subtitle: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    homeController.eshopItemList[index].email.toString(),
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
                        if (homeController.eshopItemList[index].status
                                .toString() ==
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
        ));
  }
}

