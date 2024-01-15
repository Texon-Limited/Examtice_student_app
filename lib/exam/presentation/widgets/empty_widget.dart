import 'package:flutter/cupertino.dart';

class EmptyData extends StatelessWidget {
  const EmptyData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Container(
      padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 32),
      child: const Text("No Data Found"),
    );
  }
}
