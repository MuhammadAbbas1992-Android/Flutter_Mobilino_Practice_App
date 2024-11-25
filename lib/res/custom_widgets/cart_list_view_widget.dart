import 'package:flutter/cupertino.dart';
import 'package:mobilino/res/custom_widgets/custom_cart_widget.dart';

import '../../view_models/controllers/cart/cart_view_controller.dart';
import '../../view_models/services/firebase/firebase_services.dart';

class CartListViewWidget extends StatelessWidget {
  const CartListViewWidget({
    super.key,
    required this.controller,
  });
  final CartController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 480,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        child: ListView.builder(
          // mainAxisExtent: 210,
          itemCount: FirebaseServices.cartList.length,
          itemBuilder: (context, index) {
            return CustomCartWidget(
              cartIndex: index,
              controller: controller,
            );
          },
        ),
      ),
    );
  }
}
