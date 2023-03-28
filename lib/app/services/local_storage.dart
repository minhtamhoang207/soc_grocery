import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum _Key {
  user,
  bearToken,
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
    return _sharedPreferences?.getString(_Key.bearToken.name);
  }

  clearAll() async {
    await _sharedPreferences?.clear();
  }
}