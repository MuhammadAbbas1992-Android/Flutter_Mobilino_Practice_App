import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/app_utils.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController(text: 'abc123@gmail.com').obs;
  final passwordController = TextEditingController(text: '123456').obs;

  bool showSpinner = false;
  late FirebaseAuth _auth;

  LoginController() {
    // print('yes called LoginController Constructor');
    _auth = FirebaseAuth.instance;
  }

  RxBool loading = false.obs;

  void validateEmail() {}

  void loginUser() async {
    try {
      UserCredential newUser = await _auth.signInWithEmailAndPassword(
        email: emailController.value.text,
        password: passwordController.value.text,
      );
      if (newUser.user != null) {
        AppUtils.mySnackBar(
          title: 'Response',
          message: 'Login successfully',
        );
        AppUtils.toggleUserLoginStatus(emailController.value.text);
      }
    } on FirebaseAuthException catch (e) {
      String errorMessage = '';

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
      AppUtils.mySnackBar(
        title: 'Error',
        message: 'An error occurred: ${e.toString()}',
      );
    }
  }
}
