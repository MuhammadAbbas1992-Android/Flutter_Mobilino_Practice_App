import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobilino/res/custom_widgets/custom_text_widget.dart';

import '../../constants/app_colors.dart';
import '../../utils/app_utils.dart';
import '../../view_models/controllers/products/admin_products_controller.dart';
import '../../view_models/controllers/products/user_products_controller.dart';

class CustomCartInfoWidget extends StatelessWidget {
  const CustomCartInfoWidget({
    super.key,
    this.deleteIcon,
    required this.productIndex,
    this.onTap,
    this.adminProductsController,
    this.userProductsController,
  });

  final String? deleteIcon;
  final int productIndex;
  final VoidCallback? onTap;
  final AdminProductsController? adminProductsController;
  final UserProductsController? userProductsController;
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
                          onTap: () => deleteIcon != null
                              ? adminProductsController
                                  ?.deleteAdminProduct(productIndex)
                              : null,
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
                          AppUtils.isUserLogin
                              ? userProductsController!
                                  .userCategoryList[productIndex].imageUrl
                              : adminProductsController!
                                  .adminCategoryList[productIndex].imageUrl,
                          fit: BoxFit.fill,
                        )),
                    const SizedBox(height: 8),
                    CustomTextWidget(
                      text: AppUtils.isUserLogin
                          ? userProductsController!
                              .userCategoryList[productIndex].name
                          : adminProductsController!
                              .adminCategoryList[productIndex].name,
                      textSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    CustomTextWidget(
                      text: AppUtils.isUserLogin
                          ? userProductsController!
                              .userCategoryList[productIndex].price
                          : adminProductsController!
                              .adminCategoryList[productIndex].price,
                      textSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ))),
    );
  }
}
