import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

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
    await FirebaseServices.getCarts().then(
      (value) {
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

  Future<void> clearCartList() async {
    if (FirebaseServices.cartList.isEmpty && grandTotalPayment.value == 0.0) {
      AppUtils.mySnackBar(title: 'Alert', message: 'Your cart is empty');
    } else {
      if (await FirebaseServices.deleteAllCart()) {
        AppUtils.mySnackBar(
            title: 'Success', message: 'Order made successfully');
        // Get.offNamed(RoutsName.productsView);
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
}
