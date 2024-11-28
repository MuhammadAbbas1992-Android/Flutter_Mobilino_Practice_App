import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mobilino/res/custom_widgets/custom_text_button_widget.dart';
import 'package:mobilino/res/custom_widgets/custom_text_widget.dart';
import 'package:mobilino/res/custom_widgets/custom_total_row_widget.dart';

import '../../constants/app_colors.dart';
import '../../res/custom_widgets/cart_list_view_widget.dart';
import '../../res/custom_widgets/custom_header-widget.dart';
import '../../view_models/controllers/cart/cart_view_controller.dart';
import '../../view_models/services/firebase/firebase_services.dart';
import '../nav_bar/nav_bar_view.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: InkWell(
              onTap: () => cartController.backToHomeView(),
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
              onTap: () => cartController.openMenu(),
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
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 15.0, right: 15.0, bottom: 10),
              child: SizedBox(
                width: double.infinity,
                child: CustomTextWidget(
                  text: 'Cart',
                  textSize: 20.0,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            Obx(
              () {
                if (cartController.isCartLoading.value) {
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
                } else if (FirebaseServices.cartList.isEmpty) {
                  return const SizedBox(
                      height: 480, child: Center(child: Text('No cart added')));
                } else {
                  return Expanded(
                      child: CartListViewWidget(
                    controller: cartController,
                  ));
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: CustomTotalRowWidget(
                controller: cartController,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            CustomTextButtonWidget(
              buttonText: 'Order',
              fillColor: AppColors.mediumGrey,
              width: 150,
              onTap: () => cartController.makeCartOrder(context),
            )
          ],
        ),
      )),
    );
  }
}
