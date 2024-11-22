import 'dart:async';

import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:mobilino/res/routs/routs_name.dart';

class SplashServices {
  Future<void> goToNextScreen() async {
    /*Timer(
      const Duration(seconds: 3),
      () async {
        String? userName =
            await SharedPreferenceServices.getFromSharedPref(userKey);
        if (userName != null) {
          if (userName == 'admin@gmail.com') {
            Get.offNamed(RoutsName.homeAdminView);
          } else {
            AppUtils.extractEmailPart(userName);
            AppUtils.isUserLogin = true;
            Get.offNamed(RoutsName.homeView);
          }
        } else {
          Get.offNamed(RoutsName.loginView);
        }
      },
    );*/
    Timer(const Duration(seconds: 3), () async {
      Get.offNamed(RoutsName.userLoginView);
    });
  }
}
