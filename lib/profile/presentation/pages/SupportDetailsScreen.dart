import 'package:examtice_teacher/auth/presentation/widgets/search_field_widget.dart';
import 'package:examtice_teacher/profile/view_models/support_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../resources/AppConfigs.dart';
import '../../../resources/RoundButtonWidget.dart';
import '../../../resources/api_status.dart';
import '../../../resources/colors.dart';
import '../../../resources/constants.dart';
import '../../../resources/styles.dart';
import '../../../resources/utis.dart';
import '../../../resources/validators.dart';
import '../../../routes/app_routes.dart';

class SupportDetailsScreen extends GetView<SupportViewModel> {
  const SupportDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var tmp =
        DateTime.parse(controller.selectedSupport.value.createdAt.toString());
    var dateString = DateFormat.yMMMMd().format(tmp);

    return SafeArea(
        child: Scaffold(
      backgroundColor: currentTheme.getCurrentTheme() == ThemeMode.dark
          ? Colors.black
          : ColorManager.uiBackgroundColor,

      appBar: PreferredSize(

        preferredSize: const Size.fromHeight(166), // Set this height
        child: AppBar(
          centerTitle: true,
          elevation: 0,
          title: Text(
            'Ticket Details',
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  sizeVer(16),
                  Text(
                    controller.selectedSupport.value.title.toString(),
                    style: getTextStyle(16, FontWeight.w600, Colors.white),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          style:
                              getTextStyle(14, FontWeight.w400, Colors.white),
                          children: [
                            const TextSpan(
                              text: 'ID - ',
                            ),
                            TextSpan(
                              text: controller.selectedSupport.value.id
                                  .toString()
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
                              text: 'Status - ',
                            ),
                            TextSpan(
                              text:
                              (controller.selectedSupport.value.statusId == 3)? 'Open': 'Closed',
                              style: getTextStyle(
                                  14,
                                  FontWeight.w400,
                                  (controller.selectedSupport.value.statusId == 3)
                                      ? Colors.green
                                      : Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  RichText(
                    text: TextSpan(
                      style: getTextStyle(14, FontWeight.w400, Colors.white),
                      children: [
                        const TextSpan(
                          text: 'Date - ',
                        ),
                        TextSpan(
                          text: dateString,
                          style:
                              getTextStyle(14, FontWeight.w400, Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Wrap(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    direction: Axis.horizontal,
                    children: [
                      RichText(
                        text: TextSpan(
                          style:
                              getTextStyle(14, FontWeight.w400, Colors.white),
                          children: [
                            const TextSpan(
                              text: 'Category - ',
                            ),
                            TextSpan(
                              text: controller
                                  .selectedSupport.value.categoryName
                                  .toString() ,
                              style: getTextStyle(
                                  14, FontWeight.w400, Colors.white),
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
                              text: 'Content - ',
                            ),
                            TextSpan(
                              text: controller.selectedSupport.value.content
                                  .toString(),
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
            ),
          ),
        ),
      ),

      // bottomNavigationBar: InkWell(
      //   onTap: (){
      //     // Get.toNamed(AppRoutes.selectCourse);
      //   },
      //   child: Container(
      //     // height: 88,
      //     color: currentTheme.getCurrentTheme() == ThemeMode.dark
      //         ? Colors.black
      //         : ColorManager.uiBackgroundColor,
      //     child: Padding(
      //       padding: const EdgeInsets.all(18.0),
      //       child: RoundButtonWidget(
      //         loading: false,
      //         title: 'Create New Ticket',
      //         width: Get.width,
      //         height: 48,
      //         onPress: () {},
      //         textColor: Colors.white,
      //         buttonColor: ColorManager.brandColor,
      //       ),
      //     ),
      //   ),
      // ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CustomScrollView(slivers: [
            buildCommentHeader(),
            buildSupportListSection(controller),
            const SliverToBoxAdapter(
              child: SizedBox(height: 150),
            )
          ]),
          buildAddCommentSection(controller)
        ],
      ),
    ));
  }

  Obx buildAddCommentSection(SupportViewModel controller) {
    return Obx(() {
      switch (controller.rxRequestAddCommentsStatus.value) {
        case ApiStatus.loading:
          return const Center(
            child: CircularProgressIndicator(),
          );
        case ApiStatus.error:
          return const Center(
            child: Text(MessageConstant.errorMessage),
          );

        case ApiStatus.completed:
          return Container(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                // height: 88,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.red,
                    border: Border.all(color: ColorManager.grayLight)),
                child: SearchWidget(
                  controller: controller.emailController.value,
                  isEnabled: true,
                  suffixIcon: IconButton(
                    onPressed: () {
                      Get.focusScope!.unfocus();

                      if (controller.emailController.value.text.isNotEmpty ==
                          true) {
                        controller.callAddNewCommentApi();
                      } else {
                        Utils.toastMessage(MessageConstant.fieldEmptyMessage);
                      }
                      // controller.allCommentsList.refresh();
                    },
                    icon: Icon(
                      FeatherIcons.send,
                      color: ColorManager.brandColor,
                    ),
                  ),
                  border: Border.all(color: ColorManager.grayBorder),
                  backgroundColor:
                      currentTheme.getCurrentTheme() == ThemeMode.dark
                          ? ColorManager.darkModeCard
                          : Colors.white,
                  hintText: 'write your message',
                  validator: (value) =>
                      MyCustomValidator.validateMultiLine(value),
                ),
              ),
            ),
          );
      }
    });
  }

  SliverToBoxAdapter buildCommentHeader() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 0),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              HexColor.fromHex("#F0478C"),
              HexColor.fromHex("#CC0B5A"),
            ]),
          ),
          child: Text(
            'Comments',
            style: getTextStyle(16, FontWeight.w600, Colors.white),
          ),
        ),
      ),
    );
  }

  Obx buildSupportListSection(SupportViewModel controller) {
    return Obx(() {
      switch (controller.rxRequestCommentsStatus.value) {
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
              childCount: controller.allCommentsList.value.length,
              (context, index) => buildExamListItem(controller, index),
            ),
          );
      }
    });
  }

  buildExamListItem(SupportViewModel controller, int index) {
    var tmp = DateTime.parse(
        controller.allCommentsList.value[index].createdAt.toString());
    var dateString = DateFormat.yMMMMd().format(tmp);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            color: currentTheme.getCurrentTheme() == ThemeMode.dark
                ? ColorManager.darkModeCard
                : Colors.white),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    controller.allCommentsList.value[index].authorName
                        .toString(),
                    style: getTextStyle(
                        12,
                        FontWeight.w600,
                        currentTheme.getCurrentTheme() == ThemeMode.light
                            ? Colors.black
                            : Colors.white),
                  ),
                  Text(
                    dateString,
                    style: getTextStyle(
                        12,
                        FontWeight.w400,
                        currentTheme.getCurrentTheme() == ThemeMode.light
                            ? Colors.black12
                            : Colors.white54),
                  ),
                ],
              ),
              Text(
                controller.allCommentsList.value[index].commentText.toString(),
                style: getTextStyle(
                    12,
                    FontWeight.w400,
                    currentTheme.getCurrentTheme() == ThemeMode.light
                        ? Colors.black
                        : Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
