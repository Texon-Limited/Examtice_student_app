import 'package:dio/dio.dart';

import '../../NetworkService/network_api_services.dart';
import '../../resources/AppConfigs.dart';
import '../../resources/AppUrls.dart';

class StudentsRepository {
  final _apiService = NetworkApiServices();

  Future<dynamic> getAllTeachersListAPI() async {
    var data = FormData.fromMap({
      'userId':  sessionLoginData?.data?.user?.id.toString(),
      'userRole' : sessionLoginData?.data?.user?.affiliateRole.toString(),
    });
    print(data);
    var response = _apiService.postApi(AppUrls.getLAllTeachersListApi, data);
    return response;
  }


}