import 'package:dio/dio.dart';

import '../../NetworkService/network_api_services.dart';
import '../../resources/AppConfigs.dart';
import '../../resources/AppUrls.dart';

class SubscriptionRepository {
  final _apiService = NetworkApiServices();

  Future<dynamic> getAllItemsAPI() async {
    var response = _apiService.getApi(AppUrls.mySubscriptionApi);
    return response;
  }

  Future<dynamic> getAllSubscriptionDetailsAPI(String id) async {
    var response = _apiService.getApi('${AppUrls.mySubscriptionDetailsApi}/$id');
    return response;
  }

}