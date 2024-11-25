import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobilino/res/custom_widgets/custom_text_widget.dart';

import '../../constants/app_colors.dart';
import '../../utils/app_utils.dart';

class CustomCartInfoWidget extends StatelessWidget {
  const CustomCartInfoWidget({
    super.key,
    this.deleteIcon,
    required this.productIndex,
    this.onTap,
    this.controller,
  });

  final String? deleteIcon;
  final int productIndex;
  final VoidCallback? onTap;
  final dynamic controller;

  @override
  Widget build(BuildContext context) {
    // ProductModel productModel = FirebaseServices.categoryList[productIndex];

    return InkWell(
      onTap: onTap,
      child: Card(
          elevation: 5,
          child: Container(
              decoration: BoxDecoration(
                color: AppColors.lightOrange,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () => AppUtils.selectedProduct(productIndex),
                          child: deleteIcon != null
                              ? AppUtils.isUserLogin
                                  ? SvgPicture.asset(
                                      deleteIcon!,
                                      color: AppColors.white,
                                    )
                                  : SvgPicture.asset(
                                      deleteIcon!,
                                    )
                              : null,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Container(
                      height: 115,
                      color: AppColors.lightOrange,
                      child: Image.network(
                        controller.categoryList[productIndex].imageUrl,
                        fit: BoxFit.fill,
                      ),
                    ),
                    const SizedBox(height: 8),
                    CustomTextWidget(
                      text: controller.categoryList[productIndex].name,
                      textSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    CustomTextWidget(
                      text: controller.categoryList[productIndex].price,
                      textSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ))),
    );
  }
}
