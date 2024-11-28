import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mobilino/constants/app_constants.dart';
import 'package:mobilino/res/custom_widgets/custom_text_button_widget.dart';
import 'package:mobilino/res/custom_widgets/custom_text_widget.dart';

import '../../constants/app_colors.dart';
import '../../res/custom_widgets/custom_header-widget.dart';
import '../../res/custom_widgets/custom_image_widget.dart';
import '../../res/custom_widgets/quantity_counter_widget.dart';
import '../../view_models/controllers/product_detail/product_detail_controller.dart';
import '../nav_bar/nav_bar_view.dart';

class ProductDetailView extends StatefulWidget {
  const ProductDetailView({super.key});

  @override
  State<ProductDetailView> createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {
  final productDetailController = Get.put(ProductDetailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: InkWell(
              onTap: () => productDetailController.backToUserProductView(),
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
            text: 'Mobilino',
            textSize: 16,
            icon: 'assets/icons/ic_logo.svg',
            iconHeight: 19,
            iconWidth: 14,
            iconLeftPadding: 5,
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: InkWell(
              onTap: () => productDetailController.openMenu(),
              child: SvgPicture.asset(
                'assets/icons/ic_menu.svg',
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
          child: Column(
        children: [
          const SizedBox(
            height: 10.0,
          ),
          Image.network(
            productDetailController.productModel.imageUrl,
            width: double.infinity,
            height: 380,
          ),
          const SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomTextWidget(
                  text: productDetailController.productModel.name,
                  textSize: 20.0,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.left,
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 60,
                  child: SingleChildScrollView(
                    child: CustomTextWidget(
                      text: productDetailController.productModel.description,
                      textSize: 14,
                      textAlign: TextAlign.justify,
                      lineSpacing: 1,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CustomTextWidget(
                      text: 'Quantity',
                      textSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                    QuantityCounterWidget(),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CustomTextWidget(
                      text: 'Price',
                      textSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                    CustomTextWidget(
                      text: '\$${productDetailController.productModel.price}',
                      textSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Obx(
            () => productDetailController.loading.value
                ? const CircularProgressIndicator(
                    color: AppColors.mediumGrey,
                  )
                : CustomTextButtonWidget(
                    buttonText: 'Add to Cart',
                    width: 150,
                    fillColor: AppColors.mediumGrey,
                    onTap: () => productDetailController.uploadCart(),
                  ),
          ),
        ],
      )),
    );
  }
}
