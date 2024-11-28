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

  void openMenu() {
    Get.toNamed(RoutsName.navBarView);
    Get.delete<UserProductsController>();
  }

  void backToHomeView() {
    Get.toNamed(RoutsName.homeView);
    Get.delete<UserProductsController>();
  }

  void loadProducts() async {
    AppUtils.productId = '';
    await FirebaseServices.getProducts().then(
      (value) {
        // AppUtils.list = <ProductModel>[];
        // userCategoryList.value = FirebaseServices.productList;
        // AppUtils.list.addAll(userCategoryList);
        extractCategoryList();
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
    selectedCategory.value = category;
    isLoading.value = !isLoading.value;
    extractCategoryList();
    isLoading.value = !isLoading.value;
  }

  void selectProductDetail(String id) {
    AppUtils.productId = id;
    Get.toNamed(RoutsName.productsDetailView);
    Get.delete<LoginController>();
  }

  void extractCategoryList() {
    userCategoryList.value = <ProductModel>[];
    for (var product in FirebaseServices.productList) {
      if (product.category == selectedCategory.value) {
        userCategoryList.add(product);
      }
    }
    if (userCategoryList.isEmpty) {
      AppUtils.mySnackBar(
          title: 'Message',
          message: 'No ${selectedCategory.value} product available');
    }
  }
}
