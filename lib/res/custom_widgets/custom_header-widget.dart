import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobilino/constants/app_colors.dart';
import 'package:mobilino/res/custom_widgets/custom_text_widget.dart';

import '../../constants/app_fonts.dart';

class CustomHeaderWidget extends StatelessWidget {
  final String text;
  final double textSize;
  final Color textColor;
  final String? icon;
  final Color iconColor;
  final double iconHeight;
  final double? iconWidth;
  final double iconLeftPadding;
  final double iconRightPadding;

  const CustomHeaderWidget({
    super.key,
    required this.text,
    this.textSize = 20,
    this.textColor = AppColors.darkGrey,
    this.icon,
    this.iconColor = AppColors.darkGrey,
    this.iconHeight = 23,
    this.iconWidth = 19,
    this.iconLeftPadding = 0,
    this.iconRightPadding = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomTextWidget(
          text: text,
          textSize: textSize,
          textColor: textColor,
          fontWeight: FontWeight.bold,
          fontFamily: AppFonts.interRegular,
        ),
        Padding(
          padding:
              EdgeInsets.only(left: iconLeftPadding, right: iconRightPadding),
          child: icon != null
              ? SvgPicture.asset(
                  icon!,
                  colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
                  width: iconWidth,
                  height: iconHeight,
                )
              : null,
        ),
      ],
    );
  }
}
