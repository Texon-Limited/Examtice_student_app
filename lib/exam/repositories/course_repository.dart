import 'package:dio/dio.dart';

import '../../NetworkService/network_api_services.dart';
import '../../resources/AppConfigs.dart';
import '../../resources/AppUrls.dart';

class CourseRepository {
  final _apiService = NetworkApiServices();

  Future<dynamic> getCourseListAPI() async {
    var response = _apiService.getApi(AppUrls.getCourseListApi);
    return response;
  }

  Future<dynamic> getSubjectListAPI({required String courseId}) async {
    var data = FormData.fromMap({
      'courseId': courseId,
      'user_id': sessionLoginData?.data?.user?.id.toString(),
    });
    var response = _apiService.postApi(AppUrls.getCourseSubjectListApi, data);
    return response;
  }

  Future<dynamic> getYearListAPI({required String courseId, required String subjectId}) async {
    var data = FormData.fromMap({
      'courseId': courseId,
      'subjectId': subjectId,
      'user_id': sessionLoginData?.data?.user?.id.toString(),
    });
    var response = _apiService.postApi(AppUrls.getCourseSubjectYearListApi, data);
    return response;
  }
}
