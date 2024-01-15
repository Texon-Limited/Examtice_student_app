// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:examtice_teacher/exam/view_models/exam_screen_vm.dart';
// import 'package:examtice_teacher/exam/view_models/timer_controller.dart';
// import 'package:examtice_teacher/resources/utis.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_feather_icons/flutter_feather_icons.dart';
// import 'package:flutter_html/flutter_html.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
//
// import '../../../resources/AppConfigs.dart';
// import '../../../resources/RoundButtonWidget.dart';
// import '../../../resources/api_status.dart';
// import '../../../resources/colors.dart';
// import '../../../resources/constants.dart';
// import '../../../resources/styles.dart';
// import '../../view_models/saved_test_view_model.dart';
// import '../widgets/selection_item.dart';
//
// class TestDetailsScreen extends GetView<SavedTestViewModel> {
//   const TestDetailsScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(SavedTestViewModel());
//     final timerController = Get.put(TimerViewModel());
//
//     // var tmp =
//     //     DateTime.parse(controller.selectedExam.value.createdAt.toString());
//     // var dateString = DateFormat.yMMMMd().format(tmp);
//
//     return SafeArea(
//         child: Scaffold(
//       backgroundColor: currentTheme.getCurrentTheme() == ThemeMode.dark
//           ? Colors.black
//           : ColorManager.uiBackgroundColor,
//       appBar: PreferredSize(
//         preferredSize: const Size.fromHeight(300), // Set this height
//         child: AppBar(
//           centerTitle: true,
//           elevation: 0,
//           // title: Text(
//           //   'Exam Details',
//           //   style: getTextStyle(16, FontWeight.w600, Colors.white),
//           // ),
//           flexibleSpace: Container(
//             decoration: const BoxDecoration(
//               image: DecorationImage(
//                   fit: BoxFit.fill,
//                   image: AssetImage(AssetConstant.threeCircleIcon)),
//               // gradient: LinearGradient(colors: [
//               //   HexColor.fromHex("#F0478C"),
//               //   HexColor.fromHex("#CC0B5A"),
//               // ]),
//             ),
//             child: Padding(
//               padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   sizeVer(16),
//                   Obx(() => Center(
//                         child: Text(
//                           timerController.time.value,
//                           style: const TextStyle(
//                             fontSize: 30,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                   ),
//                   sizeVer(16),
//                   // RichText(
//                   //   text: TextSpan(
//                   //     style:
//                   //         getTextStyle(14, FontWeight.w400, Colors.white),
//                   //     children: [
//                   //       const TextSpan(
//                   //         text: 'Course - ',
//                   //       ),
//                   //       TextSpan(
//                   //         text: controller.selectedExam.value.coursesName
//                   //             .toString(),
//                   //         style: getTextStyle(
//                   //             14, FontWeight.w600, Colors.white),
//                   //       ),
//                   //     ],
//                   //   ),
//                   // ),
//                   // RichText(
//                   //   text: TextSpan(
//                   //     style:
//                   //         getTextStyle(14, FontWeight.w400, Colors.white),
//                   //     children: [
//                   //       const TextSpan(
//                   //         text: 'Subject - ',
//                   //       ),
//                   //       TextSpan(
//                   //         text: controller.selectedExam.value.subjectsName
//                   //             .toString(),
//                   //         style: getTextStyle(
//                   //             14, FontWeight.w600, Colors.white),
//                   //       ),
//                   //     ],
//                   //   ),
//                   // ),
//                   RichText(
//                     text: TextSpan(
//                       style: getTextStyle(20, FontWeight.w400, Colors.white),
//                       children: [
//                         const TextSpan(
//                           text: 'Total Questions - ',
//                         ),
//                         TextSpan(
//                           text: controller.selectedExam.value.totalQuestions
//                               .toString(),
//                           style:
//                               getTextStyle(14, FontWeight.w400, Colors.white),
//                         ),
//                       ],
//                     ),
//                   ),
//                   // Row(
//                   //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   //   crossAxisAlignment: CrossAxisAlignment.start,
//                   //   children: [
//                   //     RichText(
//                   //       text: TextSpan(
//                   //         style: getTextStyle(
//                   //             14, FontWeight.w400, Colors.white),
//                   //         children: [
//                   //           const TextSpan(
//                   //             text: 'Correctly Answered - ',
//                   //           ),
//                   //           TextSpan(
//                   //             text: '4',
//                   //             //controller.selectedExam.value.totalQuestions .toString(),
//                   //             style: getTextStyle(
//                   //                 14, FontWeight.w400, Colors.white),
//                   //           ),
//                   //         ],
//                   //       ),
//                   //     ),
//                   //     RichText(
//                   //       text: TextSpan(
//                   //         style: getTextStyle(
//                   //             14, FontWeight.w400, Colors.white),
//                   //         children: [
//                   //           const TextSpan(
//                   //             text: 'Time Spend - ',
//                   //           ),
//                   //           TextSpan(
//                   //             text: '0.1.30',
//                   //             // text: dateString,
//                   //             style: getTextStyle(
//                   //                 14, FontWeight.w400, Colors.white),
//                   //           ),
//                   //         ],
//                   //       ),
//                   //     ),
//                   //   ],
//                   // ),
//
//                   sizeVer(16),
//                   Row(
//                     children: [
//                       InkWell(
//                         onTap: () {
//                           // controller.getToTestDetailsScreen();
//                         },
//                         child: Container(
//                           // height: 88,
//                           color: Colors.transparent,
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: RoundButtonWidget(
//                               loading: false,
//                               title: 'Cancel Test',
//                               width: Get.width / 2.5,
//                               height: 48,
//                               onPress: () {
//                                 // controller.getToTestDetailsScreen();
//                               },
//                               textColor: Colors.white,
//                               buttonColor: ColorManager.brandColor,
//                             ),
//                           ),
//                         ),
//                       ),
//                       InkWell(
//                         onTap: () {
//                           // controller.getToTestDetailsScreen();
//                         },
//                         child: Container(
//                           // height: 88,
//                           color: Colors.transparent,
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: RoundButtonWidget(
//                               loading: false,
//                               title: 'Finish Test',
//                               width: Get.width / 2.5,
//                               height: 48,
//                               onPress: () {
//                                 // controller.getToTestDetailsScreen();
//                               },
//                               textColor: Colors.white,
//                               buttonColor: ColorManager.brandColor,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   InkWell(
//                     onTap: () {
//                       // controller.getToTestDetailsScreen();
//                     },
//                     child: Container(
//                       // height: 88,
//                       color: Colors.transparent,
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: RoundButtonWidget(
//                           loading: false,
//                           title: 'Save Test',
//                           width: Get.width / 2.5,
//                           height: 48,
//                           onPress: () {
//                             // controller.getToTestDetailsScreen();
//                           },
//                           textColor: Colors.white,
//                           buttonColor: ColorManager.brandColor,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             Container(
//               decoration: BoxDecoration(
//                   border: Border.all(color: ColorManager.brandColor),
//                   borderRadius: BorderRadius.circular(8),
//                   color: currentTheme.getCurrentTheme() == ThemeMode.dark
//                       ? Colors.black
//                       : ColorManager.uiBackgroundColor),
//               child: TabBar(
//                 labelColor: Colors.white,
//                 controller: controller.tabController,
//                 indicatorColor: Colors.transparent,
//                 unselectedLabelColor: ColorManager.brandColor,
//                 indicator: BoxDecoration(
//                   color: ColorManager.brandColor,
//                 ),
//                 tabs: const [
//                   Tab(
//                     text: 'Questions',
//                   ),
//                   Tab(
//                     text: 'Test Details',
//                   ),
//                 ],
//                 onTap: (index) {
//                   controller.tabIndex.value = index;
//                 },
//               ),
//             ),
//             Expanded(
//               child: TabBarView(
//                 controller: controller.tabController,
//                 children: const [
//                   QuestionsAndAnswerScreen(),
//                   StudentListPage(),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     ));
//   }
// }
//
// class QuestionsAndAnswerScreen extends StatefulWidget {
//   const QuestionsAndAnswerScreen({super.key});
//
//   @override
//   _QuestionsAndAnswerScreenState createState() =>
//       _QuestionsAndAnswerScreenState();
// }
//
// class _QuestionsAndAnswerScreenState extends State<QuestionsAndAnswerScreen>
//     with AutomaticKeepAliveClientMixin {
//   final controller = Get.put(SavedTestViewModel());
//
//   @override
//   Widget build(BuildContext context) {
//     print('>>> Build Car Page');
//     super.build(context);
//     return Stack(
//       alignment: AlignmentDirectional.bottomEnd,
//       children: [
//         CustomScrollView(
//           slivers: [
//             buildSliverList(controller),
//           ],
//         ),
//         Container(
//           decoration: BoxDecoration(
//             color: currentTheme.getCurrentTheme() == ThemeMode.dark
//                 ? Colors.black
//                 : ColorManager.uiBackgroundColor,
//           ),
//           child: Obx(() => Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               controller.currentQuestionsIndex.value == 0
//                   ? SizedBox(width: Get.width / 2.27,)
//                   : InkWell(
//                     onTap: () {
//                       if (controller.currentQuestionsIndex.value > 0) {
//                         controller.currentQuestionsIndex.value = controller.currentQuestionsIndex.value - 1;
//                       }
//                     },
//                     // child: Container(
//                     //   // height: 88,
//                     //   color: Colors.transparent,
//                     //   child: Padding(
//                     //     padding: const EdgeInsets.all(8.0),
//                     //     child: RoundButtonWidget(
//                     //       loading: false,
//                     //       title: '',
//                     //       width: Get.width / 2.5,
//                     //       height: 48,
//                     //       onPress: () {
//                     //         // controller.getToTestDetailsScreen();
//                     //       },
//                     //       textColor: Colors.white,
//                     //       buttonColor: ColorManager.brandColor,
//                     //       icon: Icons.arrow_back_ios_new,
//                     //     ),
//                     //     // child: Container(
//                     //     //   width: Get.width / 2.5,
//                     //     //   decoration: const BoxDecoration(
//                     //     //     color: Color(0xffF2F2F2),
//                     //     //   ),
//                     //     //   child: const Row(
//                     //     //     mainAxisAlignment: MainAxisAlignment.start,
//                     //     //     children: [
//                     //     //       Icon(Icons.arrow_back_ios_new,),
//                     //     //     ],
//                     //     //   ),
//                     //     // ),
//                     //   ),
//                     // ),
//                     child: Container(
//                       color: Colors.transparent,
//                       width: Get.width / 2.5,
//                       height: 50,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Container(
//                             padding: const EdgeInsets.all(15.0),
//                             decoration: BoxDecoration(
//                               color: const Color(0xffF2F2F2),
//                               borderRadius: BorderRadius.circular(5.0),
//                             ),
//                             child: const Icon(Icons.arrow_back_ios_new, color: Color(0xffF12679,), size: 17,),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//               controller.currentQuestionsIndex.value == controller.qaList.length-1
//                   ? InkWell(
//                     onTap: () {
//                       showModalBottomSheet(
//                         context: context,
//                         backgroundColor:  Colors.transparent,
//                         builder: (child){
//                           return Container(
//                             decoration: BoxDecoration(
//                               color: currentTheme.getCurrentTheme() == ThemeMode.dark
//                                   ? Colors.black
//                                   : Colors.white,
//                               borderRadius: const BorderRadius.only(
//                                 topLeft: Radius.circular(20.0),
//                                 topRight: Radius.circular(20.0),
//                               )
//                             ),
//                             child: Column(
//                               mainAxisSize: MainAxisSize.min,
//                               children: [
//                                 Image.asset('assets/images/confirm_finish.png', height: 100, width: 100,),
//                                 const SizedBox(height: 20.0,),
//                                 const Text('Are you sure to finish the exam?'),
//                                 const SizedBox(height: 20.0,),
//                                 InkWell(
//                                   onTap: (){
//
//                                   },
//                                   child: RoundButtonWidget(
//                                     loading: false,
//                                     title: 'Submit',
//                                     width: Get.width / 2.5,
//                                     height: 48,
//                                     onPress: () {},
//                                     textColor: Colors.white,
//                                     buttonColor: ColorManager.brandColor,
//                                   ),
//                                 ),
//                                 const SizedBox(height: 5.0,),
//                                 InkWell(
//                                   onTap: (){
//                                     Get.back();
//                                   },
//                                   child: RoundButtonWidget(
//                                     loading: false,
//                                     title: 'Back',
//                                     width: Get.width / 2.5,
//                                     height: 48,
//                                     onPress: () {},
//                                     textColor: const Color(0xffF12679),
//                                     buttonColor: Colors.transparent,
//                                   ),
//                                 )
//                               ],
//                             ),
//                           );
//                         },
//                       );
//                     },
//                     child: Container(
//                       color: Colors.transparent,
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: RoundButtonWidget(
//                           loading: false,
//                           title: 'Finish Exam',
//                           width: Get.width / 2.5,
//                           height: 48,
//                           onPress: () {},
//                           textColor: Colors.white,
//                           buttonColor: ColorManager.brandColor,
//                         ),
//                       ),
//                     ),
//                   )
//                   : InkWell(
//                     onTap: () {
//                       if (controller.currentQuestionsIndex.value < controller.qaList.length) {
//                         controller.currentQuestionsIndex.value = controller.currentQuestionsIndex.value + 1;
//                       }
//                     },
//                     child: Container(
//                       // height: 88,
//                       color: Colors.transparent,
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: RoundButtonWidget(
//                           loading: false,
//                           title: 'Next',
//                           width: Get.width / 2.5,
//                           height: 48,
//                           onPress: () {
//                             // controller.getToTestDetailsScreen();
//                           },
//                           textColor: Colors.white,
//                           buttonColor: ColorManager.brandColor,
//                           icon: Icons.arrow_forward_ios,
//                         ),
//                       ),
//                     ),
//                   ),
//             ],
//           ),),
//         )
//       ],
//     );
//   }
//
//   @override
//   bool get wantKeepAlive => true;
//
//   Obx buildSliverList(SavedTestViewModel homeController) {
//     return Obx(() {
//       switch (homeController.rxQARequestStatus.value) {
//         case ApiStatus.loading:
//           return const SliverToBoxAdapter(
//             child: Center(
//               child: CircularProgressIndicator(),
//             ),
//           );
//         case ApiStatus.error:
//           return const SliverToBoxAdapter(
//             child: Center(
//               child: Text(MessageConstant.errorMessage),
//             ),
//           );
//
//         case ApiStatus.completed:
//           return SliverToBoxAdapter(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0),
//               child: Container(
//                 width: Get.width - 48,
//                 decoration: BoxDecoration(
//                     borderRadius: const BorderRadius.all(Radius.circular(5)),
//                     color: currentTheme.getCurrentTheme() == ThemeMode.dark
//                         ? ColorManager.darkModeCard
//                         : Colors.white,
//                 ),
//                 child: IgnorePointer(
//                   ignoring: homeController.qaList[homeController.currentQuestionsIndex.value].isAttempt == true ? true: false,
//                   child: Column(
//                     // shrinkWrap: true,
//                     // mainAxisAlignment: MainAxisAlignment.start,
//                     // crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       // Padding(
//                       //   padding: const EdgeInsets.only(right: 8.0, bottom: 8,top: 16),
//                       //   child: Row(
//                       //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       //     children: [
//                       //     ],
//                       //   ),
//                       // ),
//                       Padding(
//                         padding: const EdgeInsets.only(right: 8.0, bottom: 8, top: 16,),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             InkWell(
//                               onTap: () {
//                                 Utils.snackBar(
//                                     'Explanation', 'No Explanation found.');
//                               },
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 children: [
//                                   Icon(
//                                     Icons.lightbulb,
//                                     color: ColorManager.brandColor,
//                                   ),
//                                   Text(
//                                     'Explanation',
//                                     style: getTextStyle(14, FontWeight.w600,
//                                         ColorManager.brandColor),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             InkWell(
//                               onTap: () {
//                                 Utils.snackBar(
//                                     'Statistics', 'No Statistics found.');
//                               },
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 children: [
//                                   Icon(
//                                     Icons.pie_chart,
//                                     color: ColorManager.brandColor,
//                                   ),
//                                   Text(
//                                     'Statistics',
//                                     style: getTextStyle(14, FontWeight.w600,
//                                         ColorManager.brandColor),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             InkWell(
//                               onTap: () {
//                                 // Utils.snackBar('Comments', 'No Comment found.');
//                               },
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 children: [
//                                   Icon(
//                                     Icons.message,
//                                     color: ColorManager.brandColor,
//                                   ),
//                                   Text(
//                                     'Comments',
//                                     style: getTextStyle(14, FontWeight.w600,
//                                         ColorManager.grayLight),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 8, right: 8,),
//                         child: SingleChildScrollView(
//                           child: Column(
//                             children: [
//                               // InkWell(
//                               //   onTap: () {
//                               //     homeController.selectedAnswerIndex.value = 1;
//                               //     print('tap 1');
//                               //   },
//                               //   child: Container(
//                               //     decoration: BoxDecoration(
//                               //       border: Border.all(
//                               //         color:
//                               //         ( homeController
//                               //             .qaList[homeController
//                               //             .currentQuestionsIndex
//                               //             .value]
//                               //             .userOption ==
//                               //             1 &&
//                               //             homeController
//                               //                 .qaList[homeController
//                               //                 .currentQuestionsIndex
//                               //                 .value]
//                               //                 .rightOption ==
//                               //                 1)
//                               //             ? Colors.green
//                               //             : Colors.transparent,
//                               //       )
//                               //     ),
//                               //     child: ListTile(
//                               //         dense: true,
//                               //         contentPadding: EdgeInsets.zero,
//                               //         isThreeLine: false,
//                               //         minLeadingWidth: 0,
//                               //         leading: Text(' A '),
//                               //         title: Padding(
//                               //           padding:
//                               //           const EdgeInsets.only(left: 0.0, right: 8),
//                               //           child: Html(
//                               //               style: {},
//                               //               // backgroundColor: ColorManager.grayLight,
//                               //               data: homeController
//                               //                   .qaList[homeController
//                               //                   .currentQuestionsIndex.value]
//                               //                   .option1
//                               //                   .toString(),
//                               //           ),
//                               //         ),
//                               //
//                               //     ),
//                               //   ),
//                               // ),
//                               // InkWell(
//                               //   onTap: () {
//                               //     homeController.selectedAnswerIndex.value = 2;
//                               //     print('tap 2');
//                               //
//                               //   },
//                               //   child: Container(
//                               //     decoration: BoxDecoration(
//                               //         color:
//                               //         (homeController
//                               //             .qaList[homeController
//                               //             .currentQuestionsIndex
//                               //             .value]
//                               //             .userOption ==
//                               //             2 &&
//                               //             homeController
//                               //                 .qaList[homeController
//                               //                 .currentQuestionsIndex
//                               //                 .value]
//                               //                 .rightOption ==
//                               //                 2)
//                               //             ? Colors.green
//                               //             : Colors.transparent),
//                               //     child: ListTile(
//                               //         dense: true,
//                               //         contentPadding: EdgeInsets.zero,
//                               //         isThreeLine: false,
//                               //         minLeadingWidth: 0,
//                               //         leading: Text(' B '),
//                               //         title: Padding(
//                               //           padding: const EdgeInsets.only(left: 8.0, right: 8),
//                               //           child: Html(
//                               //             // backgroundColor: ColorManager.grayLight,
//                               //               data: homeController
//                               //                   .qaList[homeController
//                               //                   .currentQuestionsIndex.value]
//                               //                   .option2
//                               //                   .toString()),
//                               //         )),
//                               //   ),
//                               // ),
//                               // InkWell(
//                               //   onTap: () {
//                               //     homeController.selectedAnswerIndex.value = 3;
//                               //     print('tap 3');
//                               //   },
//                               //   child: Container(
//                               //     decoration: BoxDecoration(
//                               //         color:
//                               //         (homeController
//                               //             .qaList[homeController
//                               //             .currentQuestionsIndex
//                               //             .value]
//                               //             .userOption ==
//                               //             3 &&
//                               //             homeController
//                               //                 .qaList[homeController
//                               //                 .currentQuestionsIndex
//                               //                 .value]
//                               //                 .rightOption ==
//                               //                 3)
//                               //             ? Colors.green
//                               //             : Colors.transparent),
//                               //     child: ListTile(
//                               //         dense: true,
//                               //         contentPadding: EdgeInsets.zero,
//                               //         isThreeLine: false,
//                               //         minLeadingWidth: 0,
//                               //         leading: Text(' C '),
//                               //         title: Padding(
//                               //           padding: const EdgeInsets.only(left: 8.0, right: 8),
//                               //           child: Html(
//                               //             // backgroundColor: ColorManager.grayLight,
//                               //               data: homeController
//                               //                   .qaList[homeController
//                               //                   .currentQuestionsIndex.value]
//                               //                   .option3
//                               //                   .toString()),
//                               //         )),
//                               //   ),
//                               // ),
//                               // InkWell(
//                               //   onTap: () {
//                               //     homeController.selectedAnswerIndex.value = 4;
//                               //     print('tap 4');
//                               //
//                               //   },
//                               //   child: Container(
//                               //     decoration: BoxDecoration(
//                               //         color:
//                               //         (homeController
//                               //             .qaList[homeController
//                               //             .currentQuestionsIndex
//                               //             .value]
//                               //             .userOption ==
//                               //             4 &&
//                               //             homeController
//                               //                 .qaList[homeController
//                               //                 .currentQuestionsIndex
//                               //                 .value]
//                               //                 .rightOption ==
//                               //                 4)
//                               //             ? Colors.green
//                               //             : Colors.transparent),
//                               //     child: ListTile(
//                               //         dense: true,
//                               //         contentPadding: EdgeInsets.zero,
//                               //         isThreeLine: false,
//                               //         minLeadingWidth: 0,
//                               //         leading: Text(' D '),
//                               //         title: Padding(
//                               //           padding: const EdgeInsets.only(left: 8.0, right: 8),
//                               //           child: Html(
//                               //             // backgroundColor: ColorManager.grayLight,
//                               //               data: homeController
//                               //                   .qaList[homeController
//                               //                   .currentQuestionsIndex.value]
//                               //                   .option4
//                               //                   .toString()),
//                               //         )),
//                               //   ),
//                               // ),
//                               Html(data: homeController.qaList[homeController.currentQuestionsIndex.value].question.toString(),),
//                               ListTile(
//                                 dense: true,
//                                 contentPadding: EdgeInsets.zero,
//                                 isThreeLine: false,
//                                 minLeadingWidth: 0,
//                                 title: Container(
//                                   padding: const EdgeInsets.only(left: 8.0, right: 8),
//                                   decoration: BoxDecoration(
//                                     border: Border.all(
//                                       color: homeController.qaList[homeController.currentQuestionsIndex.value].userOption == 1
//                                           && homeController.qaList[homeController.currentQuestionsIndex.value].rightOption == 1
//                                           || homeController.selectedAnswerIndex.value == 1
//                                           ? Colors.green
//                                           : Colors.transparent,
//                                     ),
//                                     borderRadius: BorderRadius.circular(5.0),
//                                   ),
//                                   child: Row(
//                                     mainAxisSize: MainAxisSize.min,
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     crossAxisAlignment: CrossAxisAlignment.center,
//                                     children: [
//                                       const Text(' A '),
//                                       Flexible(
//                                         child: Html(
//                                           data: homeController.qaList[homeController.currentQuestionsIndex.value].option1.toString(),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 onTap: (){
//                                   homeController.selectedAnswerIndex.value = 1;
//                                   print('tap 1');
//                                 },
//                               ),
//                               ListTile(
//                                 dense: true,
//                                 contentPadding: EdgeInsets.zero,
//                                 isThreeLine: false,
//                                 minLeadingWidth: 0,
//                                 title: Container(
//                                   padding: const EdgeInsets.only(left: 8.0, right: 8),
//                                   decoration: BoxDecoration(
//                                     border: Border.all(
//                                       color: homeController.qaList[homeController.currentQuestionsIndex.value].userOption == 2
//                                           && homeController.qaList[homeController.currentQuestionsIndex.value].rightOption == 2
//                                           || homeController.selectedAnswerIndex.value == 2
//                                           ? Colors.green
//                                           : Colors.transparent,
//                                     ),
//                                     borderRadius: BorderRadius.circular(5.0),
//                                   ),
//                                   child: Row(
//                                     mainAxisSize: MainAxisSize.min,
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     crossAxisAlignment: CrossAxisAlignment.center,
//                                     children: [
//                                       const Text(' B '),
//                                       Flexible(
//                                         child: Html(
//                                           data: homeController.qaList[homeController.currentQuestionsIndex.value].option2.toString(),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 onTap: (){
//                                   homeController.selectedAnswerIndex.value = 2;
//                                   print('tap 2');
//                                 },
//                               ),
//                               ListTile(
//                                 dense: true,
//                                 contentPadding: EdgeInsets.zero,
//                                 isThreeLine: false,
//                                 minLeadingWidth: 0,
//                                 title: Container(
//                                   padding: const EdgeInsets.only(left: 8.0, right: 8),
//                                   decoration: BoxDecoration(
//                                     border: Border.all(
//                                       color: homeController.qaList[homeController.currentQuestionsIndex.value].userOption == 3
//                                           && homeController.qaList[homeController.currentQuestionsIndex.value].rightOption == 3
//                                           || homeController.selectedAnswerIndex.value == 3
//                                           ? Colors.green
//                                           : Colors.transparent,
//                                     ),
//                                     borderRadius: BorderRadius.circular(5.0),
//                                   ),
//                                   child: Row(
//                                     mainAxisSize: MainAxisSize.min,
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     crossAxisAlignment: CrossAxisAlignment.center,
//                                     children: [
//                                       const Text(' C '),
//                                       Flexible(
//                                         child: Html(
//                                           data: homeController.qaList[homeController.currentQuestionsIndex.value].option3.toString(),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 onTap: (){
//                                   homeController.selectedAnswerIndex.value = 3;
//                                   print('tap 3');
//                                 },
//                               ),
//                               ListTile(
//                                 dense: true,
//                                 contentPadding: EdgeInsets.zero,
//                                 isThreeLine: false,
//                                 minLeadingWidth: 0,
//                                 title: Container(
//                                   padding: const EdgeInsets.only(left: 8.0, right: 8),
//                                   decoration: BoxDecoration(
//                                     border: Border.all(
//                                       color: homeController.qaList[homeController.currentQuestionsIndex.value].userOption == 4
//                                           && homeController.qaList[homeController.currentQuestionsIndex.value].rightOption == 4
//                                           || homeController.selectedAnswerIndex.value == 4
//                                           ? Colors.green
//                                           : Colors.transparent,
//                                     ),
//                                     borderRadius: BorderRadius.circular(5.0),
//                                   ),
//                                   child: Row(
//                                     mainAxisSize: MainAxisSize.min,
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     crossAxisAlignment: CrossAxisAlignment.center,
//                                     children: [
//                                       const Text(' D '),
//                                       Flexible(
//                                         child: Html(
//                                           data: homeController.qaList[homeController.currentQuestionsIndex.value].option4.toString(),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 onTap: (){
//                                   homeController.selectedAnswerIndex.value = 4;
//                                   print('tap 4');
//                                 },
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           );
//         //   SliverList(
//         //   delegate: SliverChildBuilderDelegate(
//         //     childCount: homeController.qaList.length,
//         //     (context, index) => buildQAListItem(homeController, index),
//         //   ),
//         // );
//       }
//     });
//   }
//
//   // Widget buildQAListItem(SavedTestViewModel homeController, int index) {
//   //   return Stack(
//   //     alignment: AlignmentDirectional.bottomEnd,
//   //     children: [
//   //       Padding(
//   //         padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0),
//   //         child: Container(
//   //           width: Get.width - 48,
//   //           decoration: BoxDecoration(
//   //               borderRadius: const BorderRadius.all(Radius.circular(5)),
//   //               color: currentTheme.getCurrentTheme() == ThemeMode.dark
//   //                   ? ColorManager.darkModeCard
//   //                   : Colors.white),
//   //           child: Column(
//   //             mainAxisAlignment: MainAxisAlignment.start,
//   //             crossAxisAlignment: CrossAxisAlignment.start,
//   //             children: [
//   //               // Padding(
//   //               //   padding: const EdgeInsets.only(right: 8.0, bottom: 8,top: 16),
//   //               //   child: Row(
//   //               //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//   //               //     children: [
//   //               //     ],
//   //               //   ),
//   //               // ),
//   //               Padding(
//   //                 padding: const EdgeInsets.only(right: 8.0, bottom: 8,top: 16),
//   //                 child: Row(
//   //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//   //                   children: [
//   //                     InkWell(
//   //                       onTap: () {
//   //                         Utils.snackBar('Explanation', 'No Explanation found.');
//   //                       },
//   //                       child: Row(
//   //                         mainAxisAlignment: MainAxisAlignment.start,
//   //                         children: [
//   //                           Icon(
//   //                             Icons.lightbulb,
//   //                             color: ColorManager.brandColor,
//   //                           ),
//   //                           Text(
//   //                             'Explanation',
//   //                             style: getTextStyle(
//   //                                 14, FontWeight.w600, ColorManager.brandColor),
//   //                           ),
//   //                         ],
//   //                       ),
//   //                     ),
//   //                     InkWell(
//   //                       onTap: () {
//   //                         Utils.snackBar('Statistics', 'No Statistics found.');
//   //                       },
//   //                       child: Row(
//   //                         mainAxisAlignment: MainAxisAlignment.start,
//   //                         children: [
//   //                           Icon(
//   //                             Icons.pie_chart,
//   //                             color: ColorManager.brandColor,
//   //                           ),
//   //                           Text(
//   //                             'Statistics',
//   //                             style: getTextStyle(
//   //                                 14, FontWeight.w600, ColorManager.brandColor),
//   //                           ),
//   //                         ],
//   //                       ),
//   //                     ),
//   //                     InkWell(
//   //                       onTap: () {
//   //                         // Utils.snackBar('Comments', 'No Comment found.');
//   //                       },
//   //                       child: Row(
//   //                         mainAxisAlignment: MainAxisAlignment.start,
//   //                         children: [
//   //                           Icon(
//   //                             Icons.message,
//   //                             color: ColorManager.brandColor,
//   //                           ),
//   //                           Text(
//   //                             'Comments',
//   //                             style: getTextStyle(
//   //                                 14, FontWeight.w600, ColorManager.grayLight),
//   //                           ),
//   //                         ],
//   //                       ),
//   //                     ),
//   //                   ],
//   //                 ),
//   //               ),
//   //
//   //
//   //               Html(data: homeController.qaList[index].question.toString()),
//   //               ListTile(
//   //                 dense: true,
//   //                 contentPadding: EdgeInsets.zero,
//   //                 // leading: Text('A'),
//   //                 title: Padding(
//   //                   padding: const EdgeInsets.only(left: 8.0, right: 8),
//   //                   child: Html(
//   //                     style: {
//   //
//   //                     },
//   //                       // backgroundColor: ColorManager.grayLight,
//   //                       data:
//   //                       homeController.qaList[index].option1.toString()),
//   //                 )
//   //               ),
//   //               ListTile(
//   //                   dense: true,
//   //                   contentPadding: EdgeInsets.zero,
//   //                   // leading: Text('A'),
//   //                   title: Padding(
//   //                     padding: const EdgeInsets.only(left: 8.0, right: 8),
//   //                     child: Html(
//   //                         // backgroundColor: ColorManager.grayLight,
//   //                         data:
//   //                         homeController.qaList[index].option2.toString()),
//   //                   )
//   //               ),
//   //               ListTile(
//   //                   dense: true,
//   //                   contentPadding: EdgeInsets.zero,
//   //                   // leading: Text('A'),
//   //                   title: Padding(
//   //                     padding: const EdgeInsets.only(left: 8.0, right: 8),
//   //                     child: Html(
//   //                         // backgroundColor: ColorManager.grayLight,
//   //                         data:
//   //                         homeController.qaList[index].option3.toString()),
//   //                   )
//   //               ),
//   //               ListTile(
//   //                   dense: true,
//   //                   contentPadding: EdgeInsets.zero,
//   //                   // leading: Text('A'),
//   //                   title: Padding(
//   //                     padding: const EdgeInsets.only(left: 8.0, right: 8),
//   //                     child: Html(
//   //                         // backgroundColor: ColorManager.grayLight,
//   //                         data:
//   //                         homeController.qaList[index].option4.toString()),
//   //                   )
//   //               ),
//   //
//   //             ],
//   //           ),
//   //         ),
//   //       ),
//   //       Container(
//   //         decoration: BoxDecoration(
//   //           color: Colors.white
//   //         ),
//   //         child: Row(
//   //           children: [
//   //             InkWell(
//   //               onTap: () {
//   //                 // controller.getToTestDetailsScreen();
//   //               },
//   //               child: Container(
//   //                 // height: 88,
//   //                 color: Colors.transparent,
//   //                 child: Padding(
//   //                   padding: const EdgeInsets.all(8.0),
//   //                   child: RoundButtonWidget(
//   //                     loading: false,
//   //                     title: 'Previous',
//   //                     width: Get.width / 2.5,
//   //                     height: 48,
//   //                     onPress: () {
//   //                       // controller.getToTestDetailsScreen();
//   //                     },
//   //                     textColor: Colors.white,
//   //                     buttonColor: ColorManager.brandColor,
//   //                   ),
//   //                 ),
//   //               ),
//   //             ),
//   //             InkWell(
//   //               onTap: () {
//   //                 // controller.getToTestDetailsScreen();
//   //               },
//   //               child: Container(
//   //                 // height: 88,
//   //                 color: Colors.transparent,
//   //                 child: Padding(
//   //                   padding: const EdgeInsets.all(8.0),
//   //                   child: RoundButtonWidget(
//   //                     loading: false,
//   //                     title: 'Next  >',
//   //                     width: Get.width / 2.5,
//   //                     height: 48,
//   //                     onPress: () {
//   //                       // controller.getToTestDetailsScreen();
//   //                     },
//   //                     textColor: Colors.white,
//   //                     buttonColor: ColorManager.brandColor,
//   //                   ),
//   //                 ),
//   //               ),
//   //             ),
//   //           ],
//   //         ),
//   //       )
//   //     ],
//   //   );
//   // }
// }
//
// class StudentListPage extends StatefulWidget {
//   const StudentListPage({super.key});
//
//   @override
//   _StudentListPageState createState() => _StudentListPageState();
// }
//
// class _StudentListPageState extends State<StudentListPage>
//     with AutomaticKeepAliveClientMixin {
//   final controller = Get.put(SavedTestViewModel());
//
//   @override
//   Widget build(BuildContext context) {
//     print('>>> Build Car Page');
//     super.build(context);
//     return CustomScrollView(
//       slivers: [
//         const SliverPadding(padding: EdgeInsets.all(16)),
//         buildSliverList(controller)
//       ],
//     );
//   }
//
//   @override
//   bool get wantKeepAlive => true;
//
//   Obx buildSliverList(SavedTestViewModel homeController) {
//     return Obx(() {
//       switch (homeController.rxStudentRequestStatus.value) {
//         case ApiStatus.loading:
//           return const SliverToBoxAdapter(
//             child: Center(
//               child: CircularProgressIndicator(),
//             ),
//           );
//         case ApiStatus.error:
//           return const SliverToBoxAdapter(
//             child: Center(
//               child: Text(MessageConstant.errorMessage),
//             ),
//           );
//
//         case ApiStatus.completed:
//           return
//               //   SliverList(
//               //   delegate: SliverChildBuilderDelegate(
//               //     childCount: homeController.studentList.length,
//               //     (context, index) => buildStudentListItem(homeController, index),
//               //   ),
//               // );
//               SliverGrid(
//                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                       // mainAxisExtent: 3,crossAxisSpacing: 3,
//                       mainAxisSpacing: 8,
//                       crossAxisSpacing: 8,
//                       crossAxisCount: 3),
//                   delegate: SliverChildBuilderDelegate(
//                       (BuildContext context, int index) {
//                     return Container(
//                       height: 40,
//                       width: 40,
//                       decoration: BoxDecoration(
//                           border: Border.all(color: Colors.white),
//                           color: index % 2 == 0
//                               ? Colors.transparent
//                               : Colors.transparent),
//                       child: Center(
//                         child: Text('${index + 1}'),
//                       ),
//                     );
//                   }, childCount: homeController.qaList.length));
//       }
//     });
//   }
//
//   Widget buildStudentListItem(SavedTestViewModel homeController, int index) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0),
//       child: Container(
//         width: Get.width - 48,
//         decoration: BoxDecoration(
//             borderRadius: const BorderRadius.all(Radius.circular(5)),
//             color: currentTheme.getCurrentTheme() == ThemeMode.dark
//                 ? ColorManager.darkModeCard
//                 : Colors.white),
//         child: ListTile(
//           // leading: CircleAvatar(
//           //   backgroundColor: ColorManager.brandColor,
//           //   radius: 25,
//           //   child: CachedNetworkImage(
//           //     imageUrl: homeController.studentList[index].image.toString(),
//           //   ),
//           // ),
//           title: Text(
//             homeController.studentList[index].firstName.toString() +
//                 homeController.studentList[index].lastName.toString(),
//             style: getTextStyle(16, FontWeight.w600, ColorManager.grayLight),
//           ),
//           subtitle: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 homeController.studentList[index].email.toString(),
//                 style: getTextStyle(
//                     14,
//                     FontWeight.w400,
//                     currentTheme.getCurrentTheme() == ThemeMode.dark
//                         ? Colors.white
//                         : ColorManager.deepBlack),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 8.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     if (homeController.studentList[index].status.toString() ==
//                         '1')
//                       Container(
//                         decoration: BoxDecoration(
//                           borderRadius:
//                               const BorderRadius.all(Radius.circular(3)),
//                           color: Colors.green.shade100,
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Text(
//                             'Active',
//                             style: getTextStyle(
//                                 12, FontWeight.w600, ColorManager.green),
//                           ),
//                         ),
//                       ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:cached_network_image/cached_network_image.dart';
import 'package:examtice_teacher/exam/view_models/exam_screen_vm.dart';
import 'package:examtice_teacher/exam/view_models/timer_controller.dart';
import 'package:examtice_teacher/resources/utis.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../resources/AppConfigs.dart';
import '../../../resources/RoundButtonWidget.dart';
import '../../../resources/api_status.dart';
import '../../../resources/colors.dart';
import '../../../resources/constants.dart';
import '../../../resources/styles.dart';
import '../../view_models/saved_test_view_model.dart';
import '../widgets/selection_item.dart';

class TestDetailsScreen extends GetView<SavedTestViewModel> {
  const TestDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SavedTestViewModel());
    final timerController = Get.put(TimerViewModel());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: Text(
            'Exam',
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
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  sizeVer(6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Obx(() => Container(
                        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: Colors.grey.withOpacity(0.5),
                            width: 0.5,
                          ),
                        ),
                        child: RichText(
                          text: TextSpan(
                            style: getTextStyle(18, FontWeight.w400, HexColor.fromHex("#CC0B5A"),),
                            children: [
                              TextSpan(
                                text: '${controller.currentQuestionsIndex.value + 1} /',
                              ),
                              TextSpan(
                                text: controller.selectedExam.value.totalQuestions.toString(),
                                style: getTextStyle(18, FontWeight.w400, HexColor.fromHex("#CC0B5A"),),
                              ),
                            ],
                          ),
                        ),
                      ),),
                      Obx(
                        () => Center(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: Colors.grey.withOpacity(0.5),
                                width: 0.5,
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset(
                                  'assets/icons/timer.png',
                                  height: 25,
                                  width: 25,
                                ),
                                sizeHor(10),
                                Text(
                                  timerController.time.value,
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: HexColor.fromHex("#CC0B5A"),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  sizeVer(20),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            controller.sendSpentTimeAPI(
                              controller.selectedExam.value.testId.toString(),
                              timerController.time.value,
                            );
                          },
                          child: Container(
                            height: 40,
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                              color: ColorManager.brandColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Cancel Test',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            controller.sendSaveTestAPI(
                              controller.selectedExam.value.testId.toString(),
                              timerController.time.value,
                            );
                          },
                          child: Container(
                            height: 40,
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                              color: ColorManager.brandColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Save Test',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            print('object');
                          },
                          child: Container(
                            height: 40,
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                              color: ColorManager.brandColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Finish Test',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  sizeVer(20),
                ],
              ),
              TabBar(
                labelColor: HexColor.fromHex("#CC0B5A"),
                controller: controller.tabController,
                indicatorColor: Colors.transparent,
                unselectedLabelColor: Colors.grey,
                padding: EdgeInsets.zero,
                indicatorPadding: EdgeInsets.zero,
                labelPadding: EdgeInsets.zero,
                tabs: [
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text('Questions'),
                        const SizedBox(width: 10,),
                        Container(
                          padding: const EdgeInsets.only(right: 15.0),
                          height: 10,
                          width: 2,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text('Explanation'),
                        const SizedBox(width: 10,),
                        Container(
                          padding: const EdgeInsets.only(right: 15.0),
                          height: 10,
                          width: 2,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text('Statistics'),
                        const SizedBox(width: 10,),
                        Container(
                          padding: const EdgeInsets.only(right: 15.0),
                          height: 10,
                          width: 2,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                  const Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Comments'),
                        SizedBox(width: 20,),
                      ],
                    ),
                  ),
                ],
                onTap: (index) {
                  controller.tabIndex.value = index;
                },
              ),
              Expanded(
                child: TabBarView(
                  controller: controller.tabController,
                  children: [
                    const QuestionsAndAnswerScreen(),
                    Obx(() =>
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.lightbulb,
                                    color: ColorManager.brandColor,
                                  ),
                                  Text(
                                    'Explanation',
                                    style: getTextStyle(
                                        14, FontWeight.w600, ColorManager.brandColor),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                padding: const EdgeInsets.all(15.0),
                                margin: const EdgeInsets.all(5.0),
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: controller.qaList[controller.currentQuestionsIndex.value+1].explanation == null
                                    ? const SizedBox(
                                  child: Text(
                                    'No Explanations found',
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                )
                                    //     : Text(
                                    //   controller
                                    //       .qaList[controller
                                    //       .currentQuestionsIndex.value+1]
                                    //       .explanation
                                    //       .toString(),
                                    //   style: const TextStyle(
                                    //     color: Colors.black,
                                    //   ),
                                    // ),
                                    : SingleChildScrollView(
                                        child: Html(
                                          data: controller.qaList[controller.currentQuestionsIndex.value + 1].explanation.toString(),
                                          style: {
                                            "p": Style(color: Colors.black),
                                          },
                                        ),
                                    ),
                              ),
                            ],
                          ),
                        ),
                    ),
                    Obx(() => Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.pie_chart,
                              color: ColorManager.brandColor,
                            ),
                            Text(
                              'Statistics',
                              style: getTextStyle(
                                  14, FontWeight.w600, ColorManager.brandColor),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: const EdgeInsets.all(15.0),
                          margin: const EdgeInsets.all(5.0),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: controller.qaList[controller.currentQuestionsIndex.value + 1].statistics == null
                              ? const SizedBox(
                            child: Text(
                              'No Statistics found',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          )
                              : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'All Appeared Test: ${controller.qaList[controller.currentQuestionsIndex.value + 1].statistics?.allAppearedTest ?? '0'}',
                                style: const TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                'All Answered Correct: ${controller.qaList[controller.currentQuestionsIndex.value + 1].statistics?.allAnsweredCorrect ?? '0'}',
                                style: const TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                'User Appeared Test: ${controller.qaList[controller.currentQuestionsIndex.value + 1].statistics?.userAppearedTest ?? '0'}',
                                style: const TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                'User Answered Correct: ${controller.qaList[controller.currentQuestionsIndex.value + 1].statistics?.userAnsweredCorrect ?? '0'}',
                                style: const TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),),
                    Obx(() => Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.message,
                              color: ColorManager.brandColor,
                            ),
                            Text(
                              'Comments',
                              style: getTextStyle(
                                  14, FontWeight.w600, ColorManager.grayLight),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: const EdgeInsets.all(15.0),
                          margin: const EdgeInsets.all(5.0),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: controller
                              .qaList[
                          controller.currentQuestionsIndex.value+1]
                              .comments!
                              .isEmpty
                              ? const SizedBox(
                            child: Text(
                              'No comments found',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          )
                              : Text(
                            controller
                                .qaList[controller
                                .currentQuestionsIndex.value+1]
                                .comments
                                .toString(),
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class QuestionsAndAnswerScreen extends StatefulWidget {
  const QuestionsAndAnswerScreen({super.key});

  @override
  _QuestionsAndAnswerScreenState createState() => _QuestionsAndAnswerScreenState();
}

class _QuestionsAndAnswerScreenState extends State<QuestionsAndAnswerScreen> with AutomaticKeepAliveClientMixin {
  final controller = Get.put(SavedTestViewModel());
  final timerController = Get.put(TimerViewModel());

  @override
  Widget build(BuildContext context) {
    print('>>> Build Car Page');
    super.build(context);
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        CustomScrollView(
          slivers: [
            buildSliverList(controller),
          ],
        ),
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              controller.currentQuestionsIndex.value == 0
                  ? SizedBox(
                      width: Get.width / 2.27,
                    )
                  : InkWell(
                      onTap: () {
                        if (controller.currentQuestionsIndex.value > 0) {
                          controller.currentQuestionsIndex.value =
                              controller.currentQuestionsIndex.value - 1;
                        }
                      },
                      // child: Container(
                      //   // height: 88,
                      //   color: Colors.transparent,
                      //   child: Padding(
                      //     padding: const EdgeInsets.all(8.0),
                      //     child: RoundButtonWidget(
                      //       loading: false,
                      //       title: '',
                      //       width: Get.width / 2.5,
                      //       height: 48,
                      //       onPress: () {
                      //         // controller.getToTestDetailsScreen();
                      //       },
                      //       textColor: Colors.white,
                      //       buttonColor: ColorManager.brandColor,
                      //       icon: Icons.arrow_back_ios_new,
                      //     ),
                      //     // child: Container(
                      //     //   width: Get.width / 2.5,
                      //     //   decoration: const BoxDecoration(
                      //     //     color: Color(0xffF2F2F2),
                      //     //   ),
                      //     //   child: const Row(
                      //     //     mainAxisAlignment: MainAxisAlignment.start,
                      //     //     children: [
                      //     //       Icon(Icons.arrow_back_ios_new,),
                      //     //     ],
                      //     //   ),
                      //     // ),
                      //   ),
                      // ),
                      child: Container(
                        color: Colors.transparent,
                        width: Get.width / 2.5,
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(15.0),
                              decoration: BoxDecoration(
                                color: const Color(0xffF2F2F2),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: const Icon(
                                Icons.arrow_back_ios_new,
                                color: Color(
                                  0xffF12679,
                                ),
                                size: 17,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
              controller.currentQuestionsIndex.value ==
                      controller.qaList.length - 1
                  ? InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          backgroundColor: Colors.transparent,
                          builder: (child) {
                            return Container(
                              decoration: BoxDecoration(
                                  color: currentTheme.getCurrentTheme() ==
                                          ThemeMode.dark
                                      ? Colors.black
                                      : Colors.white,
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(20.0),
                                    topRight: Radius.circular(20.0),
                                  )),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.asset(
                                    'assets/images/confirm_finish.png',
                                    height: 100,
                                    width: 100,
                                  ),
                                  const SizedBox(
                                    height: 20.0,
                                  ),
                                  const Text(
                                      'Are you sure to finish the exam?'),
                                  const SizedBox(
                                    height: 20.0,
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: RoundButtonWidget(
                                      loading: false,
                                      title: 'Submit',
                                      width: Get.width / 2.5,
                                      height: 48,
                                      onPress: () {},
                                      textColor: Colors.white,
                                      buttonColor: ColorManager.brandColor,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Get.back();
                                    },
                                    child: RoundButtonWidget(
                                      loading: false,
                                      title: 'Back',
                                      width: Get.width / 2.5,
                                      height: 48,
                                      onPress: () {},
                                      textColor: const Color(0xffF12679),
                                      buttonColor: Colors.transparent,
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: Container(
                        color: Colors.transparent,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RoundButtonWidget(
                            loading: false,
                            title: 'Finish Exam',
                            width: Get.width / 2.5,
                            height: 48,
                            onPress: () {},
                            textColor: Colors.white,
                            buttonColor: ColorManager.brandColor,
                          ),
                        ),
                      ),
                    )
                  : InkWell(
                      onTap: () {
                        if (controller.currentQuestionsIndex.value <
                            controller.qaList.length) {
                          controller.currentQuestionsIndex.value =
                              controller.currentQuestionsIndex.value + 1;
                        }
                      },
                      child: Container(
                        // height: 88,
                        color: Colors.transparent,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RoundButtonWidget(
                            loading: false,
                            title: 'Next',
                            width: Get.width / 2.5,
                            height: 48,
                            onPress: () {
                              // controller.getToTestDetailsScreen();
                            },
                            textColor: Colors.white,
                            buttonColor: ColorManager.brandColor,
                            icon: Icons.arrow_forward_ios,
                          ),
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;

  Obx buildSliverList(SavedTestViewModel homeController) {
    return Obx(() {
      switch (homeController.rxQARequestStatus.value) {
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
          return SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0),
              child: SizedBox(
                width: Get.width - 48,
                child: IgnorePointer(
                  ignoring: homeController.qaList[homeController.currentQuestionsIndex.value].isAttempt == true ? true: false,
                  child: Column(
                    children: [
                      sizeVer(5),
                      Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8,),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Html(data: homeController.qaList[homeController.currentQuestionsIndex.value].question.toString(),),
                              ListTile(
                                dense: true,
                                contentPadding: EdgeInsets.zero,
                                isThreeLine: false,
                                minLeadingWidth: 0,
                                title: Container(
                                  padding: const EdgeInsets.only(left: 8.0, right: 8),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      color: homeController.qaList[homeController.currentQuestionsIndex.value].userOption == 1
                                          ? homeController.qaList[homeController.currentQuestionsIndex.value].rightOption == 1
                                          ? Colors.green
                                          : Colors.red
                                          : homeController.qaList[homeController.currentQuestionsIndex.value].rightOption == 1
                                          ? Colors.green
                                          : Colors.transparent,
                                    ),
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      const Text(' A ', style: TextStyle(color: Colors.black,),),
                                      Flexible(
                                        child: Html(
                                          data: homeController.qaList[homeController.currentQuestionsIndex.value].option1.toString(),
                                          style: {
                                            "body": Style(
                                              color: Colors.black,
                                            ),
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                onTap: (){
                                  homeController.selectedAnswerIndex.value = 1;
                                  print('tap 1');
                                  homeController.sendStudentAnswerAPI(
                                    homeController.selectedExam.value.testId.toString(),
                                    homeController.qaList[homeController.currentQuestionsIndex.value].id.toString(),
                                    '1',
                                  );
                                  homeController.qaList[homeController.currentQuestionsIndex.value].rightOption = homeController.rightOption.value;
                                },
                              ),
                              ListTile(
                                dense: true,
                                contentPadding: EdgeInsets.zero,
                                isThreeLine: false,
                                minLeadingWidth: 0,
                                title: Container(
                                  padding: const EdgeInsets.only(left: 8.0, right: 8),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      color: homeController.qaList[homeController.currentQuestionsIndex.value].userOption == 2
                                          ? homeController.qaList[homeController.currentQuestionsIndex.value].rightOption == 2
                                          ? Colors.green
                                          : Colors.red
                                          : homeController.qaList[homeController.currentQuestionsIndex.value].rightOption == 2
                                          ? Colors.green
                                          : Colors.transparent,
                                    ),
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      const Text(' B ', style: TextStyle(color: Colors.black,),),
                                      Flexible(
                                        child: Html(
                                          data: homeController.qaList[homeController.currentQuestionsIndex.value].option2.toString(),
                                          style: {
                                            "body": Style(
                                              color: Colors.black,
                                            ),
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                onTap: (){
                                  homeController.selectedAnswerIndex.value = 2;
                                  print('tap 2');
                                  homeController.sendStudentAnswerAPI(
                                    homeController.selectedExam.value.testId.toString(),
                                    homeController.qaList[homeController.currentQuestionsIndex.value].id.toString(),
                                    '2',
                                  );
                                  homeController.qaList[homeController.currentQuestionsIndex.value].rightOption = homeController.rightOption.value;
                                },
                              ),
                              ListTile(
                                dense: true,
                                contentPadding: EdgeInsets.zero,
                                isThreeLine: false,
                                minLeadingWidth: 0,
                                title: Container(
                                  padding: const EdgeInsets.only(left: 8.0, right: 8),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      color: homeController.qaList[homeController.currentQuestionsIndex.value].userOption == 3
                                          ? homeController.qaList[homeController.currentQuestionsIndex.value].rightOption == 3
                                          ? Colors.green
                                          : Colors.red
                                          : homeController.qaList[homeController.currentQuestionsIndex.value].rightOption == 3
                                          ? Colors.green
                                          : Colors.transparent,
                                    ),
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      const Text(' C ', style: TextStyle(color: Colors.black,),),
                                      Flexible(
                                        child: Html(
                                          data: homeController.qaList[homeController.currentQuestionsIndex.value].option3.toString(),
                                          style: {
                                            "body": Style(
                                              color: Colors.black,
                                            ),
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                onTap: (){
                                  homeController.selectedAnswerIndex.value = 3;
                                  print('tap 3');
                                  homeController.sendStudentAnswerAPI(
                                    homeController.selectedExam.value.testId.toString(),
                                    homeController.qaList[homeController.currentQuestionsIndex.value].id.toString(),
                                    '3',
                                  );
                                  homeController.qaList[homeController.currentQuestionsIndex.value].rightOption = homeController.rightOption.value;
                                },
                              ),
                              ListTile(
                                dense: true,
                                contentPadding: EdgeInsets.zero,
                                isThreeLine: false,
                                minLeadingWidth: 0,
                                title: Container(
                                  padding: const EdgeInsets.only(left: 8.0, right: 8),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      color: homeController.qaList[homeController.currentQuestionsIndex.value].userOption == 4
                                          ? homeController.qaList[homeController.currentQuestionsIndex.value].rightOption == 4
                                          ? Colors.green
                                          : Colors.red
                                          : homeController.qaList[homeController.currentQuestionsIndex.value].rightOption == 4
                                          ? Colors.green
                                          : Colors.transparent,
                                    ),
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      const Text(' D ', style: TextStyle(color: Colors.black,),),
                                      Flexible(
                                        child: Html(
                                          data: homeController.qaList[homeController.currentQuestionsIndex.value].option4.toString(),
                                          style: {
                                            "body": Style(
                                              color: Colors.black,
                                            ),
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                onTap: (){
                                  homeController.selectedAnswerIndex.value = 4;
                                  print('tap 4');
                                  homeController.sendStudentAnswerAPI(
                                    homeController.selectedExam.value.testId.toString(),
                                    homeController.qaList[homeController.currentQuestionsIndex.value].id.toString(),
                                    '4',
                                  );
                                  homeController.qaList[homeController.currentQuestionsIndex.value].rightOption = homeController.rightOption.value;
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      sizeVer(10)
                    ],
                  ),
                ),
              ),
            ),
          );
          //   SliverList(
      //   delegate: SliverChildBuilderDelegate(
      //     childCount: homeController.qaList.length,
      //     (context, index) => buildQAListItem(homeController, index),
      //   ),
      // );
      }
    });
  }

// Widget buildQAListItem(SavedTestViewModel homeController, int index) {
//   return Stack(
//     alignment: AlignmentDirectional.bottomEnd,
//     children: [
//       Padding(
//         padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0),
//         child: Container(
//           width: Get.width - 48,
//           decoration: BoxDecoration(
//               borderRadius: const BorderRadius.all(Radius.circular(5)),
//               color: currentTheme.getCurrentTheme() == ThemeMode.dark
//                   ? ColorManager.darkModeCard
//                   : Colors.white),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Padding(
//               //   padding: const EdgeInsets.only(right: 8.0, bottom: 8,top: 16),
//               //   child: Row(
//               //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               //     children: [
//               //     ],
//               //   ),
//               // ),
//               Padding(
//                 padding: const EdgeInsets.only(right: 8.0, bottom: 8,top: 16),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     InkWell(
//                       onTap: () {
//                         Utils.snackBar('Explanation', 'No Explanation found.');
//                       },
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Icon(
//                             Icons.lightbulb,
//                             color: ColorManager.brandColor,
//                           ),
//                           Text(
//                             'Explanation',
//                             style: getTextStyle(
//                                 14, FontWeight.w600, ColorManager.brandColor),
//                           ),
//                         ],
//                       ),
//                     ),
//                     InkWell(
//                       onTap: () {
//                         Utils.snackBar('Statistics', 'No Statistics found.');
//                       },
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Icon(
//                             Icons.pie_chart,
//                             color: ColorManager.brandColor,
//                           ),
//                           Text(
//                             'Statistics',
//                             style: getTextStyle(
//                                 14, FontWeight.w600, ColorManager.brandColor),
//                           ),
//                         ],
//                       ),
//                     ),
//                     InkWell(
//                       onTap: () {
//                         // Utils.snackBar('Comments', 'No Comment found.');
//                       },
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Icon(
//                             Icons.message,
//                             color: ColorManager.brandColor,
//                           ),
//                           Text(
//                             'Comments',
//                             style: getTextStyle(
//                                 14, FontWeight.w600, ColorManager.grayLight),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//
//
//               Html(data: homeController.qaList[index].question.toString()),
//               ListTile(
//                 dense: true,
//                 contentPadding: EdgeInsets.zero,
//                 // leading: Text('A'),
//                 title: Padding(
//                   padding: const EdgeInsets.only(left: 8.0, right: 8),
//                   child: Html(
//                     style: {
//
//                     },
//                       // backgroundColor: ColorManager.grayLight,
//                       data:
//                       homeController.qaList[index].option1.toString()),
//                 )
//               ),
//               ListTile(
//                   dense: true,
//                   contentPadding: EdgeInsets.zero,
//                   // leading: Text('A'),
//                   title: Padding(
//                     padding: const EdgeInsets.only(left: 8.0, right: 8),
//                     child: Html(
//                         // backgroundColor: ColorManager.grayLight,
//                         data:
//                         homeController.qaList[index].option2.toString()),
//                   )
//               ),
//               ListTile(
//                   dense: true,
//                   contentPadding: EdgeInsets.zero,
//                   // leading: Text('A'),
//                   title: Padding(
//                     padding: const EdgeInsets.only(left: 8.0, right: 8),
//                     child: Html(
//                         // backgroundColor: ColorManager.grayLight,
//                         data:
//                         homeController.qaList[index].option3.toString()),
//                   )
//               ),
//               ListTile(
//                   dense: true,
//                   contentPadding: EdgeInsets.zero,
//                   // leading: Text('A'),
//                   title: Padding(
//                     padding: const EdgeInsets.only(left: 8.0, right: 8),
//                     child: Html(
//                         // backgroundColor: ColorManager.grayLight,
//                         data:
//                         homeController.qaList[index].option4.toString()),
//                   )
//               ),
//
//             ],
//           ),
//         ),
//       ),
//       Container(
//         decoration: BoxDecoration(
//           color: Colors.white
//         ),
//         child: Row(
//           children: [
//             InkWell(
//               onTap: () {
//                 // controller.getToTestDetailsScreen();
//               },
//               child: Container(
//                 // height: 88,
//                 color: Colors.transparent,
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: RoundButtonWidget(
//                     loading: false,
//                     title: 'Previous',
//                     width: Get.width / 2.5,
//                     height: 48,
//                     onPress: () {
//                       // controller.getToTestDetailsScreen();
//                     },
//                     textColor: Colors.white,
//                     buttonColor: ColorManager.brandColor,
//                   ),
//                 ),
//               ),
//             ),
//             InkWell(
//               onTap: () {
//                 // controller.getToTestDetailsScreen();
//               },
//               child: Container(
//                 // height: 88,
//                 color: Colors.transparent,
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: RoundButtonWidget(
//                     loading: false,
//                     title: 'Next  >',
//                     width: Get.width / 2.5,
//                     height: 48,
//                     onPress: () {
//                       // controller.getToTestDetailsScreen();
//                     },
//                     textColor: Colors.white,
//                     buttonColor: ColorManager.brandColor,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       )
//     ],
//   );
// }
}

// class StudentListPage extends StatefulWidget {
//   const StudentListPage({super.key});
//
//   @override
//   _StudentListPageState createState() => _StudentListPageState();
// }
//
// class _StudentListPageState extends State<StudentListPage>
//     with AutomaticKeepAliveClientMixin {
//   final controller = Get.put(SavedTestViewModel());
//
//   @override
//   Widget build(BuildContext context) {
//     print('>>> Build Car Page');
//     super.build(context);
//     return CustomScrollView(
//       slivers: [
//         const SliverPadding(padding: EdgeInsets.all(16)),
//         buildSliverList(controller)
//       ],
//     );
//   }
//
//   @override
//   bool get wantKeepAlive => true;
//
//   Obx buildSliverList(SavedTestViewModel homeController) {
//     return Obx(() {
//       switch (homeController.rxStudentRequestStatus.value) {
//         case ApiStatus.loading:
//           return const SliverToBoxAdapter(
//             child: Center(
//               child: CircularProgressIndicator(),
//             ),
//           );
//         case ApiStatus.error:
//           return const SliverToBoxAdapter(
//             child: Center(
//               child: Text(MessageConstant.errorMessage),
//             ),
//           );
//
//         case ApiStatus.completed:
//           return
//             //   SliverList(
//             //   delegate: SliverChildBuilderDelegate(
//             //     childCount: homeController.studentList.length,
//             //     (context, index) => buildStudentListItem(homeController, index),
//             //   ),
//             // );
//             SliverGrid(
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   // mainAxisExtent: 3,crossAxisSpacing: 3,
//                     mainAxisSpacing: 8,
//                     crossAxisSpacing: 8,
//                     crossAxisCount: 3),
//                 delegate: SliverChildBuilderDelegate(
//                         (BuildContext context, int index) {
//                       return Container(
//                         height: 40,
//                         width: 40,
//                         decoration: BoxDecoration(
//                             border: Border.all(color: Colors.white),
//                             color: index % 2 == 0
//                                 ? Colors.transparent
//                                 : Colors.transparent),
//                         child: Center(
//                           child: Text('${index + 1}'),
//                         ),
//                       );
//                     }, childCount: homeController.qaList.length));
//       }
//     });
//   }
//
//   Widget buildStudentListItem(SavedTestViewModel homeController, int index) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0),
//       child: Container(
//         width: Get.width - 48,
//         decoration: BoxDecoration(
//             borderRadius: const BorderRadius.all(Radius.circular(5)),
//             color: currentTheme.getCurrentTheme() == ThemeMode.dark
//                 ? ColorManager.darkModeCard
//                 : Colors.white),
//         child: ListTile(
//           // leading: CircleAvatar(
//           //   backgroundColor: ColorManager.brandColor,
//           //   radius: 25,
//           //   child: CachedNetworkImage(
//           //     imageUrl: homeController.studentList[index].image.toString(),
//           //   ),
//           // ),
//           title: Text(
//             homeController.studentList[index].firstName.toString() +
//                 homeController.studentList[index].lastName.toString(),
//             style: getTextStyle(16, FontWeight.w600, ColorManager.grayLight),
//           ),
//           subtitle: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 homeController.studentList[index].email.toString(),
//                 style: getTextStyle(
//                     14,
//                     FontWeight.w400,
//                     currentTheme.getCurrentTheme() == ThemeMode.dark
//                         ? Colors.white
//                         : ColorManager.deepBlack),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 8.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     if (homeController.studentList[index].status.toString() ==
//                         '1')
//                       Container(
//                         decoration: BoxDecoration(
//                           borderRadius:
//                           const BorderRadius.all(Radius.circular(3)),
//                           color: Colors.green.shade100,
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Text(
//                             'Active',
//                             style: getTextStyle(
//                                 12, FontWeight.w600, ColorManager.green),
//                           ),
//                         ),
//                       ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
