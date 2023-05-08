import 'dart:developer';

import 'package:get/get.dart';
import 'package:soc_grocery/domain/usecases/cart/get_cart_usecase.dart';

import '../../../data/models/response/cart_response.dart';

class CartController extends GetxController {
  CartController(this._getCartUseCase);

  final GetCartUseCase _getCartUseCase;
  Rx<List<CartResponse>> cart = Rx([]);
  final status = RxStatus.empty().obs;

  @override
  void onInit() {
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

  Future<void> getCart() async {
    try {
      status.value = RxStatus.loading();
      cart.value = await _getCartUseCase.execute();
      status.value = RxStatus.success();
    } catch (e) {
      log(e.toString());
      status.value = RxStatus.error('Đã xảy ra lỗi');
    }
  }
}
