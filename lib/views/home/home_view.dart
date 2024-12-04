import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mobilino/res/custom_widgets/custom_text_widget.dart';
import 'package:mobilino/view_models/controllers/home/home_controller.dart';
import 'package:mobilino/views/nav_bar/nav_bar_view.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_constants.dart';
import '../../res/common_widgets/video_play_widget.dart';
import '../../res/custom_widgets/custom_header-widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late var homeController = Get.put(HomeController());

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      homeController = Get.put(HomeController());
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.white,
          leading: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: InkWell(
                onTap: () => homeController.gotoBack(),
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
                onTap: () => homeController.openMenu(),
                child: SvgPicture.asset(
                  'assets/icons/ic_menu.svg',
                ),
              ),
            )
          ],
        ),
        body: const SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 20.0,
                ),
                VideoPlayWidget(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
                  child: Column(
                    children: [
                      CustomTextWidget(
                        text: 'About Mobilino',
                        textSize: 15,
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomTextWidget(
                        text: homeText1,
                        textSize: 12,
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomTextWidget(
                        text: 'Our Services',
                        textSize: 15,
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomTextWidget(
                        text: homeText2,
                        textSize: 12,
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomTextWidget(
                        text: homeText3,
                        textSize: 12,
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
