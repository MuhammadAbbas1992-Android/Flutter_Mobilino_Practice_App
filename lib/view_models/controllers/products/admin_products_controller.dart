import 'package:get/get.dart';

import '../../../models/product_model.dart';
import '../../../res/routs/routs_name.dart';
import '../../../utils/app_utils.dart';
import '../../services/firebase/firebase_services.dart';

class AdminProductsController extends GetxController {
  // Observable RxBool for loading status
  RxBool isLoading = true.obs;
  RxList<ProductModel> adminCategoryList = <ProductModel>[].obs;
  RxString selectedCategory = 'Category'.obs;
  final List<String> options =
      ['Category', 'All', 'Samsung', 'Apple', 'Realme', 'OPPO', 'Huawei'].obs;

  AdminProductsController() {
    AppUtils.isAddProductView = false;
    loadProductsData();
  }

  openAddProductView() {
    Get.toNamed(RoutsName.addProductView);
    Get.delete<AdminProductsController>();
  }

  Future<void> loadProductsData() async {
    await FirebaseServices.getProducts().then(
      (value) {
        AppUtils.list = <ProductModel>[];
        adminCategoryList.value = <ProductModel>[];
        adminCategoryList.value = FirebaseServices.productList;
        AppUtils.list.addAll(adminCategoryList);
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

  void deleteAdminProduct(int index) async {
    isLoading.value = !isLoading.value;
    ProductModel productModel = adminCategoryList[index];
    String imagePath = productModel.imageUrl;

    if (await FirebaseServices.deleteProduct(productModel.id)) {
      //remove product form categoryList
      adminCategoryList.remove(productModel);
      //remove product form productList
      FirebaseServices.productList.remove(productModel);
      AppUtils.mySnackBar(
          title: 'Alert', message: 'Product deleted successfully');
      isLoading.value = !isLoading.value;
    } else {
      AppUtils.mySnackBar(title: 'Alert', message: 'Failed to delete product');
      isLoading.value = !isLoading.value;
    }
    /*if (await FirebaseServices.deleteImageFromStorage(imagePath)) {

    } else {
      AppUtils.mySnackBar(
          title: 'Alert', message: 'Failed to delete product image');
      isLoading.value = !isLoading.value;
    }*/
  }

  void getCategory(String category) {
    isLoading.value = !isLoading.value;

    AppUtils.list = <ProductModel>[];
    adminCategoryList.value = <ProductModel>[];

    for (var product in FirebaseServices.productList) {
      if (product.category == category) {
        adminCategoryList.add(product);
        AppUtils.list.addAll(adminCategoryList);
      }
    }
    isLoading.value = !isLoading.value;
  }
}
