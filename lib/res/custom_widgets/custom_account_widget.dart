import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobilino/res/custom_widgets/custom_text_widget.dart';

import '../routs/routs_name.dart';

class CustomAccountWidget extends StatelessWidget {
  final String textHint;
  final Color textHintColor;
  final double textHintSize;
  final String textLink;
  final Color textLinkColor;
  final double textLinkSize;
  final VoidCallback onTap;

  const CustomAccountWidget({
    super.key,
    required this.textHint,
    this.textHintColor = Colors.black,
    this.textHintSize = 12,
    required this.textLink,
    this.textLinkColor = Colors.black,
    this.textLinkSize = 12,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomTextWidget(
          text: textHint,
          textSize: textHintSize,
          textColor: textHintColor,
        ),
        const SizedBox(
          width: 5.0,
        ),
        InkWell(
          onTap: onTap,
          child: CustomTextWidget(
            text: textLink,
            textSize: textLinkSize,
            textColor: textLinkColor,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
