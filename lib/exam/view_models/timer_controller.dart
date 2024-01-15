import 'dart:async';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../resources/AppConfigs.dart';

class TimerViewModel extends GetxController{

  Timer? _timer;
  int remainingSeconds =0;
  final time = '00.00.00'.obs;

  @override
  void onReady(){

    DateTime dateTime = DateFormat('HH:mm:ss').parse(selectedTestGlobalData.value.timeSpent.toString());
    if(dateTime != null){
      print(dateTime.hour * 60);
      print(dateTime.minute * 60);
      print(dateTime.second    );
      time.value = selectedTestGlobalData.value.timeSpent.toString();
      remainingSeconds = (dateTime.hour * 60 * 60) + (dateTime.minute * 60) + (dateTime.second);
      _startTimer((dateTime.hour * 60 * 60) + (dateTime.minute * 60) + (dateTime.second  ));
    }else{
      _startTimer(0);

    }

    super.onReady();
  }

  @override
  void onClose(){
    if(_timer!=null){
      _timer!.cancel();
    }
    super.onClose();
  }

  _startTimer(int seconds){
    const duration = Duration(seconds: 1);
    // remainingSeconds = seconds;
    _timer = Timer.periodic(duration, (Timer timer) {
      remainingSeconds++;
      // if(remainingSeconds==0){
      //   timer.cancel();
      // }else{

      Duration myDuration = Duration(seconds: remainingSeconds);

      String strDigits(int n) => n.toString().padLeft(2, '0');
      final days = strDigits(myDuration.inDays);
      final hours = strDigits(myDuration.inHours.remainder(24));
      final minutes = strDigits(myDuration.inMinutes.remainder(60));
      final seconds = strDigits(myDuration.inSeconds.remainder(60));
      //
      // int hours = remainingSeconds~/60;
      // int minutes = remainingSeconds~/60;
      //   int seconds = (remainingSeconds%60);
        time.value = "${hours.toString().padLeft(2, "0")}:${minutes.toString().padLeft(2, "0")}:${seconds.toString().padLeft(2, "0")}";
      //   remainingSeconds++;
      // }
    });
  }
}