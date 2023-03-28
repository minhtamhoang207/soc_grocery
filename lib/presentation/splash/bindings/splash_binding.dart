import 'package:get/get.dart';
import 'package:soc_grocery/app/services/connectivity.dart';

import '../controllers/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SplashController>(SplashController());
    Get.put(ConnectivityService());
  }
}
