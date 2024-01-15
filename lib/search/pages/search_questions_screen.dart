import 'package:examtice_teacher/auth/presentation/widgets/search_field_widget.dart';
import 'package:examtice_teacher/search/pages/search_questions_list_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../exam/models/course_list_response.dart';
import '../../exam/models/subject_list_response.dart';
import '../../exam/view_models/select_course_vm.dart';
import '../../resources/AppConfigs.dart';
import '../../resources/RoundButtonWidget.dart';
import '../../resources/api_status.dart';
import '../../resources/colors.dart';
import '../../resources/constants.dart';
import '../../resources/styles.dart';

class SearchQuestionsScreen extends StatefulWidget {
  const SearchQuestionsScreen({Key? key}) : super(key: key);

  @override
  State<SearchQuestionsScreen> createState() => _SearchQuestionsScreenState();
}

class _SearchQuestionsScreenState extends State<SearchQuestionsScreen>
    with TickerProviderStateMixin {
  late TabController tabController;
  var tabIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    tabController = TabController(vsync: this, length: 2);
    tabController.addListener(() {
      if (tabController.indexIsChanging) {
      }
      // Tab Changed tapping on new tab
      else if (tabController.index != tabController.previousIndex) {
        tabIndex = tabController.index;
      }
      // Tab Changed swiping to a new tab

      // if(tabIndex == 1){
      //   callExamStudentDetailsApi();
      // }else{
      //   callQuestionAnswerAPI();
      // }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: currentTheme.getCurrentTheme() == ThemeMode.dark
          ? Colors.black
          : ColorManager.uiBackgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60), // Set this height
        child: AppBar(
          centerTitle: true,
          elevation: 0,
          title: Text(
            'Search/Feedback Questions',
            style: getTextStyle(16, FontWeight.w600, Colors.white),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(AssetConstant.threeCircleIcon)),
              // gradient: LinearGradient(colors: [
              //   HexColor.fromHex("#F0478C"),
              //   HexColor.fromHex("#CC0B5A"),
              // ]),
            ),
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: ColorManager.brandColor),
                  borderRadius: BorderRadius.circular(8),
                  color: currentTheme.getCurrentTheme() == ThemeMode.dark
                      ? Colors.black
                      : ColorManager.uiBackgroundColor),
              child: TabBar(
                labelColor: Colors.white,
                controller: tabController,
                indicatorColor: Colors.transparent,
                unselectedLabelColor: ColorManager.brandColor,
                indicator: BoxDecoration(
                  color: ColorManager.brandColor,
                ),
                tabs: const [
                  Tab(
                    text: 'Search Questions',
                  ),
                  Tab(
                    text: 'Feedback Question',
                  ),
                ],
                onTap: (index) {
                  tabIndex = index;
                },
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: const [
                  SearchQuestions(),
                  FeedbackQuestions(),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

class SearchQuestions extends StatefulWidget {
  const SearchQuestions({super.key});

  @override
  _SearchQuestionsState createState() => _SearchQuestionsState();
}

class _SearchQuestionsState extends State<SearchQuestions>
    with AutomaticKeepAliveClientMixin {
  final controller = Get.put(SelectCourseViewModel());

  var _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print('>>> _SearchQuestionsState Page');
    super.build(context);
    return CustomScrollView(
      slivers: [buildSliverList()],
    );
  }

  @override
  bool get wantKeepAlive => true;

  buildSliverList() {
    return SliverList(
      delegate: SliverChildListDelegate([
        Obx(() {
          return Form(
            key: controller.formKeyForSearch,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: buildColumn(controller, context),
            ),
          );
        }),
      ]),
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
            style: getTextStyle(
                16,
                FontWeight.w700,
                currentTheme.getCurrentTheme() == ThemeMode.dark
                    ? Colors.white
                    : ColorManager.deepBlack)),
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
                return SizedBox();
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

        Text("Select Type",
            style: getTextStyle(
                16,
                FontWeight.w700,
                currentTheme.getCurrentTheme() == ThemeMode.dark
                    ? Colors.white
                    : ColorManager.deepBlack)),

        Container(
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
            child: DropdownButton<String>(
              underline: const SizedBox(),
              isExpanded: true,
              hint: const Text(
                'Select  Type',
              ),
              onChanged: (newValue) {
                controller.selectedType.value = newValue!;
              },
              value: controller.selectedType.value,
              items: controller.allType.map((selectedType) {
                return DropdownMenuItem<String>(
                  value: selectedType,
                  child: Text(
                    selectedType.toString(),
                  ),
                );
              }).toList(),
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0),
          child: SearchWidget(
            controller: _searchController,
            isEnabled: true,
            hintText: 'Search Questions',
            border: Border.all(color: ColorManager.grayBorder),
            backgroundColor: currentTheme.getCurrentTheme() == ThemeMode.dark
                ? ColorManager.darkModeCard
                : Colors.white,
          ),
        ),

        InkWell(
          onTap: () {
            Get.to(SearchQuestionListScreen());
          },
          child: RoundButtonWidget(
            loading: false,
            title: 'Search',
            width: Get.width,
            height: 48,
            onPress: () {},
            textColor: Colors.white,
            buttonColor: ColorManager.brandColor,
          ),
        ),

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

class FeedbackQuestions extends StatefulWidget {
  const FeedbackQuestions({super.key});

  @override
  _FeedbackQuestionsState createState() => _FeedbackQuestionsState();
}

class _FeedbackQuestionsState extends State<FeedbackQuestions>
    with AutomaticKeepAliveClientMixin {

  final controller = Get.put(SelectCourseViewModel());
  var _questionController = TextEditingController();
  var _option1Controller = TextEditingController();
  var _option2Controller = TextEditingController();
  var _option3Controller = TextEditingController();
  var _option4Controller = TextEditingController();
  var _explanationController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    print('>>> Build Car Page');
    super.build(context);
    return CustomScrollView(
      slivers: [buildFeedbackList()],
    );
  }

  buildFeedbackList() {
    return SliverList(
      delegate: SliverChildListDelegate([
        Obx(() {
          return Form(
            key: controller.formKeyForFeedback,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: buildFeedbackColumn(controller, context),
            ),
          );
        }),
      ]),
    );
  }

  Column buildFeedbackColumn(
      SelectCourseViewModel controller, BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         sizeVer(30),
        Text("Select Course",
            style: getTextStyle(
                16,
                FontWeight.w700,
                currentTheme.getCurrentTheme() == ThemeMode.dark
                    ? Colors.white
                    : ColorManager.deepBlack)),
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
                return SizedBox();
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

        Text("Select Type",
            style: getTextStyle(
                16,
                FontWeight.w700,
                currentTheme.getCurrentTheme() == ThemeMode.dark
                    ? Colors.white
                    : ColorManager.deepBlack)),

        Container(
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
            child: DropdownButton<String>(
              underline: const SizedBox(),
              isExpanded: true,
              hint: const Text(
                'Select  Type',
              ),
              onChanged: (newValue) {
                controller.selectedType.value = newValue!;
              },
              value: controller.selectedType.value,
              items: controller.allType.map((selectedType) {
                return DropdownMenuItem<String>(
                  value: selectedType,
                  child: Text(
                    selectedType.toString(),
                  ),
                );
              }).toList(),
            ),
          ),
        ),

        sizeVer(30),

        Text("Question",
            style: getTextStyle(
                16,
                FontWeight.w700,
                currentTheme.getCurrentTheme() == ThemeMode.dark
                    ? Colors.white
                    : ColorManager.deepBlack)),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0),
          child: SearchWidget(
            controller: _questionController,
            isEnabled: true,
            hintText: 'Question',
            border: Border.all(color: ColorManager.grayBorder),
            backgroundColor: currentTheme.getCurrentTheme() == ThemeMode.dark
                ? ColorManager.darkModeCard
                : Colors.white,
          ),
        ),

        if( controller.selectedType.value == 'Multi-choice Questions')
          Column(
            children: [
              ///1
              Text("Option 1",
                  style: getTextStyle(
                      16,
                      FontWeight.w700,
                      currentTheme.getCurrentTheme() == ThemeMode.dark
                          ? Colors.white
                          : ColorManager.deepBlack)),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                child: SearchWidget(
                  controller: _option1Controller,
                  isEnabled: true,
                  hintText: 'answer',
                  border: Border.all(color: ColorManager.grayBorder),
                  backgroundColor: currentTheme.getCurrentTheme() == ThemeMode.dark
                      ? ColorManager.darkModeCard
                      : Colors.white,
                ),
              ),
              ///2
              Text("Option 2",
                  style: getTextStyle(
                      16,
                      FontWeight.w700,
                      currentTheme.getCurrentTheme() == ThemeMode.dark
                          ? Colors.white
                          : ColorManager.deepBlack)),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                child: SearchWidget(
                  controller: _option2Controller,
                  isEnabled: true,
                  hintText: 'answer',
                  border: Border.all(color: ColorManager.grayBorder),
                  backgroundColor: currentTheme.getCurrentTheme() == ThemeMode.dark
                      ? ColorManager.darkModeCard
                      : Colors.white,
                ),
              ),

              ///3
              Text("Option 3",
                  style: getTextStyle(
                      16,
                      FontWeight.w700,
                      currentTheme.getCurrentTheme() == ThemeMode.dark
                          ? Colors.white
                          : ColorManager.deepBlack)),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                child: SearchWidget(
                  controller: _option3Controller,
                  isEnabled: true,
                  hintText: 'answer',
                  border: Border.all(color: ColorManager.grayBorder),
                  backgroundColor: currentTheme.getCurrentTheme() == ThemeMode.dark
                      ? ColorManager.darkModeCard
                      : Colors.white,
                ),
              ),
              ///4
              Text("Option 4",
                  style: getTextStyle(
                      16,
                      FontWeight.w700,
                      currentTheme.getCurrentTheme() == ThemeMode.dark
                          ? Colors.white
                          : ColorManager.deepBlack)),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                child: SearchWidget(
                  controller: _option4Controller,
                  isEnabled: true,
                  hintText: 'answer',
                  border: Border.all(color: ColorManager.grayBorder),
                  backgroundColor: currentTheme.getCurrentTheme() == ThemeMode.dark
                      ? ColorManager.darkModeCard
                      : Colors.white,
                ),
              ),

            ],
          ),
        Text("Explanations",
            style: getTextStyle(
                16,
                FontWeight.w700,
                currentTheme.getCurrentTheme() == ThemeMode.dark
                    ? Colors.white
                    : ColorManager.deepBlack)),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0),
          child: SearchWidget(
            controller: _explanationController,
            isEnabled: true,
            hintText: 'explanations',
            border: Border.all(color: ColorManager.grayBorder),
            backgroundColor: currentTheme.getCurrentTheme() == ThemeMode.dark
                ? ColorManager.darkModeCard
                : Colors.white,
          ),
        ),

        InkWell(
          onTap: () {
            Get.to(SearchQuestionListScreen());
          },
          child: RoundButtonWidget(
            loading: false,
            title: 'Save Feedback',
            width: Get.width,
            height: 48,
            onPress: () {},
            textColor: Colors.white,
            buttonColor: ColorManager.brandColor,
          ),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
