import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:soc_grocery/data/repositories/auth_repository_impl.dart';
import 'package:soc_grocery/domain/usecases/auth/login_use_case.dart';

import '../../../data/datasources/remote/auth/auth_service.dart';
import '../../../domain/usecases/auth/login_google_usecase.dart';
import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {

    Get.put(AuthService(Get.find<Dio>()));
    Get.put(AuthRepoImpl(
        authService: Get.find<AuthService>()),
    );

    Get.put(LoginUseCase(Get.find<AuthRepoImpl>()));
    Get.put(LoginGoogleUseCase(Get.find<AuthRepoImpl>()));
    Get.put<LoginController>(LoginController(
        Get.find<LoginUseCase>(),
        Get.find<LoginGoogleUseCase>()
    ));
  }
}
