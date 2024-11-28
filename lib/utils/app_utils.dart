import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../constants/app_constants.dart';
import '../models/product_model.dart';
import '../res/routs/routs_name.dart';
import '../view_models/services/shared_prefrences/shared_preferences_services.dart';

class AppUtils {
  static String userEmailKey = '';
  static bool isUserLogin = false;
  static bool isAddProductView = false;
  static String productId = '';
  // static List<ProductModel> list = <ProductModel>[];

  static extractEmailPart(String email) {
    // Split the email using '@' as the delimiter
    userEmailKey = email.split('@')[0];
  }

  static toggleUserLoginStatus(String user) async {
    if (user == 'admin123@gmail.com') {
      isUserLogin = false;
      await SharedPreferenceServices.saveToSharedPref(userKey, user);
      Get.offNamed(RoutsName.adminProductsView);
    } else {
      isUserLogin = true;
      AppUtils.extractEmailPart(user);
      await SharedPreferenceServices.saveToSharedPref(userKey, user);
      Get.offNamed(RoutsName.homeView);
    }
  }

  static String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'Please enter email';
    } else {
      email = email!.trim();
      final emailRegex = RegExp(
        r"^[a-zA-Z0-9.!#$%&\'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z]{2,})+$",
      );

      return emailRegex.hasMatch(email) ? null : "Please enter a valid email";
    }
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }
    if (value.length < 6) {
      return 'Requires at least 6 characters';
    }
    return null;
  }

  static String? validateConfirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return 'Confirm password is required';
    }
    if (value != password) {
      return 'Passwords do not match';
    }
    return null;
  }

  static String? validateFieldData(String? value, String field) {
    if (value == null || value.isEmpty) {
      return 'Please enter $field';
    }
    return null;
  }

  static String? validateDropDownItem(String value, String choice) {
    if (value == choice) {
      return 'Please select an item from dropdown ';
    }
    return null;
  }

  static void mySnackBar({required String title, required String message}) {
    Get.snackbar(title, message);
  }

  static void navigatePage(String pageName) {
    Get.back();
    Get.offNamed(pageName);
  }

  static void logout() {
    mySnackBar(title: 'Message', message: 'Yor sign out successfully');
    userEmailKey = '';
    isUserLogin = false;
    SharedPreferenceServices.clearFromSharedPref(userKey);
    Get.toNamed(RoutsName.userLoginView);
  }
}
