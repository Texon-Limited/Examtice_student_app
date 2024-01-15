import 'package:dio/dio.dart';

import '../../NetworkService/network_api_services.dart';
import '../../resources/AppConfigs.dart';
import '../../resources/AppUrls.dart';

class ExamRepository {
  final _apiService = NetworkApiServices();

  Future<dynamic> getStudentExamListAPI() async {
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


  Future<dynamic> getQuestionAnswerApi(String examId) async {
    var data = {
      'examId': examId,
    };
    var response = _apiService.postApi(AppUrls.getExamQuestionsAnswersApi, data);
    return response;
  }


}