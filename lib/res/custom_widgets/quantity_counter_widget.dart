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
    return SizedBox(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          InkWell(
            onTap: () => productDetailCounter.decrementCounter(),
            child: Container(
                height: double.infinity,
                decoration: const BoxDecoration(
                    color: AppColors.black,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20))),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Icon(Icons.remove),
                )),
          ),
          Container(
            width: 1,
            color: AppColors.lightGrey,
          ),
          Container(
            height: double.infinity,
            color: AppColors.black,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
              child: Obx(
                () => Text(
                  productDetailCounter.counter.value.toString(),
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Container(
            width: 1,
            color: AppColors.lightGrey,
          ),
          InkWell(
            onTap: () => productDetailCounter.incrementCounter(),
            child: Container(
                height: double.infinity,
                decoration: const BoxDecoration(
                    color: AppColors.black,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Icon(Icons.add),
                )),
          ),
        ],
      ),
    );
  }
}
