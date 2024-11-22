import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import 'custom_text_widget.dart';

class CustomTextButtonWidget extends StatelessWidget {
  final String buttonText;
  final double textSize;
  final Color textColor;
  final FontWeight fontWeight;
  final Color fillColor;
  final double radius;
  final double width;
  final double height;
  final VoidCallback? onTap;

  const CustomTextButtonWidget({
    super.key,
    required this.buttonText,
    this.textSize = 16.0,
    this.textColor = Colors.white,
    this.fontWeight = FontWeight.normal,
    this.fillColor = Colors.black,
    this.radius = 6,
    this.width = double.infinity,
    this.height = 44.0,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
          minimumSize: MaterialStateProperty.all<Size>(
              Size(width, height)), // Set custom height
          backgroundColor: MaterialStateProperty.all<Color>(fillColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
            ),
          )),
      onPressed: onTap,
      child: CustomTextWidget(
        text: buttonText,
        textColor: textColor,
        textSize: textSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
