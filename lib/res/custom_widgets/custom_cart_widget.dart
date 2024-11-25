import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobilino/res/custom_widgets/custom_text_widget.dart';

import '../../constants/app_colors.dart';
import '../../models/cart_model.dart';
import '../../view_models/controllers/cart/cart_view_controller.dart';
import '../../view_models/services/firebase/firebase_services.dart';

class CustomCartWidget extends StatelessWidget {
  const CustomCartWidget({
    super.key,
    required this.cartIndex,
    this.controller,
  });

  final int cartIndex;
  final CartController? controller;

  @override
  Widget build(BuildContext context) {
    // CartModel? cartModel = controller!.cartList?[cartIndex];
    CartModel? cartModel = FirebaseServices.cartList[cartIndex];
    return Container(
      margin: const EdgeInsets.only(top: 10),
      height: 140.0,
      decoration: BoxDecoration(
          color: AppColors.black, borderRadius: BorderRadius.circular(20.0)),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            Container(
              height: 100,
              width: 110,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0)),
            ),
            Expanded(
              flex: 8,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 5, 5, 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CustomTextWidget(
                      text: cartModel.name,
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextWidget(
                      text: 'SAR ${cartModel.price}',
                      textSize: 12.0,
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextWidget(
                      text: 'Qty: ${cartModel.quantity}',
                      textSize: 12.0,
                      fontWeight: FontWeight.bold,
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () => controller?.removeCart(
                cartModel.id,
              ),
              child: SizedBox(
                height: double.infinity,
                child: SvgPicture.asset(
                  'assets/icons/ic_delete.svg',
                  alignment: const Alignment(0, .9),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
