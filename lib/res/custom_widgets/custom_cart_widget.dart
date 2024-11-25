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
          border: Border.all(color: AppColors.light),
          borderRadius: BorderRadius.circular(6.0)),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0)),
              child: Image.network(
                cartModel.url,
                fit: BoxFit.fill,
              ),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CustomTextWidget(
                          text: 'Price',
                          textSize: 12.0,
                        ),
                        CustomTextWidget(
                          text: '\$${cartModel.price}',
                          textSize: 12.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CustomTextWidget(
                          text: 'Quantity',
                          textSize: 12.0,
                        ),
                        CustomTextWidget(
                          text: cartModel.quantity,
                          textSize: 12.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
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
                  'assets/icons/ic_close.svg',
                  alignment: Alignment.topRight,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
