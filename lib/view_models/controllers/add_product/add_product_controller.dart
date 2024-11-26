import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../models/product_model.dart';
import '../../../res/routs/routs_name.dart';
import '../../../utils/app_utils.dart';
import '../../services/firebase/firebase_services.dart';

class AddProductController extends GetxController {
  final nameController = TextEditingController().obs;
  final priceController = TextEditingController().obs;
  final descriptionController = TextEditingController().obs;

  RxString imageUrl = ''.obs;
  RxString imagePath = ''.obs;
  RxBool loading = false.obs;
  RxString selectedOption = 'Category'.obs;
  final List<String> options =
      ['Category', 'Samsung', 'Apple', 'Realme', 'OPPO', 'Huawei'].obs;

  AddProductController() {
    AppUtils.isAddProductList = true;
  }

  Future getImage() async {
    AppUtils.mySnackBar(title: 'Alert', message: 'Welcome to Add New Device');
    final ImagePicker picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);
    // final image = await picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      //Get String of Image File from Gallery or Camera
      imagePath.value = image.path.toString();
      //Get File from Gallery or Camera
      // imagePath = File(image.path);
    }
    AppUtils.mySnackBar(title: "Image Path", message: imagePath.value);
  }

  Future<void> addProduct() async {
    if (selectedOption.value == 'Category') {
      AppUtils.mySnackBar(
          title: 'Alert', message: 'Please select an option from dropdown');
      return;
    } else if (imagePath.value.isEmpty && imageUrl.value.isEmpty) {
      AppUtils.mySnackBar(
          title: 'Alert', message: 'Please add image of product');
      return;
    } else {
      uploadImage();
    }
  }

  Future<void> uploadImage() async {
    //Each time it will work as u choose a new image from gallery
    loading.value = true;

    if (imagePath.value.isNotEmpty) {
      imageUrl.value =
          await FirebaseServices.uploadImageToStorage(imagePath.value);

      if (imageUrl.value.isNotEmpty) {
        uploadProduct();
      } else {
        loading.value = false;
        AppUtils.mySnackBar(
            title: 'Error', message: 'Failed to upload product image');
      }
    } else {
      uploadProduct();
    }
  }

  Future<void> uploadProduct() async {
    if (AppUtils.productIndex >= 0) {
      //Update existing product
      ProductModel productModel = AppUtils.list[AppUtils.productIndex];
      productModel.imageUrl = imageUrl.value;
      productModel.category = selectedOption.value;
      productModel.name = nameController.value.text;
      productModel.price = priceController.value.text;
      productModel.description = descriptionController.value.text;

      if (await FirebaseServices.updateProduct(productModel)) {
        AppUtils.mySnackBar(
            title: 'Success', message: 'Product details updated successfully');
        clearData();
        loading.value = false;
        Get.toNamed(RoutsName.adminProductsView);
      } else {
        loading.value = false;
        AppUtils.mySnackBar(
            title: 'Error', message: 'Product details failed to updated');
      }
    } else {
      //Add new product
      loading.value = false;
      ProductModel productModel = ProductModel(
          imageUrl: imageUrl.value,
          id: '',
          category: selectedOption.value,
          name: nameController.value.text,
          price: priceController.value.text,
          description: descriptionController.value.text);

      if (await FirebaseServices.addProduct(productModel)) {
        loading.value = false;
        AppUtils.mySnackBar(
            title: 'Success', message: 'Product details added successfully');
        clearData();
        Get.toNamed(RoutsName.adminProductsView);
      } else {
        loading.value = false;
        AppUtils.mySnackBar(
            title: 'Error', message: 'Product details failed to add');
      }
    }
  }

  void clearData() {
    AppUtils.productIndex = -1;
    AppUtils.isAddProductList = false;
    imagePath.value = '';
    imageUrl.value = '';
    selectedOption.value = 'Category';
    nameController.value.text = '';
    priceController.value.text = '';
    descriptionController.value.text = '';
  }
}
