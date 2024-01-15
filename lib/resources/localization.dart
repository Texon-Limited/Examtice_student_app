import 'package:examtice_teacher/resources/constants.dart';
import 'package:get/get_navigation/src/root/internacionalization.dart';

class AppLocalization extends Translations{
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys =>{

    'en_US' : {
      'email_hint' : 'Enter email',
      'internet_exp' : MessageConstant.noInternetMessage,
    }

  };


}