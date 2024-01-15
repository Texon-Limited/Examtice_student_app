import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForumDetailsViewModel extends GetxController with GetSingleTickerProviderStateMixin {

  late TabController tabController;
  var tabIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(vsync: this, length: 2);
    tabController.addListener(() {
      if (tabController.indexIsChanging) {

      }
      else if (tabController.index != tabController.previousIndex) {
        tabIndex.value = tabController.index;
      }
    });
  }

  RxBool isExpanded = false.obs;
  final messageTextEditingController = TextEditingController().obs;


  final titleTextEditingController = TextEditingController().obs;
  final descriptionTextEditingController = TextEditingController().obs;

}