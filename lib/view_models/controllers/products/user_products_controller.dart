import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../models/product_model.dart';
import '../../../utils/app_utils.dart';
import '../../services/firebase/firebase_services.dart';

class UserProductsController extends GetxController {
  // Observable RxBool for loading status
  RxBool isLoading = true.obs;

  RxList<ProductModel> categoryList = <ProductModel>[].obs;
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
        AppUtils.list = <ProductModel>[];
        categoryList.value = FirebaseServices.productList;
        AppUtils.list.addAll(categoryList);

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

    AppUtils.list = <ProductModel>[];
    categoryList.value = <ProductModel>[];

    for (var product in FirebaseServices.productList) {
      if (product.category == category) {
        categoryList.add(product);
        AppUtils.list.addAll(categoryList);
      }
    }
    isLoading.value = !isLoading.value;
  }
}
