import 'package:dio/dio.dart';

import '../../NetworkService/network_api_services.dart';
import '../../resources/AppConfigs.dart';
import '../../resources/AppUrls.dart';

class EshopRepository {
  final _apiService = NetworkApiServices();

  Future<dynamic> getAllSubscriptionItemsAPI() async {
    var response = _apiService.getApi(AppUrls.getAllShopItemsApi);
    return response;
  }



}