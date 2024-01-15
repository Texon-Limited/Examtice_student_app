import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InternetExceptionWidget extends StatelessWidget {
  final VoidCallback onPress;
  const InternetExceptionWidget({Key? key, required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: Get.height * 0.15,
          ),
          const Icon(
            Icons.cloud_off,
            color: Colors.red,
          ),
          const SizedBox(
            height: 16,
          ),
          Text('internet_exp'.tr),
          SizedBox(
            height: Get.height * 0.15,
          ),
          ElevatedButton(onPressed: onPress, child: const Text('Retry'))
        ],
      ),
    );
  }
}
