import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mobilino/res/custom_widgets/custom_drop_down_widget.dart';
import 'package:mobilino/res/custom_widgets/custom_text_button_widget.dart';
import 'package:mobilino/res/custom_widgets/custom_text_form_field_widget.dart';
import 'package:mobilino/res/custom_widgets/custom_text_widget.dart';

import '../../constants/app_colors.dart';
import '../../res/custom_widgets/custom_header-widget.dart';
import '../../utils/app_utils.dart';
import '../../view_models/controllers/add_product/add_product_controller.dart';
import '../nav_bar/nav_bar_view.dart';

class AddProductView extends StatefulWidget {
  const AddProductView({super.key});

  @override
  State<AddProductView> createState() => _AddProductViewState();
}

class _AddProductViewState extends State<AddProductView> {
  final addProductController = Get.put(AddProductController());
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    addProductController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: InkWell(
              onTap: () => Get.back(),
              child: SvgPicture.asset(
                'assets/icons/ic_back.svg',
                colorFilter:
                    const ColorFilter.mode(AppColors.black, BlendMode.srcIn),
              )),
        ),
        leadingWidth: 35,
        actions: const [
          SizedBox(width: 50),
          CustomHeaderWidget(
            text: 'Mobilino',
            textSize: 16,
            icon: 'assets/icons/ic_logo.svg',
            iconHeight: 19,
            iconWidth: 14,
            iconLeftPadding: 5,
          ),
          Spacer(),
        ],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      const CustomTextWidget(
                        text: 'Add New Item',
                        textSize: 16.0,
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextFormFieldWidget(
                        customLabel: 'Product Name',
                        boarder: true,
                        boarderColor: AppColors.mediumGrey,
                        controller: addProductController.nameController.value,
                        validator: (value) =>
                            AppUtils.validateFieldData(value, 'Product Name'),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextFormFieldWidget(
                        customLabel: 'Price',
                        boarder: true,
                        boarderColor: AppColors.mediumGrey,
                        controller: addProductController.priceController.value,
                        validator: (value) =>
                            AppUtils.validateFieldData(value, 'Price'),
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomDropDownWidget(
                        addProductController: addProductController,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextFormFieldWidget(
                        customLabel: 'Description',
                        height: 120,
                        boarder: true,
                        maxLine: null,
                        expandable: true,
                        textAlignVertical: TextAlignVertical.top,
                        boarderColor: AppColors.mediumGrey,
                        controller:
                            addProductController.descriptionController.value,
                        validator: (value) =>
                            AppUtils.validateFieldData(value, 'Description'),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Obx(
                        () => Container(
                          height: 143,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColors.mediumGrey, width: 1),
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          child: addProductController.imageUrl.isEmpty &&
                                  addProductController.imagePath.isEmpty
                              ? Center(
                                  child: CustomTextWidget(
                                    text: '+ Add Image',
                                    textAlign: TextAlign.center,
                                    fontWeight: FontWeight.bold,
                                    onTap: () =>
                                        addProductController.getImage(),
                                  ),
                                )
                              : addProductController.imagePath.isNotEmpty
                                  ? InkWell(
                                      onTap: () =>
                                          addProductController.getImage(),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(6),
                                        child: Image.file(
                                          File(addProductController
                                              .imagePath.value),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    )
                                  : InkWell(
                                      onTap: () =>
                                          addProductController.getImage(),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(6),
                                        child: Image.network(
                                          addProductController.imageUrl.value,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Obx(
                        () => addProductController.loading.value
                            ? const CircularProgressIndicator(
                                color: AppColors.mediumGrey,
                              )
                            : CustomTextButtonWidget(
                                buttonText: 'ADD',
                                fillColor: AppColors.mediumGrey,
                                fontWeight: FontWeight.bold,
                                width: 150,
                                onTap: () => _formKey.currentState!.validate()
                                    ? addProductController.addProduct()
                                    : null,
                              ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
