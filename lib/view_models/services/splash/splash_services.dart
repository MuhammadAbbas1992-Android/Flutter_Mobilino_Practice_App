import 'dart:async';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../constants/app_constants.dart';
import '../../../res/routs/routs_name.dart';
import '../../../utils/app_utils.dart';
import '../../services/shared_prefrences/shared_preferences_services.dart';

class SplashServices {
  Future<void> goToNextScreen() async {
    String? userName =
        await SharedPreferenceServices.getFromSharedPref(userKey);
    Timer(
      userName != null
          ? const Duration(milliseconds: 500)
          : const Duration(seconds: 3),
      () async {
        if (userName != null) {
          if (userName == 'admin123@gmail.com') {
            Get.offNamed(RoutsName.adminProductsView);
          } else {
            AppUtils.extractEmailPart(userName);
            AppUtils.isUserLogin = true;
            Get.offNamed(RoutsName.homeView);
          }
        } else {
          Get.offNamed(RoutsName.userLoginView);
        }
      },
    );
  }
}
