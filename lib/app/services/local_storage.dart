import 'dart:convert';

import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:soc_grocery/data/models/response/user_response.dart';

enum _Key {
  user,
  bearToken,
  cartID
}

class LocalStorageService extends GetxService {
  SharedPreferences? _sharedPreferences;

  Future<LocalStorageService> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }

  Future<void> saveToken({required String token}) async {
    await _sharedPreferences?.setString(_Key.bearToken.name, token);
  }

  Future<String?> getToken() async {
    String? jsonString = _sharedPreferences?.getString(_Key.user.name);
    if (jsonString != null) {
      return UserResponse.fromJson(jsonDecode(jsonString)).accessToken;
    } else {
      return null;
    }
  }

  Future<void> saveCartID({required String cartID}) async {
    await _sharedPreferences?.setString(_Key.cartID.name, cartID);
  }

  Future<String?> getCartID() async {
    String? jsonString = _sharedPreferences?.getString(_Key.cartID.name);
    return jsonString;
  }

  Future<void> saveUser({required UserResponse userResponse}) async {
    final jsonString = json.encode(userResponse);
    await _sharedPreferences?.setString(_Key.user.name, jsonString);
  }

  Future<UserResponse?> getUser() async {
    String? jsonString = _sharedPreferences?.getString(_Key.user.name);
    if (jsonString != null) {
      return UserResponse.fromJson(jsonDecode(jsonString));
    } else {
      return null;
    }
  }

  clearAll() async {
    await _sharedPreferences?.clear();
  }
}