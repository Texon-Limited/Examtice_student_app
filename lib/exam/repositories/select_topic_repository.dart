
import '../../NetworkService/network_api_services.dart';
import '../../resources/AppConfigs.dart';
import '../../resources/AppUrls.dart';

class TopicRepository {
  final _apiService = NetworkApiServices();

  Future<dynamic> getTopicListAPI({required String subjectId}) async {
    Map<String, dynamic>  data = {
      'subjectId': subjectId,
      'user_id': sessionLoginData?.data?.user?.id ?? 0,
      'type' : '1',
      'year' : [selectedYearGlobalData.value]
    };
    var response = _apiService.postApiWithObject(AppUrls.getSubjectTopicListApi, data);
    return response;
  }
}
