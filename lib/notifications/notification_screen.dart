import 'package:cached_network_image/cached_network_image.dart';
import 'package:examtice_teacher/main.dart';
import 'package:examtice_teacher/profile/view_models/profile_vm.dart';
import 'package:examtice_teacher/profile/view_models/support_vm.dart';
import 'package:examtice_teacher/resources/AppConfigs.dart';
import 'package:examtice_teacher/resources/constants.dart';
import 'package:examtice_teacher/routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../auth/presentation/widgets/search_field_widget.dart';
import '../../../resources/RoundButtonWidget.dart';
import '../../../resources/colors.dart';
import '../../../resources/styles.dart';
import '../../../resources/utis.dart';
import '../../../resources/validators.dart';
import '../../../splash/presentation/pages/on_bording_screen.dart';
import '../resources/api_status.dart';
import 'notification_vm.dart';

class NotificationScreen extends GetView<NotificationViewModel> {
  NotificationScreen({Key? key}) : super(key: key);
//
//   @override
//   State<ProfileScreen> createState() => _ProfileScreenState();
// }
//
// class _ProfileScreenState extends State<ProfileScreen> {

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NotificationViewModel());

    return SafeArea(
      child: Scaffold(
          backgroundColor: currentTheme.getCurrentTheme() == ThemeMode.dark
              ? Colors.black
              : ColorManager.uiBackgroundColor,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50), // Set this height
            child: AppBar(
              centerTitle: true,
              elevation: 0,
              title: Text(
                'Notifications',
                style: getTextStyle(16, FontWeight.w600, Colors.white),
              ),
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  // image: DecorationImage(
                  //     image: AssetImage(AssetConstant.threeCircleIcon)),
                  gradient: LinearGradient(colors: [
                    HexColor.fromHex("#F0478C"),
                    HexColor.fromHex("#CC0B5A"),
                  ]),
                ),
              ),
            ),
          ),
          body: CustomScrollView(
            slivers: [
              buildSubscribeStudentListSection(controller),
            ],
          )),
    );
  }

  Obx buildSubscribeStudentListSection(NotificationViewModel controller) {
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
          if (controller.studentList.isEmpty) {
            return const SliverToBoxAdapter(
              child: Center(
                child: Text(MessageConstant.noDataMessage),
              ),
            );
          } else {
            return SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: controller.studentList.length,
                (context, index) => buildStudentListItem(controller, index),
              ),
            );
          }
      }
    });
  }

  Widget buildStudentListItem(NotificationViewModel controller, int index) {
    var tmp =
        DateTime.parse(controller.studentList[index].createdAt.toString());
    var dateString = DateFormat.yMMMMd().format(tmp);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            color: currentTheme.getCurrentTheme() == ThemeMode.dark
                ? ColorManager.darkModeCard
                : Colors.white),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.yellow,
            radius: 25,
            child: Icon(
              FeatherIcons.bell,
              color: Colors.deepOrangeAccent,
            ),
          ),
          title: Text(
            controller.studentList[index].noticeText.toString(),
            style: getTextStyle(16, FontWeight.w600, ColorManager.grayLight),
          ),
          subtitle: Text(
            dateString,
            style: getTextStyle(
                12,
                FontWeight.w400,
                currentTheme.getCurrentTheme() == ThemeMode.dark
                    ? Colors.white
                    : ColorManager.deepBlack),
          ),
        ),
      ),
    );
  }
}
