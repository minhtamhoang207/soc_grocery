import 'dart:developer';

import 'package:get/get.dart';
import 'package:soc_grocery/app/services/local_storage.dart';
import 'package:soc_grocery/data/models/request/order_request.dart';
import 'package:soc_grocery/data/models/response/cart_response.dart';
import 'package:soc_grocery/data/models/response/user_response.dart';
import 'package:soc_grocery/domain/usecases/cart/cart_usecase.dart';

class PaymentController extends GetxController {
  PaymentController(this._cartUseCases);

  final CartUseCases _cartUseCases;

  final int? total = Get.arguments['total'];
  final List<Item> listItem = Get.arguments['items'];
  Rx<List<ItemOrder>> listOrder = Rx([]);

  late final String transactionID;
  final LocalStorageService _localStorageService = Get.find();
  late final UserResponse? user;
  final status = RxStatus.empty().obs;

  @override
  void onInit() async {
    try {
      status.value = RxStatus.loading();
      transactionID = 'shopeyyy${DateTime.now().millisecondsSinceEpoch.toString()}';
      print('transaction id is: $transactionID');
      user = await _localStorageService.getUser();

      for (Item i in listItem) {
        listOrder.value.add(ItemOrder(
            product: i.product?.id ?? '',
            quantity: i.quantity ?? 0
        ));
      }

      status.value = RxStatus.success();
    } catch (e) {
      log(e.toString());
      status.value = RxStatus.error();
    }
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

  createOrder({required OrderRequest orderRequest}) {
    try {
      status.value = RxStatus.loading();
      _cartUseCases.createOrder(orderRequest: orderRequest);
      status.value = RxStatus.success();
      Get.back();
    } catch (e) {
      log(e.toString());
      status.value = RxStatus.error();
    }
  }
}
