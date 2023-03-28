import 'package:get/get.dart';
import 'package:soc_grocery/data/repositories/auth_repository_impl.dart';
import 'package:soc_grocery/domain/usecases/register_use_case.dart';

import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterUseCase(Get.find<AuthRepoImpl>()));
    Get.put<LoginController>(LoginController(Get.find<RegisterUseCase>()));
  }
}
