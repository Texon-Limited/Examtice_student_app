import 'package:dio/dio.dart';

import '../../NetworkService/network_api_services.dart';
import '../../resources/AppConfigs.dart';
import '../../resources/AppUrls.dart';

class NotificationRepository {

  final _apiService = NetworkApiServices();

  Future<dynamic> getNotificationListAPI() async {
    var data = FormData.fromMap({
      'userId': sessionLoginData?.data?.user?.id,
    });

    var response = _apiService.postApi(AppUrls.notificationListApi,data);
    return response;
  }

}