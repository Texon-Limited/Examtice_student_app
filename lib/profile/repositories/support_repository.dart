import 'package:dio/dio.dart';

import '../../NetworkService/network_api_services.dart';
import '../../resources/AppConfigs.dart';
import '../../resources/AppUrls.dart';

class SupportRepository {
  final _apiService = NetworkApiServices();

  Future<dynamic> getSupportListAPI() async {
    var data = FormData.fromMap({
      'userId': sessionLoginData?.data?.user?.id,
    });

    var response = _apiService.postApi(AppUrls.getSupportListApi,data);
    return response;
  }


  Future<dynamic> getSupportCommentsAPI(String ticketId) async {
    var data = FormData.fromMap({
      'userId': sessionLoginData?.data?.user?.id,
      'ticketId': ticketId,
    });

    var response = _apiService.postApi(AppUrls.getSupportCommentsApi,data);
    return response;
  }


  Future<dynamic> addNewCommentApi(String ticketId, String textComment) async {
    var data = FormData.fromMap({
      'userId': sessionLoginData?.data?.user?.id,
      'ticket_id': ticketId,
      'comment_text': textComment
    });

    var response = _apiService.postApi(AppUrls.createNewComment,data);
    return response;
  }


  Future<dynamic> addNewTicketApi({required String title, required String content, required String categoryId}) async {
    var data = FormData.fromMap({
      "userId": sessionLoginData?.data?.user?.id,
      "title": title,
      "content":content,
      'category_id': categoryId
    });

    var response = _apiService.postApi(AppUrls.createNewTicket,data);
    return response;
  }
}
