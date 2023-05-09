import 'dart:developer';

import 'package:get/get.dart';
import 'package:soc_grocery/app/services/local_storage.dart';
import 'package:soc_grocery/data/models/response/user_response.dart';

class PaymentController extends GetxController {

  final int? total = Get.arguments;
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
}
