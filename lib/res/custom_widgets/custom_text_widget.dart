import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_fonts.dart';

class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget({
    super.key,
    required this.text,
    this.size = 12,
    this.color = AppColors.black,
    this.fontWeight = FontWeight.normal,
    this.fontFamily = AppFonts.interRegular,
    this.textAlign = TextAlign.left,
    this.onTap,
  });

  final String text;
  final double? size;
  final Color? color;
  final FontWeight? fontWeight;
  final String? fontFamily;
  final TextAlign textAlign;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        text,
        style: TextStyle(
          fontSize: size,
          color: color,
          fontWeight: fontWeight,
          fontFamily: fontFamily,
        ),
        textAlign: textAlign,
      ),
    );
  }
}
