import 'dart:async';
import 'dart:developer';
import 'dart:math' as math;
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:soc_grocery/app/core/exceptions/exceptions.dart';
import 'package:soc_grocery/data/models/request/login_google_request.dart';
import 'package:soc_grocery/data/models/request/login_request.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:soc_grocery/data/models/response/user_response.dart';
import 'package:soc_grocery/domain/usecases/auth/login_use_case.dart';

import '../../../app/services/local_storage.dart';
import '../../../domain/usecases/auth/login_google_usecase.dart';
import '../../../domain/usecases/cart/get_cart_usecase.dart';

class LoginController extends GetxController
    with GetSingleTickerProviderStateMixin {

  LoginController(
      this._loginUseCase, 
      this._loginGoogleUseCase,
      this._getCartUseCase);

  final LoginUseCase _loginUseCase;
  final LoginGoogleUseCase _loginGoogleUseCase;
  final GetCartUseCase _getCartUseCase;


  final Rx<RxStatus> status = RxStatus.empty().obs;
  final showPassword = false.obs;
  final LocalStorageService localStorageService = Get.find();
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  void onInit() async {
    super.onInit();
  }

  Future<void> login() async {
    try {
      status.value = RxStatus.loading();
      final UserResponse response = await _loginUseCase.execute(
          LoginRequest(username: username.text, password: password.text));
      await localStorageService.saveUser(userResponse: response);
      final cart = await _getCartUseCase.execute();
      if(cart.isNotEmpty) {
        await localStorageService.saveCartID(cartID: cart.first.id ?? '');
      }
      final fcmToken = await FirebaseMessaging.instance.getToken();
      log('FCM token is: $fcmToken');
      status.value = RxStatus.success();
    } on ErrorEntity catch (e) {
      log(e.message);
      status.value = RxStatus.error(e.message);
    } on Exception catch (e) {
      log(e.toString());
      status.value = RxStatus.error('Đã xảy ra lỗi');
    }
  }

  Future<void> loginWithGoogle() async {
    final FirebaseAuth auth = FirebaseAuth.instance;

    final GoogleSignInAccount? googleSignInAccount =
        await GoogleSignIn().signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthenticationGoogle =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthenticationGoogle.accessToken,
        idToken: googleSignInAuthenticationGoogle.idToken,
      );

      try {
        status.value = RxStatus.loading();
        final UserCredential userCredential =
            await auth.signInWithCredential(credential);
        String? idToken = await userCredential.user?.getIdToken();
        log(idToken!);
        await _loginGoogleUseCase.execute(LoginGoogleRequest(
          idToken: googleSignInAccount.serverAuthCode
        ));
        status.value = RxStatus.success();
      } catch (e) {
        log(e.toString());
        status.value = RxStatus.error('Đã xảy ra lỗi');
      }
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
