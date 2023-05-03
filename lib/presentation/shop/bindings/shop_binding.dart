import 'package:get/get.dart';

import '../controllers/shop_controller.dart';

class ShopBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ShopController(Get.find()));
  }
}
