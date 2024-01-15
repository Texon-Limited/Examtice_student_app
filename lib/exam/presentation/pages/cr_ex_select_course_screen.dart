import 'package:cached_network_image/cached_network_image.dart';
import 'package:examtice_teacher/auth/presentation/widgets/search_field_widget.dart';
import 'package:examtice_teacher/exam/models/course_list_response.dart';
import 'package:examtice_teacher/exam/models/subject_list_response.dart';
import 'package:examtice_teacher/exam/view_models/select_exam_vm.dart';
import 'package:examtice_teacher/home/models/student_list_response.dart';
import 'package:examtice_teacher/resources/RoundButtonWidget.dart';
import 'package:examtice_teacher/resources/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';

import '../../../home/presentation/pages/select_student_screen.dart';
import '../../../home/view_models/home_vm.dart';
import '../../../resources/AppConfigs.dart';
import '../../../resources/api_status.dart';
import '../../../resources/colors.dart';
import '../../../resources/constants.dart';
import '../../../resources/validators.dart';
import '../../view_models/select_course_vm.dart';
import '../widgets/selection_item.dart';

class SelectCourseScreen extends StatefulWidget {
  const SelectCourseScreen({Key? key}) : super(key: key);

  @override
  State<SelectCourseScreen> createState() => _SelectCourseScreenState();
}

