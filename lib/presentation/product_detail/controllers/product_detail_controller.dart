import 'dart:developer';

import 'package:get/get.dart';
import 'package:soc_grocery/data/models/response/product_response.dart';

class ProductDetailController extends GetxController {
  final ProductResponse product = Get.arguments;
  final productCount = 1.obs;
  final productPrice = 0.obs;

  void increase() {
    if(productCount.value < (product.quantity ?? 0)) {
      productCount.value++;
      productPrice.value = (product.price ?? 0) * productCount.value;
    }
  }

  void decrease() {
    if (productCount.value > 1) {
      productCount.value--;
      productPrice.value = (product.price ?? 0) * productCount.value;
    }
  }

  @override
  void onInit() {
    productPrice.value = product.price ?? 0;
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
