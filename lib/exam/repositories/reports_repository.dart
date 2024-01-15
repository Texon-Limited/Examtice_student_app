import 'package:dio/dio.dart';

import '../../NetworkService/network_api_services.dart';
import '../../resources/AppConfigs.dart';
import '../../resources/AppUrls.dart';

class ReportsRepository {
  final _apiService = NetworkApiServices();

  Future<dynamic> getAllItemsAPI() async {
    var data = {
      'userId': sessionLoginData?.data?.user?.id.toString(),
    };
    var response = _apiService.postApi(AppUrls.myReportsApi,data);
    return response;
  }

  Future<dynamic> getAllSubscriptionDetailsAPI(String id) async {
    var data = {
      'testId': id,
    };
    var response = _apiService.postApi(AppUrls.myReportDetailsApi,data);
    return response;
  }

}