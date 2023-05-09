import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:soc_grocery/app/services/local_storage.dart';
import 'package:soc_grocery/data/models/request/create_cart_request.dart';
import 'package:soc_grocery/data/models/request/login_request.dart';
import 'package:soc_grocery/data/models/request/register_request.dart';
import 'package:soc_grocery/domain/usecases/auth/login_use_case.dart';
import 'package:soc_grocery/domain/usecases/auth/register_use_case.dart';
import 'package:soc_grocery/domain/usecases/cart/create_cart_usecase.dart';

import '../../../app/core/exceptions/exceptions.dart';
import '../../../data/models/response/user_response.dart';

class SignUpController extends GetxController {
  SignUpController(
      this._registerUseCase,
      this._createCartUseCase,
      this._loginUseCase
  );

  final RegisterUseCase _registerUseCase;
  final CreateCartUseCase _createCartUseCase;
  final LoginUseCase _loginUseCase;


  LocalStorageService localStorageService = Get.find();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController email = TextEditingController();
  final LocalStorageService _localStorageService = Get.find();

  final Rx<RxStatus> signUpStatus = RxStatus.empty().obs;
  final showPassword = false.obs;
  final showConfirmPassword = false.obs;

  Future<void> signUp() async {
    try {
      if(password.text == confirmPassword.text) {
        signUpStatus.value = RxStatus.loading();
        await _registerUseCase.execute(
            RegisterRequest(
                username: username.text,
                password: password.text,
                email: email.text
            )
        );
        final UserResponse userLogin = await _loginUseCase.execute(
          LoginRequest(
            username: username.text,
            password: password.text,
          )
        );
        await localStorageService.saveUser(userResponse: userLogin);
        final createCartData = await _createCartUseCase.execute(CreateCartRequest(
          status: 'ACTIVE'
        ));
        await _localStorageService.saveCartID(cartID: createCartData.data['_id']).then((value) async {
          final String? cartID = await _localStorageService.getCartID();
          print('..........................');
          print(createCartData.data['_id']);
          print('..........................');
          print(cartID);
          print('..........................');
        });
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
