import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../models/cart_model.dart';
import '../../../models/product_model.dart';
import '../../../res/routs/routs_name.dart';
import '../../../utils/app_utils.dart';
import '../../services/firebase/firebase_services.dart';

class ProductDetailController extends GetxController {
  RxInt counter = 0.obs;
  late ProductModel productModel;

  ProductDetailController() {
    productModel = AppUtils.list[AppUtils.productIndex];
  }

  void incrementCounter() {
    ++counter.value;
    print('ABC Counter ${counter.value}');
  }

  void decrementCounter() {
    if (counter.value > 0) {
      --counter.value;
    }
    print('ABC Counter ${counter.value}');
  }

  Future<void> uploadCart() async {
    if (counter.value > 0) {
      CartModel cartModel = CartModel(
          id: '',
          url: productModel.imageUrl,
          name: productModel.name,
          price: productModel.price,
          quantity: counter.value.toString());

      if (await FirebaseServices.addCart(cartModel)) {
        print('ABC 11');
        AppUtils.mySnackBar(
            title: 'Success', message: 'Cart added successfully');
        counter.value = 0;
        // Get.offNamed(RoutsName.productsView);
        // Get.offNamed(RoutsName.productsView);
      } else {
        print('ABC 12');
        AppUtils.mySnackBar(title: 'Error', message: 'Failed to add cart');
      }
    } else {
      AppUtils.mySnackBar(
          title: 'Alert', message: 'Quantity must be at least 1');
    }
  }
}
