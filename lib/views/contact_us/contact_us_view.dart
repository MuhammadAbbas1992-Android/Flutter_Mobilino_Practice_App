import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mobilino/res/custom_widgets/custom_icon_text_widget.dart';
import 'package:mobilino/res/custom_widgets/custom_text_widget.dart';

import '../../constants/app_colors.dart';
import '../../res/custom_widgets/custom_header-widget.dart';
import '../nav_bar/nav_bar_view.dart';

class ContactUsView extends StatefulWidget {
  const ContactUsView({super.key});

  @override
  State<ContactUsView> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 30),
          child: InkWell(
              onTap: () {},
              child: SvgPicture.asset(
                'assets/icons/ic_back.svg',
                colorFilter:
                    const ColorFilter.mode(AppColors.black, BlendMode.srcIn),
              )),
        ),
        leadingWidth: 43,
        actions: [
          const SizedBox(width: 50),
          const Spacer(),
          const CustomHeaderWidget(
            text: 'Mobilino',
            textSize: 16,
            icon: 'assets/icons/ic_logo.svg',
            iconHeight: 19,
            iconWidth: 14,
            iconLeftPadding: 5,
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 30),
            child: InkWell(
              onTap: () => Get.to(() => NavBarView()),
              child: SvgPicture.asset(
                'assets/icons/ic_menu.svg',
              ),
            ),
          )
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomTextWidget(
              text: 'Contact us',
              textSize: 20,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextWidget(
              text: 'Jumana Yassin Aladani',
              textSize: 15,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(
              height: 20,
            ),
            CustomIconTextWidget(
              text: 'Jumana@gmail.com',
              textColor: AppColors.black,
              icon: 'assets/icons/ic_mail.svg',
              iconColor: AppColors.mediumGrey,
              iconRightPadding: 10,
            ),
            SizedBox(
              height: 10,
            ),
            CustomIconTextWidget(
              text: 'Jumana Yassin Aladani',
              textColor: AppColors.black,
              icon: 'assets/icons/ic_facebook.svg',
              iconColor: AppColors.mediumGrey,
              iconRightPadding: 12,
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextWidget(
              text: 'Fatima Hamad Almuhamidh',
              textSize: 15,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(
              height: 20,
            ),
            CustomIconTextWidget(
              text: 'Fatima@gmail.com',
              textColor: AppColors.black,
              icon: 'assets/icons/ic_mail.svg',
              iconColor: AppColors.mediumGrey,
              iconRightPadding: 10,
            ),
            SizedBox(
              height: 10,
            ),
            CustomIconTextWidget(
              text: 'Fatima Hamad Almuhamidh',
              textColor: AppColors.black,
              icon: 'assets/icons/ic_facebook.svg',
              iconColor: AppColors.mediumGrey,
              iconRightPadding: 12,
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextWidget(
              text: 'Yasmin Lafi Alotaibi',
              textSize: 15,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(
              height: 20,
            ),
            CustomIconTextWidget(
              text: 'Yasmin@gmail.com',
              textColor: AppColors.black,
              icon: 'assets/icons/ic_mail.svg',
              iconColor: AppColors.mediumGrey,
              iconRightPadding: 10,
            ),
            SizedBox(
              height: 10,
            ),
            CustomIconTextWidget(
              text: 'Yasmin Lafi Alotaibi ',
              textColor: AppColors.black,
              icon: 'assets/icons/ic_facebook.svg',
              iconColor: AppColors.mediumGrey,
              iconRightPadding: 12,
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextWidget(
              text: 'Shahad Zaben Alotaibi',
              textSize: 15,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(
              height: 20,
            ),
            CustomIconTextWidget(
              text: 'Shahad@gmail.com',
              textColor: AppColors.black,
              icon: 'assets/icons/ic_mail.svg',
              iconColor: AppColors.mediumGrey,
              iconRightPadding: 10,
            ),
            SizedBox(
              height: 10,
            ),
            CustomIconTextWidget(
              text: 'Shahad Zaben Alotaibi',
              textColor: AppColors.black,
              icon: 'assets/icons/ic_facebook.svg',
              iconColor: AppColors.mediumGrey,
              iconRightPadding: 12,
            ),
          ],
        ),
      ),
    );
  }
}
