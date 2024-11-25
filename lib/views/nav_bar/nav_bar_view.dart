import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mobilino/constants/app_colors.dart';
import 'package:mobilino/res/custom_widgets/custom_icon_text_widget.dart';

import '../../res/custom_widgets/custom_header-widget.dart';
import '../../res/custom_widgets/custom_text_button_widget.dart';
import '../../res/routs/routs_name.dart';
import '../../utils/app_utils.dart';

class NavBarView extends StatelessWidget {
  const NavBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mediumGrey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.mediumGrey,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: InkWell(
              onTap: () => Get.back(),
              child: SvgPicture.asset('assets/icons/ic_back.svg')),
        ),
        leadingWidth: 35,
        actions: const [
          Spacer(),
          CustomHeaderWidget(
            text: 'Mobilino',
            textColor: AppColors.white,
            icon: 'assets/icons/ic_logo.svg',
            iconColor: AppColors.white,
            iconLeftPadding: 5,
          ),
          Spacer(),
        ],
      ),
      body: SafeArea(
          child: SizedBox(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              InkWell(
                onTap: () => AppUtils.navigatePage(RoutsName.homeView),
                child: CustomIconTextWidget(
                  icon: 'assets/icons/ic_home.svg',
                  iconColor: AppColors.white,
                  iconRightPadding: 10,
                  text: 'Home',
                  textColor: AppColors.white,
                  onTap: () => Get.toNamed(RoutsName.homeView),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () => AppUtils.navigatePage(RoutsName.homeView),
                child: CustomIconTextWidget(
                  icon: 'assets/icons/ic_product.svg',
                  iconColor: AppColors.white,
                  iconRightPadding: 10,
                  text: 'Products',
                  textColor: AppColors.white,
                  onTap: () => Get.toNamed(RoutsName.userProductsView),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () => AppUtils.navigatePage(RoutsName.homeView),
                child: CustomIconTextWidget(
                  icon: 'assets/icons/ic_cart.svg',
                  iconColor: AppColors.white,
                  iconRightPadding: 10,
                  text: 'Cart',
                  textColor: AppColors.white,
                  onTap: () => Get.toNamed(RoutsName.cartView),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () => AppUtils.navigatePage(RoutsName.homeView),
                child: CustomIconTextWidget(
                  icon: 'assets/icons/ic_about_us.svg',
                  iconColor: AppColors.white,
                  iconRightPadding: 10,
                  text: 'About us',
                  textColor: AppColors.white,
                  onTap: () => Get.toNamed(RoutsName.aboutUsView),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () => AppUtils.navigatePage(RoutsName.homeView),
                child: CustomIconTextWidget(
                  icon: 'assets/icons/ic_phone.svg',
                  iconColor: AppColors.white,
                  iconRightPadding: 10,
                  text: 'Contact us',
                  textColor: AppColors.white,
                  onTap: () => Get.toNamed(RoutsName.contactUsView),
                ),
              ),
              const Spacer(),
              CustomTextButtonWidget(
                buttonText: 'Sign Out',
                textColor: AppColors.mediumGrey,
                fillColor: AppColors.white,
                fontWeight: FontWeight.bold,
                width: 200,
                onTap: () => AppUtils.logout(),
              ),
              const SizedBox(
                height: 40,
              )
            ],
          ),
        ),
      )),
    );
  }
}
