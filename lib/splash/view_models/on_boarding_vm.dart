import 'dart:async';

import 'package:examtice_teacher/splash/presentation/pages/on_bording_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../resources/constants.dart';
import '../../routes/app_routes.dart';
import '../models/slider.dart';

class OnBoardingViewModel extends GetxController {

  var onPageIndex = 0.obs;
  var pageController = PageController();
  List<SliderModel> slides = [];
  bool get isLastPage => onPageIndex.value == slides.length - 1;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    slides = getSlides();
  }

  List<SliderModel> getSlides() {
    List<SliderModel> slides = <SliderModel>[];
    SliderModel sliderModel = new SliderModel();

// Item 1
    sliderModel.setImage(AssetConstant.slider1);
    sliderModel.setTitle("Want to score 100%,\n Learn With Us");
    sliderModel.setDescription(
        "There are many variations of passages of Lorem Ipsum available, but the majority ");
    slides.add(sliderModel);

    sliderModel = new SliderModel();

// Item 2
    sliderModel.setImage(AssetConstant.slider2);
    sliderModel
        .setTitle("Want to score 100%, We will prepare you for your exam");
    sliderModel.setDescription(
        "There are many variations of passages of Lorem Ipsum available, but the majority ");
    slides.add(sliderModel);

    sliderModel = new SliderModel();

// Item 3
    sliderModel.setImage(AssetConstant.slider3);
    sliderModel.setTitle("Make money by referring and earn 20%");
    sliderModel.setDescription(
        "There are many variations of passages of Lorem Ipsum available, but the majority ");
    slides.add(sliderModel);

    sliderModel = new SliderModel();
    return slides;
  }
}
