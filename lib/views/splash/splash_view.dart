import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobilino/constants/app_colors.dart';
import 'package:mobilino/constants/app_constants.dart';
import 'package:mobilino/res/custom_widgets/custom_text_widget.dart';
import '../../constants/app_fonts.dart';
import '../../view_models/controllers/splash/splash_controller.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  SplashServices splashServices = SplashServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashServices.goToNextScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomTextWidget(
                text: 'Mobilino',
                fontFamily: AppFonts.dhyanaBold,
                textColor: AppColors.darkGrey,
                textSize: 42,
              ),
              const SizedBox(
                width: 5,
              ),
              SvgPicture.asset(
                'assets/icons/ic_logo.svg',
                colorFilter:
                    const ColorFilter.mode(AppColors.darkGrey, BlendMode.srcIn),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: CustomTextWidget(
              text: text1,
              textSize: 16,
              textColor: AppColors.mediumGrey,
              textAlign: TextAlign.center,
            ),
          ),
          // Image.asset('assets/icons/home.jpg'),
        ],
      )),
    );
  }
}
