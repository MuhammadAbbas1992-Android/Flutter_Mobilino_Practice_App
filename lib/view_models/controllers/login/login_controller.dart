import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/app_constants.dart';
import '../../../res/routs/routs_name.dart';
import '../../../utils/app_utils.dart';
import '../../services/shared_prefrences/shared_preferences_services.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController(text: 'abc123@gmail.com').obs;
  final passwordController = TextEditingController(text: '123456').obs;

  RxBool loading = false.obs;
  late FirebaseAuth _auth;

  LoginController() {
    /*emailController.value.text = '';
    passwordController.value.text = '';*/
    _auth = FirebaseAuth.instance;
  }
  void gotoHomeScreen() {
    Get.offAllNamed(RoutsName.homeView);
    Get.delete<LoginController>();
  }

  void gotoAdminProductView() {
    Get.offAllNamed(RoutsName.adminProductsView);
    Get.delete<LoginController>();
  }

  void gotoSignUpView() {
    Get.toNamed(RoutsName.signUpView);
    Get.delete<LoginController>();
  }

  void gotoAdminLoginView() {
    Get.toNamed(RoutsName.adminLoginView);
    Get.delete<LoginController>();
  }

  void loginUser(String viewName) async {
    if (viewName == 'admin' &&
        emailController.value.text != 'admin123@gmail.com') {
      AppUtils.mySnackBar(title: 'Alert', message: 'Invalid admin email');
    } else if (viewName == 'user' &&
        emailController.value.text == 'admin123@gmail.com') {
      AppUtils.mySnackBar(
          title: 'Alert', message: 'This user account not exists');
    } else {
      verifyLoginCredentials();
    }
  }

  Future<void> verifyLoginCredentials() async {
    try {
      loading.value = true;
      UserCredential newUser = await _auth.signInWithEmailAndPassword(
        email: emailController.value.text,
        password: passwordController.value.text,
      );
      if (newUser.user != null) {
        AppUtils.mySnackBar(
          title: 'Response',
          message: 'Login successfully',
        );
        loading.value = false;
        toggleUserLoginStatus();
      }
    } on FirebaseAuthException catch (e) {
      String errorMessage = '';
      loading.value = false;
      // Check the error code and set specific messages
      switch (e.code) {
        case 'user-not-found':
          errorMessage = 'No user found with this email.';
          break;
        case 'wrong-password':
          errorMessage = 'Incorrect password. Please try again.';
          break;
        case 'invalid-email':
          errorMessage = 'Invalid email format.';
          break;
        case 'user-disabled':
          errorMessage = 'This user account has been disabled.';
          break;
        case 'invalid-credential':
          errorMessage = 'Email id or password not matched.';
          break;
        default:
          errorMessage = 'An unknown error occurred.';
      }

      AppUtils.mySnackBar(
        title: 'Error',
        message: errorMessage,
      );
    } catch (e) {
      // Catch any other errors that are not FirebaseAuthException
      loading.value = false;
      AppUtils.mySnackBar(
        title: 'Error',
        message: 'An error occurred: ${e.toString()}',
      );
    }
  }

  void toggleUserLoginStatus() async {
    if (emailController.value.text == 'admin123@gmail.com') {
      AppUtils.isUserLogin = false;
      await SharedPreferenceServices.saveToSharedPref(
          userKey, emailController.value.text);
      gotoAdminProductView();
    } else {
      AppUtils.isUserLogin = true;
      AppUtils.extractEmailPart(emailController.value.text);
      await SharedPreferenceServices.saveToSharedPref(
          userKey, emailController.value.text);
      gotoHomeScreen();
    }
  }
}
