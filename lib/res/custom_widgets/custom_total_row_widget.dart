import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:mobilino/constants/app_colors.dart';
import 'package:mobilino/res/custom_widgets/custom_text_widget.dart';
import 'package:mobilino/utils/app_utils.dart';

class CustomTotalRowWidget extends StatelessWidget {
  const CustomTotalRowWidget({
    super.key,
    this.controller,
  });
  final dynamic controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: AppColors.lightGrey),
          borderRadius: BorderRadius.circular(4)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CustomTextWidget(
              text: 'Total',
              textSize: 16,
              fontWeight: FontWeight.bold,
            ),
            Obx(
              () => CustomTextWidget(
                  text: '\$${controller.grandTotalPayment.value}',
                  textSize: 16,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.right),
            ),
          ],
        ),
      ),
    );
  }
}
