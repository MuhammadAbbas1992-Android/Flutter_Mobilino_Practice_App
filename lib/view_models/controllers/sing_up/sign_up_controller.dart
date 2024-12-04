import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../res/routs/routs_name.dart';
import '../../../utils/app_utils.dart';

class SignUpController extends GetxController {
  final emailController = TextEditingController(text: 'admin123@gmail.com').obs;
  final passwordController = TextEditingController(text: '123456').obs;
  final confirmPasswordController = TextEditingController(text: '123456').obs;

  RxBool loading = false.obs;
  late FirebaseAuth _auth;

  SignUpController() {
    emailController.value.text = '';
    passwordController.value.text = '';
    confirmPasswordController.value.text = '';
    _auth = FirebaseAuth.instance;
  }

  void gotoLoginView() {
    // Get.offNamed(RoutsName.userLoginView);
    Get.back();
    Get.delete<SignUpController>();
  }

  void gotoHomeView() {
    Get.offAllNamed(RoutsName.homeView);
    Get.delete<SignUpController>();
  }

  void signUpUser() async {
    try {
      loading.value = true;
      UserCredential newUser = await _auth.createUserWithEmailAndPassword(
          email: emailController.value.text,
          password: passwordController.value.text);
      if (newUser != null) {
        AppUtils.mySnackBar(
            title: 'Response', message: 'New user created successfully');
        loading.value = false;
        AppUtils.extractEmailPart(emailController.value.text);
        gotoHomeView();
      } else {
        loading.value = false;
        AppUtils.mySnackBar(
            title: 'Response', message: 'Error occurred for creating new user');
      }
    } on FirebaseAuthException catch (e) {
      String errorMessage = '';
      loading.value = false;

      // Check the error code and set specific messages
      switch (e.code) {
        case 'email-already-in-use':
          errorMessage = 'This email is already in use by another account.';
          break;
        case 'invalid-email':
          errorMessage = 'The email address is not valid.';
          break;
        case 'operation-not-allowed':
          errorMessage =
              'Email/password accounts are not enabled. Enable them in the Firebase Console.';
          break;
        case 'weak-password':
          errorMessage = 'The password is too weak.';
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
}
