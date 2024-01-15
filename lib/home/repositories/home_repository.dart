import 'package:dio/dio.dart';
import 'package:examtice_teacher/NetworkService/network_api_services.dart';
import 'package:examtice_teacher/resources/AppConfigs.dart';
import 'package:examtice_teacher/resources/AppUrls.dart';

class HomeRepository {
  final _apiService = NetworkApiServices();

  Future<dynamic> getStudentListAPI() async {
    var data = FormData.fromMap({
      'teacher_id': sessionLoginData?.data?.user?.id.toString(),
    });
    var response = _apiService.postApi(AppUrls.getStudentsListApi, data);
    return response;
  }

  Future<dynamic> getNotificationListAPI() async {
    var data = FormData.fromMap({
      'user_id': sessionLoginData?.data?.user?.id.toString(),
    });
    var response = _apiService.postApi(AppUrls.getNotificationListApi, data);
    return response;
  }
}
