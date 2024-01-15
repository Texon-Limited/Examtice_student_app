class AppUrls {
  static const baseUrl = 'https://www.examtice.com/backend/api';
  static const pictureUrl =
      'https://www.examtice.com/backend/assets/images/courses/';

  ///auth
  static const loginApi = '$baseUrl/login';
  static const signUpApi = '$baseUrl/register';

  ///home
  static const getStudentsListApi = '$baseUrl/getLmsStudentList';
  static const getNotificationListApi = '$baseUrl/my_notice';

  ///exam
  static const getExamListApi = '$baseUrl/get_lms_exam_list_for_student';
  static const getCourseListApi = '$baseUrl/getCourses';

  ///saved exam
  static const savedExamListApi = '$baseUrl/get_saved_test';
  static const savedQuestionsListApi = '$baseUrl/get_saved_test_questions';


  ///ques with ans
  static const getQuestionsWithAns = '$baseUrl/getQuestionswithanswer';
  static setQuestionAns (String testID, String quesID, String chosenOption)
  => '$baseUrl/save_test_data/?choosen_option=$chosenOption&question_id=$quesID&testId=$testID';
  static setSpentTime (String testID, String userId, String spentTime)
  => '$baseUrl/saveTime?spentTime=$spentTime&testId=$testID&userId=$userId';
  static setSaveTest (String testID, String spentTime)
  => '$baseUrl/save_user_test?testId=$testID&spentTime=$spentTime';


  ///student
  static const getAllShopItemsApi = '$baseUrl/getCourses';
  static const getCourseSubjectListApi = '$baseUrl/getCourseSubjects';
  static const getCourseSubjectYearListApi = '$baseUrl/getSubjectsYear';

  static const getSubjectTopicListApi = '$baseUrl/getSubjectsTopics';
  static const getQuestionListApi = '$baseUrl/getLmsExamQuestions';
  static const createExamApi = '$baseUrl/createLmsExam';
  static const getExamDetailsApi = '$baseUrl/get_lms_exam_students';
  static const getExamQuestionsAnswersApi = '$baseUrl/get_lms_exam_details';

  ///lms
  static const getLMSExamDetailsApi = '$baseUrl/studentLmsExamReport';


  /// support
  static const getSupportListApi = '$baseUrl/getTicketList';
  static const getSupportCommentsApi = '$baseUrl/getTicketComments';
  static const createNewComment = '$baseUrl/storeTicketComments';
  static const createNewTicket = '$baseUrl/createticket';

  ///Subscription
  static const mySubscriptionApi = '$baseUrl/my_subscription';
  static const mySubscriptionDetailsApi = '$baseUrl/my_subscription_detail';

  ///Reports
  static const myReportsApi = '$baseUrl/reports';
  static const myReportDetailsApi = '$baseUrl/report';

  ///profile
  static const updateProfileApi = '$baseUrl/edit_profile';
  static const notificationListApi = '$baseUrl/my_notice';

  ///teacher
  static const getLAllTeachersListApi = '$baseUrl/requested-teacher-list';

}
