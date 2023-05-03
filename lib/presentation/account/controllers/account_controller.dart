import 'package:get/get.dart';
import 'package:soc_grocery/app/services/local_storage.dart';
import 'package:soc_grocery/data/models/response/user_response.dart';

class AccountController extends GetxController {

  LocalStorageService localStorageService = Get.find();
  Rx<UserResponse?> user = Rx(const UserResponse());

  @override
  void onInit() async {
    user.value = await localStorageService.getUser();
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
