import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_fonts.dart';

class CustomTextWidget extends StatelessWidget {
  final String text;
  final double? textSize;
  final Color? textColor;
  final FontWeight? fontWeight;
  final String? fontFamily;
  final TextAlign textAlign;
  final VoidCallback? onTap;

  const CustomTextWidget({
    super.key,
    required this.text,
    this.textSize = 13,
    this.textColor = Colors.black,
    this.fontWeight = FontWeight.normal,
    this.fontFamily = AppFonts.interRegular,
    this.textAlign = TextAlign.left,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        text,
        style: TextStyle(
          fontSize: textSize,
          color: textColor,
          fontWeight: fontWeight,
          fontFamily: fontFamily,
        ),
        textAlign: textAlign,
      ),
    );
  }
}
