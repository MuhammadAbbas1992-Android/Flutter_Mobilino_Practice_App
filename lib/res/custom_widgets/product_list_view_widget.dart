import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mobilino/res/custom_widgets/custom_cart_info_widget.dart';
import 'package:mobilino/view_models/controllers/products/admin_products_controller.dart';
import 'package:mobilino/view_models/controllers/products/user_products_controller.dart';

import '../../utils/app_utils.dart';

class ProductListViewWidget extends StatelessWidget {
  // final homeAdminController = Get.put(HomeAdminController());
  const ProductListViewWidget({
    super.key,
    this.deleteIcon,
    this.adminProductsController,
    this.userProductsController,
  });
  final String? deleteIcon;
  final AdminProductsController? adminProductsController;
  final UserProductsController? userProductsController;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            // mainAxisExtent: 300,
            childAspectRatio: 3 / 5),
        itemCount: AppUtils.isUserLogin
            ? userProductsController?.userCategoryList.length
            : adminProductsController?.adminCategoryList.length,
        itemBuilder: (context, index) {
          return CustomCartInfoWidget(
            productIndex: index,
            deleteIcon: deleteIcon,
            onTap: AppUtils.isUserLogin
                ? () => AppUtils.selectedProductDetail(index)
                : null,
            adminProductsController: adminProductsController,
            userProductsController: userProductsController,
          );
        },
      ),
    );
  }
}
