import 'package:examtice_teacher/profile/view_models/support_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../resources/AppConfigs.dart';
import '../../../resources/api_status.dart';
import '../../../resources/colors.dart';
import '../../../resources/constants.dart';
import '../../../resources/styles.dart';
import '../../../routes/app_routes.dart';

class SupportScreen extends GetView<SupportViewModel> {
  const SupportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(SupportViewModel());

    return SafeArea(

      child: Scaffold(
        backgroundColor: currentTheme.getCurrentTheme() == ThemeMode.dark
            ? Colors.black
            : ColorManager.uiBackgroundColor,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Support',
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
        floatingActionButton: Align(
          alignment: const Alignment(1, 0.7),
          child: InkWell(
            onTap: (){
              Get.toNamed(AppRoutes.supportCreate);
            },
            child: CircleAvatar(
              backgroundColor: ColorManager.brandColor,
              radius: 28,
              child: const Icon(
                FeatherIcons.plus,
                color: Colors.white,
              ),
            ),
          ),
        ),
        body: Stack(
          children: [
            CustomScrollView(slivers: [
              buildSupportListSection(controller),
            ]),
          ],
        ),
      ),
    );

  }

  Obx buildSupportListSection(SupportViewModel controller) {
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
              childCount: controller.allSupportList.value.length,
                  (context, index) => InkWell(
                  onTap: () {
                    print('on tap called');
                    controller.setSelectedSupportTicket(controller.allSupportList.value[index]);

                    Get.toNamed(AppRoutes.supportDetails);
                  }, child: buildExamListItem(controller, index)),
            ),
          );
      }
    });
  }

  buildExamListItem(SupportViewModel controller, int index) {

    var tmp = DateTime.parse(controller.allSupportList.value[index].createdAt.toString());
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
                  Text(
                    controller.allSupportList.value[index].title.toString(),
                    style: getTextStyle(
                        16, FontWeight.w600, ColorManager.brandColor),
                  ),
                  RichText(
                    text: TextSpan(
                      style: getTextStyle(
                          14, FontWeight.w400, ColorManager.grayLight),
                      children: [
                        const TextSpan(
                          text: 'Status - ',
                        ),
                        TextSpan(
                          text:
                          (controller.allSupportList.value[index].statusId == 3)? 'Open': 'Closed',
                          style: getTextStyle(
                              14,
                              FontWeight.w400,
                              (controller.allSupportList.value[index].statusId == 3)
                              ? Colors.green
                                  : Colors.red),
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
                              14, FontWeight.w400, ColorManager.grayLight),
                          children: [
                            const TextSpan(
                              text: 'Category - ',
                            ),
                            TextSpan(
                              text: controller.allSupportList.value[index].categoryName.toString()
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

}
