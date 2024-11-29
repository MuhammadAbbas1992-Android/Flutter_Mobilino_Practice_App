import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mobilino/view_models/controllers/login/login_controller.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_fonts.dart';
import '../../res/custom_widgets/custom_account_widget.dart';
import '../../res/custom_widgets/custom_text_button_widget.dart';
import '../../res/custom_widgets/custom_text_form_field_widget.dart';
import '../../res/custom_widgets/custom_text_widget.dart';
import '../../res/routs/routs_name.dart';
import '../../utils/app_utils.dart';

class AdminLoginView extends StatefulWidget {
  const AdminLoginView({super.key});

  @override
  State<AdminLoginView> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLoginView> {
  final controller = Get.put(LoginController());
  // final controllers = List.generate(2, (index) => TextEditingController());
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

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
                    text: 'Admin Log In',
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
                    customLabel: 'Username',
                    boarder: true,
                    boarderColor: AppColors.mediumGrey,
                    controller: controller.emailController.value,
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
                    controller: controller.passwordController.value,
                    validator: (value) => AppUtils.validatePassword(value),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Obx(
                    () => controller.loading.value
                        ? const CircularProgressIndicator(
                            color: AppColors.mediumGrey,
                          )
                        : CustomTextButtonWidget(
                            buttonText: 'Log In',
                            fillColor: AppColors.mediumGrey,
                            fontWeight: FontWeight.bold,
                            width: 200,
                            onTap: () => _formKey.currentState!.validate()
                                ? controller.loginUser('admin')
                                : null,
                          ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
