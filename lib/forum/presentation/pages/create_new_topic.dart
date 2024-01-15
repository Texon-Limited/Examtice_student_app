import 'package:examtice_teacher/forum/view_models/forum_controller_vm.dart';
import 'package:examtice_teacher/resources/colors.dart';
import 'package:examtice_teacher/resources/constants.dart';
import 'package:examtice_teacher/resources/styles.dart';
import 'package:examtice_teacher/resources/utis.dart';
import 'package:examtice_teacher/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../resources/AppConfigs.dart';
import '../../../resources/RoundButtonWidget.dart';


class CreateNewTopicScreen extends GetView<ForumDetailsViewModel>{
  const CreateNewTopicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text(
          'Create New Topic',
          style: getTextStyle(
            16,
            FontWeight.w600,
            Colors.white,
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                HexColor.fromHex("#F0478C"),
                HexColor.fromHex("#CC0B5A"),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
          // Get.toNamed(AppRoutes.forum);
          Get.offNamedUntil(AppRoutes.forum, ModalRoute.withName(AppRoutes.homeScreen));
        },
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: RoundButtonWidget(
              loading: false,
              title: 'Create Topic',
              width: Get.width,
              height: 48,
              onPress: () {},
              textColor: Colors.white,
              buttonColor: ColorManager.brandColor,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              sizeVer(15),
              const Text('Title', style: TextStyle(fontWeight: FontWeight.w500,),),
              sizeVer(8),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  border: Border.all(color: Colors.grey, width: 0.6,),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 7),
                  child: TextFormField(
                    controller: controller.titleTextEditingController.value,
                    keyboardType: TextInputType.multiline,
                    minLines: 1,
                    maxLines: 4,
                    onChanged: (value) {
                      controller.titleTextEditingController.value.text = value;
                    },
                    style: const TextStyle(color: Colors.black),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      filled: false,
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                      hintText: 'Type here',
                    ),
                  ),
                ),
              ),
              sizeVer(15),
              const Text('Description', style: TextStyle(fontWeight: FontWeight.w500,),),
              sizeVer(8),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  border: Border.all(color: Colors.grey, width: 0.6,),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 7),
                  child: TextFormField(
                    controller: controller.descriptionTextEditingController.value,
                    keyboardType: TextInputType.multiline,
                    maxLines: 4,
                    onChanged: (value) {
                      controller.descriptionTextEditingController.value.text = value;
                    },
                    style: const TextStyle(color: Colors.black),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      filled: false,
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                      hintText: 'Type here',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}