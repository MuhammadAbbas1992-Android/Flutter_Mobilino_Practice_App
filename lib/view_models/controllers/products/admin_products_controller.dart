import 'package:get/get.dart';

import '../../../constants/app_constants.dart';
import '../../../models/product_model.dart';
import '../../../res/routs/routs_name.dart';
import '../../../utils/app_utils.dart';
import '../../services/firebase/firebase_services.dart';
import '../../services/shared_prefrences/shared_preferences_services.dart';

class AdminProductsController extends GetxController {
  // Observable RxBool for loading status
  RxBool isLoading = true.obs;
  RxList<ProductModel> adminCategoryList = <ProductModel>[].obs;
  RxString selectedCategory = 'Category'.obs;
  final List<String> options =
      ['Category', 'All', 'Samsung', 'Apple', 'Realme', 'OPPO', 'Huawei'].obs;

  AdminProductsController() {
    AppUtils.isAdminProductView = true;
    loadProductsData();
  }

  void logout() {
    AppUtils.mySnackBar(title: 'Message', message: 'Yor sign out successfully');
    AppUtils.userEmailKey = '';
    AppUtils.isUserLogin = false;
    SharedPreferenceServices.clearFromSharedPref(userKey);
    Get.offNamed(RoutsName.userLoginView);
    Get.delete<AdminProductsController>();
  }

  void openAddProductView() {
    Get.toNamed(RoutsName.addProductView);
    Get.delete<AdminProductsController>();
  }

  Future<void> loadProductsData() async {
    await FirebaseServices.getProducts().then(
      (value) {
        adminCategoryList.value = <ProductModel>[];
        adminCategoryList.value = FirebaseServices.productList;
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

  void getCategory() {
    isLoading.value = !isLoading.value;
    adminCategoryList.value = <ProductModel>[];

    if (selectedCategory.value == 'Category' ||
        selectedCategory.value == 'All') {
      adminCategoryList.value = FirebaseServices.productList;
    } else {
      for (var product in FirebaseServices.productList) {
        if (product.category == selectedCategory.value) {
          adminCategoryList.add(product);
        }
      }
      if (adminCategoryList.isEmpty) {
        AppUtils.mySnackBar(
            title: 'Message',
            message: 'No ${selectedCategory.value} product available');
      }
      // AppUtils.list.addAll(adminCategoryList);
    }

    isLoading.value = !isLoading.value;
  }
}
