import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:mobilino/constants/app_colors.dart';
import 'package:mobilino/models/cart_model.dart';
import 'package:mobilino/res/custom_widgets/custom_text_widget.dart';

import '../../../res/routs/routs_name.dart';
import '../../../utils/app_utils.dart';
import '../../services/firebase/firebase_services.dart';

class CartController extends GetxController {
  RxBool isCartLoading = true.obs;
  RxDouble grandTotalPayment = 0.0.obs;

  CartController() {
    loadCarts();
  }

  Future<void> loadCarts() async {
    print('before ABC Called LoadCarts() ${FirebaseServices.cartList.length}');
    await FirebaseServices.getCarts().then(
      (value) {
        print(
            'after ABC Called LoadCarts() ${FirebaseServices.cartList.length}');
        sumGrandTotalPayment();
      },
    );
  }

  Future<void> removeCart(String cartIndex) async {
    isCartLoading.value = !isCartLoading.value;
    if (await FirebaseServices.deleteCart(cartIndex)) {
      AppUtils.mySnackBar(
          title: 'Success', message: 'Cart deleted successfully');
      loadCarts();
    } else {
      isCartLoading.value = !isCartLoading.value;
      AppUtils.mySnackBar(title: 'Error', message: 'Cart failed to delete');
    }
  }

  Future<void> makeCartOrder(context) async {
    if (FirebaseServices.cartList.isEmpty && grandTotalPayment.value == 0.0) {
      AppUtils.mySnackBar(title: 'Alert', message: 'Your cart is empty');
    } else {
      isCartLoading.value = !isCartLoading.value;
      if (await FirebaseServices.deleteAllCart()) {
        showCustomDialog(context);
        /*AppUtils.mySnackBar(
            title: 'Success', message: 'Order made successfully');*/
      } else {
        isCartLoading.value = !isCartLoading.value;
        AppUtils.mySnackBar(title: 'Error', message: 'Failed to make order');
      }
    }
  }

  void sumGrandTotalPayment() {
    grandTotalPayment.value = 0.0;
    for (var cart in FirebaseServices.cartList) {
      double amount = double.parse(cart.price) * int.parse(cart.quantity);
      grandTotalPayment.value = grandTotalPayment.value + amount;
    }
    isCartLoading.value = !isCartLoading.value;
  }

  void showCustomDialog(context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          child: Stack(
            children: [
              Container(
                width: 280,
                height: 150,
                color: AppColors.mediumGrey,
                child: const Padding(
                  padding: EdgeInsets.all(25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CustomTextWidget(
                        text: 'Thank you',
                        textSize: 20,
                        textColor: AppColors.white,
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10),
                      CustomTextWidget(
                        text: 'For your choosing us for',
                        textSize: 16,
                        textColor: AppColors.white,
                        textAlign: TextAlign.center,
                      ),
                      CustomTextWidget(
                        text: 'your precious time',
                        textSize: 16,
                        textColor: AppColors.white,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                right: 0,
                top: 0,
                child: IconButton(
                  icon: const Icon(
                    Icons.close,
                    color: AppColors.white,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                    isCartLoading.value = !isCartLoading.value;
                    Get.toNamed(RoutsName.userProductsView);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
