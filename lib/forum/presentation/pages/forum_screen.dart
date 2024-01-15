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


class ForumScreen extends GetView<ForumDetailsViewModel>{
  const ForumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text(
            'Forum',
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
          Get.toNamed(AppRoutes.createNewTopicDetails);
        },
        child: Container(
          // height: 88,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: RoundButtonWidget(
              loading: false,
              title: 'Create New Topic',
              width: Get.width,
              height: 48,
              onPress: () {},
              textColor: Colors.white,
              buttonColor: ColorManager.brandColor,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 8,),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0,),
            decoration: BoxDecoration(
              border: Border.all(color: ColorManager.brandColor),
              borderRadius: BorderRadius.circular(8),
              color: currentTheme.getCurrentTheme() == ThemeMode.dark
                  ? Colors.black
                  : ColorManager.uiBackgroundColor,
            ),
            child: TabBar(
              labelColor: Colors.white,
              controller: controller.tabController,
              indicatorColor: Colors.transparent,
              unselectedLabelColor: ColorManager.brandColor,
              indicator: BoxDecoration(
                color: ColorManager.brandColor,
              ),
              labelPadding: const EdgeInsets.symmetric(horizontal: 10),
              tabs: const [
                Tab(
                  text: 'Public Topics',
                ),
                Tab(
                  text: 'My Topics',
                ),
              ],
              onTap: (index) {
                controller.tabIndex.value = index;
              },
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: controller.tabController,
              children: [
                Column(
                  children: [
                    Flexible(
                      child: ListView.builder(
                        itemCount: 10,
                        shrinkWrap: true,
                        itemBuilder: (context, index){
                          return GestureDetector(
                            child: Container(
                              height: 120,
                              margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0,),
                              padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0,),
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Math is a tough Subject', style: TextStyle(color: Color(0xffF12679),),),
                                  Row(
                                    children: [
                                      SvgPicture.asset('assets/icons/forum/user.svg', height: 18, width: 18,),
                                      sizeHor(10),
                                      const Text('Abraham', style: TextStyle(color: Colors.black,),),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SvgPicture.asset('assets/icons/forum/chat.svg', height: 18, width: 18,),
                                      sizeHor(10),
                                      const Text('8 replies', style: TextStyle(color: Colors.black,),),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SvgPicture.asset('assets/icons/forum/calendar.svg', height: 18, width: 18,),
                                      sizeHor(10),
                                      const Text('6 month ago (Last update - 4 month ago)', style: TextStyle(color: Colors.black,),),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            onTap: (){
                              Get.toNamed(AppRoutes.forumTopicDetails);
                            },
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/images/empty_screen.svg'),
                    const SizedBox(height: 10,),
                    const Text('Nothing here yet!', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500,
                      fontSize: 17,
                    ),),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}