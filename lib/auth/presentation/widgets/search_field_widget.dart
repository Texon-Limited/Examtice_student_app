
import 'package:examtice_teacher/resources/colors.dart';
import 'package:examtice_teacher/resources/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class SearchWidget extends StatelessWidget {
  final TextEditingController controller;
  final bool isEnabled ;
  final Color? backgroundColor;
  final BoxBorder? border;
  final Icon? prefixIcon;
  final IconButton? suffixIcon;
  final String? hintText;
  final bool? obscureText;
  void Function(String)? onChanged;
  final String? Function(String?)? validator;

  SearchWidget({Key? key, required this.controller, required this.isEnabled, this.backgroundColor,
    this.border, this.prefixIcon, this.hintText,this.onChanged,this.suffixIcon,this.obscureText, this.validator}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: double.infinity,
      // height: 56,
      decoration: BoxDecoration(
          color: backgroundColor ?? Colors.white,
          borderRadius: BorderRadius.circular(4),
          border:  border
      ),
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        validator: validator,
        enabled: isEnabled,
        obscureText: obscureText ?? false,
        style:getTextStyle(14, FontWeight.w400, ColorManager.grayLight),
        decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            contentPadding: const EdgeInsets.all(12.0),
            hintText: hintText ?? "Search here",
            // errorBorder: const OutlineInputBorder()
            // hintStyle: getRegularStyle(
            //     fontSize: 14,color: ColorManager.gray400
            // )
        ),
      ),
    )
    ;
  }
}