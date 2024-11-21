import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobilino/constants/app_constants.dart';
import 'package:mobilino/res/custom_widgets/custom_text_widget.dart';

import '../../constants/app_fonts.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                size: 42,
              ),
              SvgPicture.asset(
                'assets/icons/ic_logo.svg',
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: CustomTextWidget(
              text: text1,
              size: 16,
              textAlign: TextAlign.center,
            ),
          ),
          // Image.asset('assets/icons/home.jpg'),
        ],
      )),
    );
  }
}
