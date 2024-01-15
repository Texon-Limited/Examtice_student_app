import 'package:examtice_teacher/NetworkService/network_api_services.dart';
import 'package:examtice_teacher/resources/AppUrls.dart';

class LoginRepository {

  final _apiService = NetworkApiServices();

  Future<dynamic> loginApi(var data) async{
    var response = _apiService.postApi(AppUrls.loginApi,data);
    return response;

}
}