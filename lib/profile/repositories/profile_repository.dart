import 'package:dio/dio.dart';

import '../../NetworkService/network_api_services.dart';
import '../../resources/AppConfigs.dart';
import '../../resources/AppUrls.dart';

class ProfileRepository {

  final _apiService = NetworkApiServices();

  Future<dynamic> getSupportListAPI() async {
    var data = FormData.fromMap({
      'userId': sessionLoginData?.data?.user?.id,
    });

    var response = _apiService.postApi(AppUrls.updateProfileApi,data);
    return response;
  }

}