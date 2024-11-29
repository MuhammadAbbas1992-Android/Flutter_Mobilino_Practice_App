import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:mobilino/res/custom_widgets/custom_text_widget.dart';
import 'package:mobilino/utils/app_utils.dart';
import 'package:mobilino/view_models/controllers/products/admin_products_controller.dart';
import 'package:mobilino/views/add_product/add_product_view.dart';

import '../../constants/app_colors.dart';
import '../../view_models/controllers/add_product/add_product_controller.dart';

class CustomDropDownWidget extends StatelessWidget {
  const CustomDropDownWidget({
    super.key,
    this.addProductController,
    this.adminProductsController,
  });
  final AddProductController? addProductController;
  final AdminProductsController? adminProductsController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.mediumGrey, width: 1),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: DropdownButtonHideUnderline(
        child: Obx(
          () => DropdownButton<String>(
            hint: CustomTextWidget(
              text: AppUtils.isAdminProductView
                  ? adminProductsController!.selectedCategory.value
                  : addProductController!.selectedOption.value,
              textColor: AppUtils.isAdminProductView
                  ? AppColors.black
                  : AppColors.grey,
            ),
            icon: const Icon(Icons.keyboard_arrow_down_sharp),
            isExpanded: true,
            items: AppUtils.isAdminProductView
                ? adminProductsController?.options.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: CustomTextWidget(
                        text: value,
                        textColor: AppColors.white,
                        fontWeight: FontWeight.normal,
                      ),
                    );
                  }).toList()
                : addProductController?.options.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: CustomTextWidget(
                        text: value,
                        textSize: 10,
                        textColor: AppColors.white,
                        fontWeight: FontWeight.normal,
                      ),
                    );
                  }).toList(),
            onChanged: (String? newValue) {
              if (AppUtils.isAdminProductView) {
                adminProductsController!.selectedCategory.value = newValue!;
                adminProductsController?.getCategory();
              } else {
                addProductController!.selectedOption.value = newValue!;
              }
            },
            dropdownColor: AppColors.mediumGrey,
            style: const TextStyle(
              fontSize: 15,
              color: AppColors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
