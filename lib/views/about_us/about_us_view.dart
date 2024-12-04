import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mobilino/constants/app_constants.dart';

import '../../constants/app_colors.dart';
import '../../res/custom_widgets/custom_header-widget.dart';
import '../../res/custom_widgets/custom_text_widget.dart';
import '../nav_bar/nav_bar_view.dart';

class AboutUsView extends StatefulWidget {
  const AboutUsView({super.key});

  @override
  State<AboutUsView> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUsView> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          leading: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: InkWell(
                onTap: () {},
                child: SvgPicture.asset(
                  'assets/icons/ic_back.svg',
                  colorFilter:
                      const ColorFilter.mode(AppColors.black, BlendMode.srcIn),
                )),
          ),
          leadingWidth: 35,
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
              padding: const EdgeInsets.only(right: 20),
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
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomTextWidget(
                  text: 'About us',
                  textSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextWidget(
                      text: 'Jumana Yassin Aladani',
                      textSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    CustomTextWidget(
                      text: 'Information Technology',
                      textSize: 14,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextWidget(
                  text: text1,
                  textSize: 13,
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextWidget(
                      text: 'Fatima Hamad Almuhamidh',
                      textSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    CustomTextWidget(
                      text: 'Information Technology',
                      textSize: 14,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextWidget(
                  text: text2,
                  textSize: 13,
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextWidget(
                      text: 'Yasmin Lafi Alotaibi',
                      textSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    CustomTextWidget(
                      text: 'Information Technology',
                      textSize: 14,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextWidget(
                  text: text3,
                  textSize: 13,
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextWidget(
                      text: 'Shahad Zaben Alotaibi',
                      textSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    CustomTextWidget(
                      text: 'Information Technology',
                      textSize: 14,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextWidget(
                  text: text4,
                  textSize: 13,
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
