import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../constants/app_colors.dart';
import '../../view_models/controllers/product_detail/product_detail_controller.dart';

class QuantityCounterWidget extends StatelessWidget {
  QuantityCounterWidget({
    super.key,
  });
  final productDetailCounter = Get.put(ProductDetailController());
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 120,
      decoration: BoxDecoration(
          color: AppColors.lightOrange,
          border: Border.all(width: 1, color: AppColors.light),
          borderRadius: BorderRadius.circular(50)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: () => productDetailCounter.decrementCounter(),
            child: const Icon(Icons.remove),
          ),
          Container(
            height: double.infinity,
            width: 40,
            decoration: const BoxDecoration(
                color: AppColors.white,
                border: Border.symmetric(
                    vertical: BorderSide(
                  width: 1,
                  color: AppColors.light,
                ))),
            child: Obx(
              () => Center(
                child: Text(
                  productDetailCounter.counter.value.toString(),
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () => productDetailCounter.incrementCounter(),
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
