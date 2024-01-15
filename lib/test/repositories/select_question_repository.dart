
import '../../NetworkService/network_api_services.dart';
import '../../resources/AppConfigs.dart';
import '../../resources/AppUrls.dart';

class QuestionRepository {
  final _apiService = NetworkApiServices();

  Future<dynamic> getQuestionListAPI({required String subjectId}) async {

    var topicIds = [];
    for (var element in selectedTopicListGlobalData) {
      topicIds.add(element.topicId);
    }

    Map<String, dynamic>  data = {
      // 'subjectId': subjectId,
      // 'user_id': sessionLoginData?.data?.user?.id ?? 0,
      // 'type' : '1',
      // 'year' : [selectedYearGlobalData.value]
      "topicsId": topicIds,
      "courseId": selectedCourseGlobalData.value.id,
      "examName": examNameGlobalData,
      "type": "1",
      "year": [
        selectedYearGlobalData.value
      ],
      "subjectId": subjectId,
      // "number_of_question": 0,
      // "user_id": 58,
      // "isExam": false,
      // "total_question": 2
    };
    var response = _apiService.postApiWithObject(AppUrls.getQuestionListApi, data);
    return response;
  }


  Future<dynamic> createExamAPI({required String subjectId, required List<int> questionsIds}) async {

    var topicIds = [];
    for (var element in selectedTopicListGlobalData) {
      topicIds.add(element.topicId);
    }

    var studentIds = [];
    for (var element in selectedListGlobalData) {
      studentIds.add(element.id);
    }
    Map<String, dynamic>  data = {
      "topicsId": topicIds,
      "courseId": selectedCourseGlobalData.value.id,
      "examName": examNameGlobalData,
      "type": 1,
      "year": [
        selectedYearGlobalData.value
      ],
      "subjectId": subjectId,
      "student_ids" : studentIds,
      "question_id" : questionsIds,
      // "number_of_question": 0,
      'user_id': sessionLoginData?.data?.user?.id.toString(),
      // "isExam": false,
      "total_questions": []
    };
    var response = _apiService.postApiWithObject(AppUrls.createExamApi, data);
    return response;
  }


}
