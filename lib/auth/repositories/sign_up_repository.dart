import 'package:examtice_teacher/NetworkService/network_api_services.dart';
import 'package:examtice_teacher/resources/AppUrls.dart';

class SignUpRepository {

  final _apiService = NetworkApiServices();

  Future<dynamic> signUpApi(var data) async{
    var response = _apiService.postApi(AppUrls.signUpApi,data);
    return response;

  }
}