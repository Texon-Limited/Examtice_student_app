
import 'dart:math';

import 'package:flutter/material.dart';

class ColorManager {

  static Color brandColor = HexColor.fromHex("#F12679");
  static Color deepBlack = HexColor.fromHex("#172739");
  static Color smallTextBlack = HexColor.fromHex("#393F4F");
  static Color blackGridBackground = HexColor.fromHex("#222224");

  static Color green = HexColor.fromHex("#0DB050");


  static Color grey4 = HexColor.fromHex("#BDBDBD");
  static Color grayLight = HexColor.fromHex("#828282");
  static Color grayBorder = HexColor.fromHex("#DDE2E9");

  static Color blueTextColor = HexColor.fromHex("#2C80FE");
  static Color inactiveTabColor = HexColor.fromHex("#EDA0BF");

  static Color uiBackgroundColor = HexColor.fromHex("#F4F5F8");


  //darkMode
  static Color darkModeCard = HexColor.fromHex("#2B2B30");


  static const Color primary = contentColorCyan;
  static const Color menuBackground = Color(0xFF090912);
  static const Color itemsBackground = Color(0xFF1B2339);
  static const Color pageBackground = Color(0xFF282E45);
  static const Color mainTextColor1 = Colors.white;
  static const Color mainTextColor2 = Colors.white70;
  static const Color mainTextColor3 = Colors.white38;
  static const Color mainGridLineColor = Colors.white10;
  static const Color borderColor = Colors.white54;
  static const Color gridLinesColor = Color(0x11FFFFFF);

  static const Color contentColorBlack = Colors.black;
  static const Color contentColorWhite = Colors.white;
  static const Color contentColorBlue = Color(0xFF2196F3);
  static const Color contentColorYellow = Color(0xFFFFC300);
  static const Color contentColorOrange = Color(0xFFFF683B);
  static const Color contentColorGreen = Color(0xFF3BFF49);
  static const Color contentColorPurple = Color(0xFF6E1BFF);
  static const Color contentColorPink = Color(0xFFFF3AF2);
  static const Color contentColorRed = Color(0xFFE80054);
  static const Color contentColorCyan = Color(0xFF50E4FF);

  static List<Color> circleColors = [brandColor, blueTextColor, Colors.green];
  static Color randomGenerator() {
    return circleColors[Random().nextInt(2)];
  }

}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = "FF" + hexColorString; // 8 char with opacity 100%
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}