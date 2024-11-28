import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../models/product_model.dart';
import '../../../res/routs/routs_name.dart';
import '../../../utils/app_utils.dart';
import '../../services/firebase/firebase_services.dart';
import '../login/login_controller.dart';

class UserProductsController extends GetxController {
  // Observable RxBool for loading status
  RxBool isLoading = true.obs;

  RxList<ProductModel> userCategoryList = <ProductModel>[].obs;
  RxString selectedCategory = 'Samsung'.obs;
  final List<String> categories =
      ['Samsung', 'Apple', 'Realme', 'OPPO', 'Huawei'].obs;

  UserProductsController() {
    loadProducts();
  }

  void loadProducts() async {
    AppUtils.productIndex = -1;
    await FirebaseServices.getProducts().then(
      (value) {
        // AppUtils.list = <ProductModel>[];
        userCategoryList.value = FirebaseServices.productList;
        // AppUtils.list.addAll(userCategoryList);
        isLoading.value = !isLoading.value;
      },
    ).onError(
      (error, stackTrace) {
        AppUtils.mySnackBar(
            title: 'Error', message: 'Failed to load products data');
        isLoading.value = !isLoading.value;
      },
    );
  }

  void getCategory(String category) {
    isLoading.value = !isLoading.value;

    // AppUtils.list = <ProductModel>[];
    userCategoryList.value = <ProductModel>[];

    for (var product in FirebaseServices.productList) {
      if (product.category == category) {
        userCategoryList.add(product);
        // AppUtils.list.addAll(userCategoryList);
      }
    }
    isLoading.value = !isLoading.value;
  }

  selectProductDetail(index) {
    AppUtils.productIndex = index;
    Get.toNamed(RoutsName.productsDetailView);
    // Dispose the controller after navigating
    Get.delete<LoginController>();
  }
}
