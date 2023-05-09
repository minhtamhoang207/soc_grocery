import 'dart:developer';

import 'package:get/get.dart';
import 'package:soc_grocery/data/models/request/add_item_request.dart';
import 'package:soc_grocery/data/models/response/product_response.dart';
import 'package:soc_grocery/domain/usecases/cart/cart_usecase.dart';

class ProductDetailController extends GetxController {
  ProductDetailController(this._cartUseCases);

  final CartUseCases _cartUseCases;

  final ProductResponse product = Get.arguments;
  final productCount = 1.obs;
  final productPrice = 0.obs;
  final status = RxStatus.empty().obs;

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

  Future<void> addToCart() async {
    try {
      status.value = RxStatus.loading();
      await _cartUseCases.addItem(
          productID: product.id ?? '',
          addItemRequest: AddItemRequest(
              productID: product.id ?? '',
              quantity: productCount.value
          )
      );
      status.value = RxStatus.success();
    } catch (e) {
      log(e.toString());
      status.value = RxStatus.error('Đã xảy ra lỗi');
    }
  }

  void increase() {
    if (productCount.value < (product.quantity ?? 0)) {
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
}
