import 'package:dio/dio.dart';

import '../../NetworkService/network_api_services.dart';
import '../../resources/AppConfigs.dart';
import '../../resources/AppUrls.dart';

class ExamRepository {
  final _apiService = NetworkApiServices();

  Future<dynamic> getStudentLMSExamListAPI() async {
    var data = FormData.fromMap({
      'user_id': sessionLoginData?.data?.user?.id,
    });
    var response = _apiService.postApi(AppUrls.getExamListApi, data);
    return response;
  }


  Future<dynamic> getExamStudentDetailsApi(String examId) async {
    var data = {
      'examId': examId,
    };
    var response = _apiService.postApi(AppUrls.getExamDetailsApi, data);
    return response;
  }


  Future<dynamic> getExamDetailsApi(String examId, String studentID) async {
    var data = {
      'examId': examId,
      'student_id': studentID
    };
    var response = _apiService.postApi(AppUrls.getLMSExamDetailsApi, data);
    return response;
  }

  Future<dynamic> getQuestionAnswerApi(String examId) async {
    var data = {
      'examId': 'S1QnazXS8YO6V5d0',//examId,
    };
    var response = _apiService.postApi(AppUrls.getExamQuestionsAnswersApi, data);
    return response;
  }


}