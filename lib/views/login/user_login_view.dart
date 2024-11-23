import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mobilino/res/custom_widgets/custom_account_widget.dart';
import 'package:mobilino/res/custom_widgets/custom_text_button_widget.dart';
import 'package:mobilino/res/custom_widgets/custom_text_form_field_widget.dart';
import 'package:mobilino/utils/app_utils.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_fonts.dart';
import '../../res/custom_widgets/custom_text_widget.dart';
import '../../res/routs/routs_name.dart';

class UserLoginView extends StatefulWidget {
  const UserLoginView({super.key});

  @override
  State<UserLoginView> createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLoginView> {
  // final loginController = Get.put(LoginController());
  final controllers = List.generate(2, (index) => TextEditingController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CustomTextWidget(
                        text: 'Mobilino',
                        fontFamily: AppFonts.dhyanaBold,
                        textColor: AppColors.darkGrey,
                        textSize: 34,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      SvgPicture.asset(
                        'assets/icons/ic_logo.svg',
                        colorFilter: const ColorFilter.mode(
                            AppColors.darkGrey, BlendMode.srcIn),
                        height: 39,
                        width: 32,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  const CustomTextWidget(
                    text: 'Log In',
                    textColor: AppColors.darkGrey,
                    textSize: 22,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  CustomTextFormFieldWidget(
                    height: 43,
                    customLabel: 'Email',
                    boarder: true,
                    boarderColor: AppColors.lightGrey,
                    controller: controllers[0],
                    validator: (value) => AppUtils.validateEmail(value),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  CustomTextFormFieldWidget(
                    height: 43,
                    customLabel: 'Password',
                    boarder: true,
                    boarderColor: AppColors.lightGrey,
                    controller: controllers[1],
                    validator: (value) => AppUtils.validatePassword(value),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  CustomTextButtonWidget(
                    buttonText: 'Log In',
                    fillColor: AppColors.lightGrey,
                    fontWeight: FontWeight.bold,
                    width: 200,
                    onTap: () => _formKey.currentState!.validate()
                        ? Get.offAndToNamed(RoutsName.homeView)
                        : null,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomAccountWidget(
                    textHint: 'Do not have any account?',
                    textHintColor: AppColors.grey,
                    textHintSize: 10,
                    textLink: 'Sign up',
                    textLinkColor: AppColors.black,
                    textLinkSize: 10,
                    onTap: () {},
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const CustomTextButtonWidget(
                    buttonText: 'Log In As Admin',
                    fillColor: AppColors.lightGrey,
                    fontWeight: FontWeight.bold,
                    width: 200,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
