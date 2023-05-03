import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:soc_grocery/app/services/local_storage.dart';
import 'package:soc_grocery/data/models/request/register_request.dart';
import 'package:soc_grocery/domain/usecases/auth/register_use_case.dart';

import '../../../app/core/exceptions/exceptions.dart';
import '../../../data/models/response/user_response.dart';

class SignUpController extends GetxController {
  final RegisterUseCase _registerUseCase;

  SignUpController(this._registerUseCase);

  LocalStorageService localStorageService = Get.find();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController email = TextEditingController();

  final Rx<RxStatus> signUpStatus = RxStatus.empty().obs;
  final showPassword = false.obs;
  final showConfirmPassword = false.obs;

  Future<void> signUp() async {
    try {
      if(password.text == confirmPassword.text) {
        signUpStatus.value = RxStatus.loading();
        final UserResponse response = await _registerUseCase.execute(
            RegisterRequest(
                username: username.text,
                password: password.text,
                email: email.text
            ));
        // await localStorageService.saveUser(userResponse: response);
        signUpStatus.value = RxStatus.success();
      } else {
        signUpStatus.value = RxStatus.error('Vui lòng kiểm tra lại mật khẩu');
      }
    } on ErrorEntity catch (e) {
      log(e.message);
      signUpStatus.value = RxStatus.error(e.message);
    } on Exception catch (e) {
      log(e.toString());
      signUpStatus.value = RxStatus.error('Đã xảy ra lỗi');
    }
  }

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
}
