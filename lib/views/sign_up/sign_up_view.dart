import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mobilino/view_models/controllers/sing_up/sign_up_controller.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_fonts.dart';
import '../../res/custom_widgets/custom_account_widget.dart';
import '../../res/custom_widgets/custom_text_button_widget.dart';
import '../../res/custom_widgets/custom_text_form_field_widget.dart';
import '../../res/custom_widgets/custom_text_widget.dart';
import '../../res/routs/routs_name.dart';
import '../../utils/app_utils.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpState();
}

class _SignUpState extends State<SignUpView> {
  final signUpController = Get.put(SignUpController());
  // final controllers = List.generate(2, (index) => TextEditingController());
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
                    text: 'Sign up',
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
                    boarderColor: AppColors.mediumGrey,
                    controller: signUpController.emailController.value,
                    validator: (value) => AppUtils.validateEmail(value),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  CustomTextFormFieldWidget(
                    height: 43,
                    customLabel: 'Password',
                    obscure: true,
                    boarder: true,
                    boarderColor: AppColors.mediumGrey,
                    controller: signUpController.passwordController.value,
                    validator: (value) => AppUtils.validatePassword(value),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  CustomTextFormFieldWidget(
                    height: 43,
                    customLabel: 'Confirm Password',
                    obscure: true,
                    boarder: true,
                    boarderColor: AppColors.mediumGrey,
                    controller:
                        signUpController.confirmPasswordController.value,
                    validator: (value) => AppUtils.validateConfirmPassword(
                        value, signUpController.passwordController.value.text),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Obx(
                    () => signUpController.loading.value
                        ? const CircularProgressIndicator(
                            color: AppColors.mediumGrey,
                          )
                        : CustomTextButtonWidget(
                            buttonText: 'Sign up',
                            fillColor: AppColors.mediumGrey,
                            fontWeight: FontWeight.bold,
                            width: 200,
                            onTap: () => _formKey.currentState!.validate()
                                ? signUpController.signUpUser()
                                : null,
                          ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomAccountWidget(
                    textHint: 'Already have an account?',
                    textHintColor: AppColors.grey,
                    textHintSize: 10,
                    textLink: 'Log In',
                    textLinkColor: AppColors.black,
                    textLinkSize: 10,
                    onTap: () => signUpController.gotoLoginView(),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
