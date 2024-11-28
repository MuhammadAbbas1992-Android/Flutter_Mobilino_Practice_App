import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mobilino/constants/app_colors.dart';
import 'package:mobilino/res/custom_widgets/custom_text_widget.dart';
import 'package:mobilino/res/routs/routs_name.dart';
import 'package:mobilino/utils/app_utils.dart';

import '../../res/custom_widgets/custom_drop_down_widget.dart';
import '../../res/custom_widgets/custom_header-widget.dart';
import '../../res/custom_widgets/product_list_view_widget.dart';
import '../../view_models/controllers/products/admin_products_controller.dart';
import '../nav_bar/nav_bar_view.dart';

class AdminProductsView extends StatefulWidget {
  const AdminProductsView({super.key});

  @override
  State<AdminProductsView> createState() => _AdminProductsViewState();
}

class _AdminProductsViewState extends State<AdminProductsView> {
  final adminProductsController = Get.put(AdminProductsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 30),
          child: InkWell(
              onTap: () => AppUtils.logout(),
              child: SvgPicture.asset(
                'assets/icons/ic_sign_out.svg',
                colorFilter:
                    const ColorFilter.mode(AppColors.black, BlendMode.srcIn),
              )),
        ),
        leadingWidth: 43,
        actions: [
          const SizedBox(width: 50),
          const CustomHeaderWidget(
            text: 'Mobilino',
            textSize: 16,
            icon: 'assets/icons/ic_logo.svg',
            iconHeight: 19,
            iconWidth: 14,
            iconLeftPadding: 5,
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 30),
            child: InkWell(
              onTap: () => adminProductsController.openAddProductView(),
              child: SvgPicture.asset(
                'assets/icons/ic_more.svg',
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const CustomTextWidget(
                  text: 'Products',
                  textSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                const Spacer(),
                SizedBox(
                  width: 130,
                  child: CustomDropDownWidget(
                    adminProductsController: adminProductsController,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Obx(
              () {
                if (adminProductsController.isLoading.value) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 200.0, bottom: 200.0),
                      child: SizedBox(
                          width: 100,
                          height: 100,
                          child: CircularProgressIndicator(
                            color: Colors.blueAccent,
                          )),
                    ),
                  );
                } else if (adminProductsController.adminCategoryList.isEmpty) {
                  return const Expanded(
                      child: Center(child: Text('No product available')));
                } else {
                  return Expanded(
                      child: ProductListViewWidget(
                    deleteIcon: 'assets/icons/ic_delete.svg',
                    adminProductsController: adminProductsController,
                  ));
                }
              },
            ),

            // const Expanded(child: ProductListViewWidget()),
          ],
        ),
      )),
    );
  }
}
