import 'package:examtice_teacher/auth/presentation/pages/landing_screen.dart';
import 'package:examtice_teacher/auth/presentation/pages/sign_up_screen.dart';
import 'package:examtice_teacher/auth/view_model_bindings/landing_screen_vm.dart';
import 'package:examtice_teacher/auth/view_model_bindings/signin_screen_binding.dart';
import 'package:examtice_teacher/eshop/bindings/eshop_screen_binding.dart';
import 'package:examtice_teacher/eshop/presentation/pages/eshop_screen.dart';
import 'package:examtice_teacher/exam/bindings/create_exam_binding.dart';
import 'package:examtice_teacher/exam/bindings/exam_details_binding.dart';
import 'package:examtice_teacher/exam/bindings/exam_screen_binding.dart';
import 'package:examtice_teacher/exam/bindings/saved_test_binding.dart';
import 'package:examtice_teacher/exam/bindings/select_course_binding.dart';
import 'package:examtice_teacher/exam/bindings/select_question_binding.dart';
import 'package:examtice_teacher/exam/bindings/select_topic_screen_binding.dart';
import 'package:examtice_teacher/exam/presentation/pages/cr_ex_select_course_screen.dart';
import 'package:examtice_teacher/exam/presentation/pages/cr_ex_select_question_screen.dart';
import 'package:examtice_teacher/exam/presentation/pages/cr_ex_select_student_screen.dart';
import 'package:examtice_teacher/exam/presentation/pages/cr_ex_select_topic_screen.dart';
import 'package:examtice_teacher/exam/presentation/pages/exam_details_screen.dart';
import 'package:examtice_teacher/exam/presentation/pages/exam_screen.dart';
import 'package:examtice_teacher/exam/presentation/pages/reports_screen.dart';
import 'package:examtice_teacher/exam/presentation/pages/saved_test_screen.dart';
import 'package:examtice_teacher/exam/presentation/pages/test_details_screen.dart';
import 'package:examtice_teacher/exam/view_models/select_exam_vm.dart';
import 'package:examtice_teacher/exam/view_models/select_question_vm.dart';
import 'package:examtice_teacher/forum/bindings/forum_bindings.dart';
import 'package:examtice_teacher/forum/presentation/pages/create_new_topic.dart';
import 'package:examtice_teacher/forum/presentation/pages/forum_screen.dart';
import 'package:examtice_teacher/forum/presentation/pages/topic_details_screen.dart';
import 'package:examtice_teacher/home/bindings/home_screen_bindings.dart';
import 'package:examtice_teacher/home/presentation/pages/home_screen.dart';
import 'package:examtice_teacher/home/presentation/pages/scoreboard_screen.dart';
import 'package:examtice_teacher/notifications/notification_binding.dart';
import 'package:examtice_teacher/notifications/notification_screen.dart';
import 'package:examtice_teacher/profile/bindings/create_support_binding.dart';
import 'package:examtice_teacher/profile/bindings/edit_profile_binding.dart';
import 'package:examtice_teacher/profile/bindings/support_details_bindings.dart';
import 'package:examtice_teacher/profile/bindings/support_screen_binding.dart';
import 'package:examtice_teacher/profile/presentation/pages/SupportDetailsScreen.dart';
import 'package:examtice_teacher/profile/presentation/pages/change_password_screen.dart';
import 'package:examtice_teacher/profile/presentation/pages/create_support_screen.dart';
import 'package:examtice_teacher/profile/presentation/pages/edit_profile_screen.dart';
import 'package:examtice_teacher/profile/presentation/pages/profile_screen.dart';
import 'package:examtice_teacher/profile/presentation/pages/support_screen.dart';
import 'package:examtice_teacher/splash/bindings/splash_screen_bindings.dart';
import 'package:examtice_teacher/splash/bindings/on_boarding_bindings.dart';
import 'package:examtice_teacher/splash/presentation/pages/on_bording_screen.dart';
import 'package:examtice_teacher/students/bindings/students_screen_binding.dart';
import 'package:examtice_teacher/students/presentation/pages/students_screen.dart';
import 'package:examtice_teacher/subscriptions/pages/subscriptions_screen.dart';
import 'package:flutter/animation.dart';
import 'package:get/get.dart';

