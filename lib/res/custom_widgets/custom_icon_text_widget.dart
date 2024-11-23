import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_fonts.dart';

class CustomIconTextWidget extends StatelessWidget {
  final String text;
  final double? textSize;
  final Color? textColor;
  final FontWeight? fontWeight;
  final String? fontFamily;
  final TextAlign textAlign;
  final VoidCallback? onTap;
  final String? icon;
  final Color iconColor;
  final double? iconWidth;
  final double? iconHeight;
  final double iconLeftPadding;
  final double iconRightPadding;

  const CustomIconTextWidget({
    super.key,
    required this.text,
    this.textSize = 12,
    this.textColor = AppColors.white,
    this.fontWeight = FontWeight.normal,
    this.fontFamily = AppFonts.interRegular,
    this.textAlign = TextAlign.left,
    this.onTap,
    this.icon,
    this.iconColor = AppColors.white,
    this.iconWidth,
    this.iconHeight,
    this.iconLeftPadding = 0,
    this.iconRightPadding = 0,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Padding(
            padding:
                EdgeInsets.only(left: iconLeftPadding, right: iconRightPadding),
            child: icon != null
                ? SvgPicture.asset(
                    icon!,
                    colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
                  )
                : null,
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: textSize,
              color: textColor,
              fontWeight: fontWeight,
              fontFamily: fontFamily,
            ),
            textAlign: textAlign,
          ),
        ],
      ),
    );
  }
}
