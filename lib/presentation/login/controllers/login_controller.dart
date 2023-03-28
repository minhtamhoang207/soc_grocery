import 'dart:developer';

import 'package:bot_toast/bot_toast.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:soc_grocery/app/core/exceptions/exceptions.dart';
import 'package:soc_grocery/domain/usecases/register_use_case.dart';

class LoginController extends GetxController {

  final RegisterUseCase _registerUseCase;

  LoginController(this._registerUseCase);

  @override
  void onInit() async {
    register();
    super.onInit();
  }

  Future<void> register() async {
    try {
      await _registerUseCase.execute();
    } on ErrorEntity catch (e){
      log(e.message);
      BotToast.showText(text: e.message);
    } on Exception catch (e) {
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
