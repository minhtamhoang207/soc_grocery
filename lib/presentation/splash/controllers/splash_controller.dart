import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:soc_grocery/app/routes/app_pages.dart';
import 'package:soc_grocery/app/services/local_storage.dart';

class SplashController extends GetxController {

  LocalStorageService localStorageService = Get.find();

  @override
  void onInit() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    print('User granted permission: ${settings.authorizationStatus}');
    final user = await localStorageService.getUser();
    await Future.delayed(const Duration(seconds: 3));
    if(user != null ){
      Get.offAllNamed(Routes.DASHBOARD);
    } else {
      Get.offAllNamed(Routes.LOGIN);
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
