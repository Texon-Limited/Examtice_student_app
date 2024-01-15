
import 'package:dio/dio.dart';

import '../../NetworkService/network_api_services.dart';
import '../../resources/AppConfigs.dart';
import '../../resources/AppUrls.dart';

class SavedTestRepository {
  final _apiService = NetworkApiServices();

  Future<dynamic> getSavedExamListAPI() async {
    var data = FormData.fromMap({
      'user_id': sessionLoginData?.data?.user?.id,
    });
    print('========>${sessionLoginData?.data?.user?.id}');
    var response = _apiService.postApi(AppUrls.savedExamListApi, data);
    return response;
  }

  Future<dynamic> callGetQuestionAnswer(String testID) async {
    print('testId$testID');
    var data = FormData.fromMap({
      'test_id': testID,
    });
    var response = _apiService.postApi(AppUrls.savedQuestionsListApi, data);
    return response;
  }

  Future<dynamic> callGetAllQuestionWithAnswer(
      List<int> topicsID,
      int courseID,
      int type,
      List<int> year,
      String subjectID,
      int numberOfQuestion,
      bool isExam,
      int totalQuestion,
      int randomQuestion,
      int flagQuestion,
      ) async {
    var data = FormData.fromMap({
      "topicsId": topicsID,
      "courseId": courseID,
      "type": type,
      "year": [selectedYearGlobalData.value],
      "subjectId": subjectID,
      "number_of_question": numberOfQuestion,
      "user_id": sessionLoginData?.data?.user?.id ?? 0,
      "isExam": isExam,
      "total_question": totalQuestion,
      "randomquestion": randomQuestion,
      "flagquestion": flagQuestion
    });
    print('Here are datas-----> $data');
    var response = _apiService.postApi(AppUrls.getQuestionsWithAns, data);
    return response;
  }

  Future<dynamic> callSendQuestionAnswer(String testID,String quesID, String chosenOption,) async {
    var data = FormData.fromMap({});
    var response = _apiService.postApi(
      AppUrls.setQuestionAns(testID, quesID, chosenOption), data,
    );
    return response;
  }

  Future<dynamic> callSendTime(String testID, String spentTime,) async {
    var data = FormData.fromMap({});
    var response = _apiService.postApi(
      AppUrls.setSpentTime(testID, '${sessionLoginData?.data?.user?.id}', spentTime), data,
    );
    return response;
  }

  Future<dynamic> callSaveTest(String testID, String spentTime,) async {
    // var data = FormData.fromMap({});
    // var response = _apiService.postApi(
    //   AppUrls.setSaveTest(testID, spentTime), data,
    // );
    // return response;
    try {
      Dio dio = Dio();
      Map<String, dynamic> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${sessionLoginData?.data?.token?.accessToken}',
      };
      Map<String, dynamic> data = {};
      Response response = await dio.post(
        AppUrls.setSaveTest(testID, spentTime),
        data: data,
        options: Options(headers: headers),
      );
      print('Response status: ${response.statusCode}');
      print('Response data: ${response.data}');
    } catch (error) {
      print('Error sending request: $error');
    }
  }

}