import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../constants/app_constants.dart';
import '../../../res/routs/routs_name.dart';
import '../../../utils/app_utils.dart';
import '../shared_prefrences/shared_preferences_services.dart';

class NavBarService {
  void gotoBack() {
    Get.back();
  }

  void navigatePage(String pageName) {
    if (RoutsName.homeView == pageName) {
      Get.offAllNamed(pageName);
    } else {
      Get.offNamed(pageName);
    }
  }

  void logout() {
    AppUtils.mySnackBar(title: 'Message', message: 'Yor sign out successfully');
    AppUtils.userEmailKey = '';
    AppUtils.isUserLogin = false;
    SharedPreferenceServices.clearFromSharedPref(userKey);
    Get.offAllNamed(RoutsName.userLoginView);
  }
}