import '../auth/presentation/pages/sign_in_screen.dart';
import '../auth/view_model_bindings/sign_up_screen_binding.dart';
import '../profile/bindings/profile_screen_binding.dart';
import '../splash/presentation/pages/splash_screen.dart';
import '../subscriptions/bindings/subscription_screen_bindings.dart';
import 'app_routes.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.splashScreen,
      page: () => SplashScreen(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: AppRoutes.onBoardingScreen,
      page: () => const OnBoardingScreen(),
      binding: OnBoardingScreenBinding(),
    ),
    GetPage(
      name: AppRoutes.signInScreen,
      page: () => const SignInScreen(),
      binding: SignInScreenBinding(),
    ),
    GetPage(
      name: AppRoutes.signUpScreen,
      page: () => SignUpScreen(),
      binding: SignUpScreenBinding(),
    ),
    GetPage(
      name: AppRoutes.landingScreen,
      page: () => const LandingScreen(),
      binding: LandingScreenBinding(),
    ),
    GetPage(
      name: AppRoutes.homeScreen,
      page: () => const HomeScreen(),
      binding: HomeScreenBinding(),
    ),
    GetPage(
      name: AppRoutes.scoreboardScreen,
      page: () => const ScoreboardScreen(),
      binding: HomeScreenBinding(),
    ),
    GetPage(
      name: AppRoutes.notificationScreen,
      page: () => NotificationScreen(),
      binding: NotificationScreenBinding(),
    ),
    GetPage(
      name: AppRoutes.profileScreen,
      page: () => ProfileScreen(),
      binding: ProfileScreenBinding(),
    ),
    GetPage(
      name: AppRoutes.examScreen,
      page: () => LMSExamScreen(),
      binding: ExamScreenBinding(),
    ),
    GetPage(
      name: AppRoutes.studentsScreen,
      page: () => const SubscribedTeacherParentScreen(),
      binding: StudentScreenBinding(),
    ),
    GetPage(
      name: AppRoutes.savedTestScreen,
      page: () => SavedTestScreen(),
      binding: SavedTestScreenBinding(),
    ),
    GetPage(
      name: AppRoutes.testDetailsScreen,
      page: () => const TestDetailsScreen(),
      binding: SavedTestScreenBinding(),
    ),
    GetPage(
      name: AppRoutes.testDetailsScreen,
      page: () => const TestDetailsScreen(),
      binding: ExamScreenBinding(),
    ),
    GetPage(
      name: AppRoutes.reportsScreen,
      page: () => ReportsScreen(),
      binding: ExamScreenBinding(),
    ),
    GetPage(
      name: AppRoutes.shopsScreen,
      page: () => const EshopScreen(),
      binding: EShopScreenBinding(),
    ),
    GetPage(
      name: AppRoutes.selectCourse,
      page: () => const SelectCourseScreen(),
      binding: SelectCourseBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.createExam,
      page: () => CreateExamSelectStudentScreen(),
      binding: CreateExamBinding(),
    ),
    GetPage(
      name: AppRoutes.selectTopic,
      page: () => const SelectTopicScreen(),
      binding: SelectTopicBinding(),
    ),
    GetPage(
      name: AppRoutes.selectQuestion,
      page: () => const SelectQuestionScreen(),
      binding: SelectQuestionBinding(),
    ),
    GetPage(
      name: AppRoutes.examDetails,
      page: () => const ExamDetailsScreen(),
      binding: ExamDetailsBinding(),
    ),
    GetPage(
      name: AppRoutes.forum,
      page: () => const ForumScreen(),
      binding: ForumBinding(),
    ),
    GetPage(
      name: AppRoutes.forumTopicDetails,
      page: () => const TopicDetailsScreen(),
      binding: ForumBinding(),
    ),
    GetPage(
      name: AppRoutes.createNewTopicDetails,
      page: () => const CreateNewTopicScreen(),
      binding: ForumBinding(),
    ),
    GetPage(
      name: AppRoutes.supportList,
      page: () => const SupportScreen(),
      binding: SupportScreenBinding(),
    ),
    GetPage(
      name: AppRoutes.supportDetails,
      page: () => const SupportDetailsScreen(),
      binding: SupportDetailsScreenBinding(),
    ),
    GetPage(
      name: AppRoutes.supportCreate,
      page: () => CreateSupportScreen(),
      binding: CreateSupportScreenBinding(),
    ),
    GetPage(
      name: AppRoutes.editProfileScreen,
      page: () => EditProfileScreen(),
      binding: EditProfileScreenBinding(),
    ),
    GetPage(
      name: AppRoutes.changePassword,
      page: () => ChangePasswordScreen(),
      binding: EditProfileScreenBinding(),
    ),
    GetPage(
      name: AppRoutes.subscriptionScreen,
      page: () => const SubscriptionScreen(),
      binding: SubscriptionScreenBinding(),
    ),
  ];
}
