import 'package:get/get.dart';

import '../../../models/product_model.dart';
import '../../../utils/app_utils.dart';
import '../../services/firebase/firebase_services.dart';

class AdminProductsController extends GetxController {
  // Observable RxBool for loading status
  RxBool isLoading = true.obs;
  RxList<ProductModel> categoryList = <ProductModel>[].obs;
  RxString selectedCategory = 'Samsung'.obs;
  final List<String> options =
      ['Samsung', 'Apple', 'Realme', 'OPPO', 'Huawei'].obs;

  AdminProductsController() {
    loadProductsData();
  }

  Future<void> loadProductsData() async {
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

  deleteAdminProduct(int index) async {
    isLoading.value = !isLoading.value;
    ProductModel productModel = categoryList[index];
    String imagePath = productModel.imageUrl;

    if (await FirebaseServices.deleteImageFromStorage(imagePath)) {
      if (await FirebaseServices.deleteProduct(productModel.id)) {
        //remove product form categoryList
        categoryList.remove(productModel);
        //remove product form productList
        FirebaseServices.productList.remove(productModel);
        AppUtils.mySnackBar(
            title: 'Alert', message: 'Product deleted successfully');
        isLoading.value = !isLoading.value;
      } else {
        AppUtils.mySnackBar(
            title: 'Alert', message: 'Failed to delete product');
        isLoading.value = !isLoading.value;
      }
    } else {
      AppUtils.mySnackBar(
          title: 'Alert', message: 'Failed to delete product image');
      isLoading.value = !isLoading.value;
    }
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
