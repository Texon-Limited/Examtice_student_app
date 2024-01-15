import 'package:flutter/material.dart';

class RoundButtonWidget extends StatelessWidget {
  const RoundButtonWidget({
    Key? key,
    required this.loading,
    required this.title,
    required this.width,
    required this.height,
    required this.onPress,
    required this.textColor,
    required this.buttonColor,
    this.icon,
  }) : super(key: key);

  final bool loading;
  final String title;
  final IconData ? icon;
  final double width, height;
  final VoidCallback onPress;
  final Color textColor, buttonColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width ?? double.infinity,
      decoration: BoxDecoration(
          color: buttonColor, borderRadius: BorderRadius.circular(8)),
      child: loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: textColor),
                  ),
                  const SizedBox(width: 10,),
                  icon == null ? const SizedBox() : Icon(icon, size: 17, color: Colors.white,),
                ],
              ),
            ),
    );
  }
}
