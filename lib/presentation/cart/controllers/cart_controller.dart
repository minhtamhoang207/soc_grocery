import 'dart:developer';

import 'package:get/get.dart';
import 'package:soc_grocery/data/models/request/quantity_request.dart';
import 'package:soc_grocery/domain/usecases/cart/cart_usecase.dart';
import 'package:soc_grocery/domain/usecases/cart/get_cart_usecase.dart';

import '../../../app/core/exceptions/exceptions.dart';
import '../../../data/models/response/cart_response.dart';

class CartController extends GetxController {
  CartController(this._getCartUseCase, this._cartUseCases);

  final GetCartUseCase _getCartUseCase;
  final CartUseCases _cartUseCases;

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

  Future<void> updateItem({
    required String productID,
    required int quantity
  }) async {
    try {
      status.value = RxStatus.loading();
      await _cartUseCases.updateItem(
          cartID: 'cartID',
          productID: productID,
          quantityRequest: QuantityRequest(
            quantity: quantity
          )
      );
      await getCart();
      status.value = RxStatus.success();
    } on ErrorEntity catch (e) {
      log(e.message);
      status.value = RxStatus.error(e.message);
    } on Exception catch (e) {
      log(e.toString());
      status.value = RxStatus.error('Đã xảy ra lỗi');
    }
  }

  Future<void> deleteItem({
    required String productID
  }) async {
    try {
      status.value = RxStatus.loading();
      await _cartUseCases.deleteItem(
          cartID: 'cartID',
          productID: productID
      );
      await getCart();
      status.value = RxStatus.success();
    } on ErrorEntity catch (e) {
      log(e.message);
      status.value = RxStatus.error(e.message);
    } on Exception catch (e) {
      log(e.toString());
      status.value = RxStatus.error('Đã xảy ra lỗi');
    }
  }
}