class _SelectCourseScreenState extends State<SelectCourseScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SelectCourseViewModel());

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
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 80,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        'Select Your Course',
                        style: getTextStyle(16, FontWeight.w600, Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: InkWell(
            onTap: () {
              controller.goToTopicSelection();
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
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate([
                  Obx(() {
                    return Form(
                      key: controller.formKey,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: buildColumn(controller, context),
                      ),
                    );
                  }),
                ]),
              ),
            ],
          )),
    );
  }

  Column buildColumn(SelectCourseViewModel controller, BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Text("Exam Name",
        //     style: getTextStyle(
        //         16,
        //         FontWeight.w700,
        //         currentTheme.getCurrentTheme() == ThemeMode.dark
        //             ? Colors.white
        //             : ColorManager.deepBlack)),
        // sizeVer(6),
        // SearchWidget(
        //   controller: controller.examNameController.value,
        //   border: Border.all(color: ColorManager.grayBorder),
        //   backgroundColor: currentTheme.getCurrentTheme() == ThemeMode.dark
        //       ? ColorManager.darkModeCard
        //       : Colors.white,
        //   isEnabled: true,
        //   hintText: 'exam name here',
        //   validator: (value) => MyCustomValidator.validateMultiLine(value),
        // ),
        sizeVer(30),
        Text("Select Course",
            style: getTextStyle(16, FontWeight.w700,
              currentTheme.getCurrentTheme() == ThemeMode.dark ? Colors.white : ColorManager.deepBlack,
            ),
        ),
        sizeVer(6),
        Obx(() {
          switch (controller.rxRequestStatus.value) {
            case ApiStatus.loading:
            // return Text("loading");

            case ApiStatus.error:
            // return Text("error");
            case ApiStatus.completed:
              if (controller.allCourses.value.isNotEmpty) {
                return Container(
                  width: Get.width,
                  decoration: BoxDecoration(
                    border: Border.all(color: ColorManager.grayBorder),
                    borderRadius: BorderRadius.circular(4),
                    color: currentTheme.getCurrentTheme() == ThemeMode.dark
                        ? ColorManager.darkModeCard
                        : Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: DropdownButton<CourseDatum>(
                      underline: const SizedBox(),
                      isExpanded: true,
                      hint: const Text(
                        'Select your course',
                      ),
                      onChanged: (newValue) {
                        controller.setSelectedCourse(newValue);
                        // controller.selectedCourse.value = newValue!;
                        // controller.setSelectedCourse(newValue!);
                      },
                      value: controller.selectedCourse.value,
                      items: controller.allCourses.value.map((selectedType) {
                        return DropdownMenuItem<CourseDatum>(
                          value: selectedType,
                          child: Text(
                            selectedType.name.toString(),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                );
              } else {
                return const SizedBox();
              }
          }
        }),
        sizeVer(30),
        Text("Select Subject",
            style: getTextStyle(
                16,
                FontWeight.w700,
                currentTheme.getCurrentTheme() == ThemeMode.dark
                    ? Colors.white
                    : ColorManager.deepBlack)),
        Obx(() {
          switch (controller.rxSubjectListRequestStatus.value) {
            case ApiStatus.loading:
            // return Text("loading");

            case ApiStatus.error:
            // return Text("error");
            case ApiStatus.completed:
              if (controller.allSubjects.value.isNotEmpty) {
                return Container(
                  width: Get.width,
                  decoration: BoxDecoration(
                    border: Border.all(color: ColorManager.grayBorder),
                    borderRadius: BorderRadius.circular(4),
                    color: currentTheme.getCurrentTheme() == ThemeMode.dark
                        ? ColorManager.darkModeCard
                        : Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: DropdownButton<SubjectDatum>(
                      underline: const SizedBox(),
                      isExpanded: true,
                      hint: const Text(
                        'Select your subject',
                      ),
                      onChanged: (newValue) {
                        controller.setSelectedSubject(newValue!);
                      },
                      value: controller.selectedSubject.value,
                      items: controller.allSubjects.value.map((selectedType) {
                        return DropdownMenuItem<SubjectDatum>(
                          value: selectedType,
                          child: Text(
                            selectedType.name.toString(),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                );
              } else {
                return const SizedBox();
              }
          }
        }),
        sizeVer(30),
        Text("Select Year",
            style: getTextStyle(
                16,
                FontWeight.w700,
                currentTheme.getCurrentTheme() == ThemeMode.dark
                    ? Colors.white
                    : ColorManager.deepBlack)),
        Obx(() {
          switch (controller.rxYearListRequestStatus.value) {
            case ApiStatus.loading:
            // return Text("loading");

            case ApiStatus.error:
            // return Text("error");
            case ApiStatus.completed:
              if (controller.allYears.value.isNotEmpty) {
                return Container(
                  width: Get.width,
                  decoration: BoxDecoration(
                    border: Border.all(color: ColorManager.grayBorder),
                    borderRadius: BorderRadius.circular(4),
                    color: currentTheme.getCurrentTheme() == ThemeMode.dark
                        ? ColorManager.darkModeCard
                        : Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: DropdownButton<UserSelectedYearData>(
                      underline: const SizedBox(),
                      isExpanded: true,
                      hint: const Text(
                        'Select year',
                      ),
                      onChanged: (newValue) {
                        controller.setSelectedYear(newValue!);
                      },
                      value: controller.selectedYear.value,
                      items: controller.allYears.value.map((selectedType) {
                        return DropdownMenuItem<UserSelectedYearData>(
                          value: selectedType,
                          child: Text(
                            selectedType.value.toString(),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                );
              } else {
                return const SizedBox();
              }
          }
        }),
        // Obx(
        //   () => Container(
        //     width: Get.width,
        //     decoration: BoxDecoration(
        //       border: Border.all(color: ColorManager.grayBorder),
        //       borderRadius: BorderRadius.circular(4),
        //       color: currentTheme.getCurrentTheme() == ThemeMode.dark
        //           ? ColorManager.darkModeCard
        //           : Colors.white,
        //     ),
        //     child:
        //         // InkWell(
        //         //   onTap: () => _showDialog(
        //         //     CupertinoPicker(
        //         //       magnification: 1.22,
        //         //       squeeze: 1.2,
        //         //       useMagnifier: true,
        //         //       itemExtent: controller.kItemExtent,
        //         //       // This is called when selected item is changed.
        //         //       onSelectedItemChanged: (int selectedItem) {
        //         //         // setState(() {
        //         //         //   _selectedFruit = selectedItem;
        //         //         //
        //         //         // });
        //         //         controller.selectedYear.value =
        //         //         controller.yearsList[selectedItem];
        //         //         selectedYearGlobalData.value = controller.yearsList[selectedItem];
        //         //       },
        //         //       children: List<Widget>.generate(controller.yearsList.length,
        //         //               (int index) {
        //         //             return Center(
        //         //               child: Text(
        //         //                 controller.yearsList[index].toString(),
        //         //               ),
        //         //             );
        //         //           }),
        //         //     ),
        //         //   ),
        //         //   child: Padding(
        //         //     padding: const EdgeInsets.all(8.0),
        //         //     child: Row(
        //         //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         //       children: [
        //         //         Text(
        //         //           controller.selectedYear.toString(),
        //         //           style: TextStyle(fontSize: 25),
        //         //         ),
        //         //         Icon(Icons.arrow_drop_down)
        //         //       ],
        //         //     ),
        //         //   ),
        //         // ),
        //         MultiSelectDialogField(
        //           items: controller.yearItems,
        //           title: const Text("Select Year"),
        //           selectedColor: ColorManager.brandColor,
        //           selectedItemsTextStyle: getTextStyle(
        //               14,
        //               FontWeight.normal,
        //               currentTheme.getCurrentTheme() == ThemeMode.dark
        //                   ? Colors.white
        //                   : ColorManager.deepBlack),
        //           itemsTextStyle: getTextStyle(
        //               14,
        //               FontWeight.normal,
        //               currentTheme.getCurrentTheme() == ThemeMode.dark
        //                   ? Colors.white
        //                   : ColorManager.deepBlack),
        //           decoration: const BoxDecoration(
        //               // color: Colors.blue.withOpacity(0.1),
        //               // borderRadius: BorderRadius.all(Radius.circular(40)),
        //               // border: Border.all(
        //               //   color: Colors.blue,
        //               //   width: 2,
        //               // ),
        //               ),
        //           // buttonIcon: Icon(
        //           //   Icons.pets,
        //           //   color: Colors.blue,
        //           // ),
        //           buttonText: const Text(
        //             "Select Year",
        //             style: TextStyle(
        //               // color: Colors.blue[800],
        //               fontSize: 16,
        //             ),
        //           ),
        //           onConfirm: (results) {
        //             //_selectedAnimals = results;
        //             // controller.selectedYear.value =
        //             // controller.yearsList[selectedItem];
        //             // selectedYearGlobalData.value = controller.yearsList[selectedIte
        //             results.map((e) => {controller.yearsList.add(int.parse(e))});
        //             print(controller.yearsList);
        //           },
        //       ),
        //   ),
        // ),
      ],
    );
  }

  // This shows a CupertinoModalPopup with a reasonable fixed height which hosts CupertinoPicker.
  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => Container(
              height: 216,
              padding: const EdgeInsets.only(top: 6.0),
              // The Bottom margin is provided to align the popup above the system navigation bar.
              margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              // Provide a background color for the popup.
              color: CupertinoColors.systemBackground.resolveFrom(context),
              // Use a SafeArea widget to avoid system overlaps.
              child: SafeArea(
                top: false,
                child: child,
              ),
            ));
  }
}
