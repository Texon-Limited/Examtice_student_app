import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'fonts.dart';

TextStyle getTextStyle(
    double fontSize, FontWeight fontWeight, Color color) {
  return GoogleFonts.openSans(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight);
}
// // regular style
// TextStyle getRegularStyle(
//     {required double fontSize, required Color color}) {
//   return _getTextStyle(
//       fontSize,  FontWeightManager.regular, color);
// }
// // Semi Bold style
// TextStyle getSemiBoldStyle(
//     {required double fontSize, required Color color}) {
//   return _getTextStyle(
//       fontSize,  FontWeightManager.semiBold, color);
// }
//
// // Bold style
// TextStyle getBoldStyle(
//     {required double fontSize, required Color color}) {
//   return _getTextStyle(
//       fontSize,  FontWeightManager.bold, color);
// }