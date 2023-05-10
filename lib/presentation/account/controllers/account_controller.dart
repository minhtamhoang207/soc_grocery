import 'dart:developer';

import 'package:get/get.dart';
import 'package:soc_grocery/app/services/local_storage.dart';
import 'package:soc_grocery/data/models/response/user_response.dart';
import 'package:soc_grocery/domain/usecases/cart/cart_usecase.dart';

import '../../../data/models/response/payment_history.dart';

class AccountController extends GetxController {
  AccountController(this._cartUseCases);

  final CartUseCases _cartUseCases;

  LocalStorageService localStorageService = Get.find();
  Rx<UserResponse?> user = Rx(const UserResponse());
  Rx<List<PaymentHistory>> history = Rx([]);

  @override
  void onInit() async {
    user.value = await localStorageService.getUser();
    getPaymentHistory();
    super.onInit();
  }

  getPaymentHistory() async {
    try {
      history.value = await _cartUseCases.getOrder();
    } catch (e) {
      log(e.toString());
    }
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
