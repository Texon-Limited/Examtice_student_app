import 'package:flutter/material.dart';

import '../../../resources/AppConfigs.dart';
import '../../../resources/colors.dart';
import '../../../resources/styles.dart';

class SliderItem extends StatelessWidget {
  String image, title, description;

//Constructor created
  SliderItem({super.key, required this.image, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(image: AssetImage(image)),
        const SizedBox(height: 32),
        Text(title,textAlign: TextAlign.center,
            style:
            getTextStyle(20, FontWeight.w600,
                currentTheme.getCurrentTheme() == ThemeMode.dark ? Colors.white :
                ColorManager.deepBlack)),
        const SizedBox(height: 16),
        Text(description,textAlign: TextAlign.center,
            style: getTextStyle(
                14, FontWeight.w400,
                currentTheme.getCurrentTheme() == ThemeMode.dark ? Colors.white70 :
                ColorManager.smallTextBlack)),
        const SizedBox(height: 16),
      ],
    );
  }
}
