import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mobilino/res/custom_widgets/custom_text_widget.dart';
import 'package:mobilino/view_models/controllers/products/user_products_controller.dart';

import '../../constants/app_colors.dart';
import '../../res/custom_widgets/custom_header-widget.dart';
import '../../res/custom_widgets/product_list_view_widget.dart';
import '../nav_bar/nav_bar_view.dart';

class UserProductsView extends StatefulWidget {
  const UserProductsView({super.key});

  @override
  State<UserProductsView> createState() => _UserProductsState();
}

class _UserProductsState extends State<UserProductsView> {
  final userProductsController = Get.put(UserProductsController());

  @override
  void dispose() {
    // TODO: implement dispose
    userProductsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: InkWell(
              onTap: () {},
              child: SvgPicture.asset(
                'assets/icons/ic_back.svg',
                colorFilter:
                    const ColorFilter.mode(AppColors.black, BlendMode.srcIn),
              )),
        ),
        leadingWidth: 35,
        actions: [
          const SizedBox(width: 50),
          const Spacer(),
          const CustomHeaderWidget(
            text: 'Products',
            textSize: 18,
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: InkWell(
              onTap: () => Get.to(() => NavBarView()),
              child: SvgPicture.asset(
                'assets/icons/ic_menu.svg',
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: userProductsController.categories.map((category) {
                  return Obx(() {
                    bool isSelected =
                        userProductsController.selectedCategory.value ==
                            category;
                    return GestureDetector(
                      onTap: () => userProductsController
                          .selectedCategory.value = category,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            category,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              /*fontWeight: isSelected
                                  ? FontWeight.bold
                                  : FontWeight.normal,*/
                            ),
                          ),
                          if (isSelected)
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              height: 2,
                              width: category.length *
                                  10.0, // Adjust underline width
                              color: Colors.black,
                            ),
                        ],
                      ),
                    );
                  });
                }).toList(),
              ),
            ),
            const SizedBox(height: 10),
            Obx(
              () {
                if (userProductsController.isLoading.value) {
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
                } else if (userProductsController.userCategoryList.isEmpty) {
                  return const Expanded(
                      child: Center(child: Text('No product available')));
                } else {
                  return Expanded(
                      child: ProductListViewWidget(
                    deleteIcon: 'assets/icons/ic_delete.svg',
                    userProductsController: userProductsController,
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
