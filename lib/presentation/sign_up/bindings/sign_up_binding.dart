import 'package:get/get.dart';
import 'package:soc_grocery/data/repositories/cart_repository_impl.dart';
import 'package:soc_grocery/domain/usecases/auth/register_use_case.dart';
import 'package:soc_grocery/domain/usecases/cart/create_cart_usecase.dart';

import '../../../data/repositories/auth_repository_impl.dart';
import '../controllers/sign_up_controller.dart';

class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(RegisterUseCase(Get.find<AuthRepoImpl>()));

    Get.put(CreateCartUseCase(Get.find<CartRepositoryImpl>()));

    Get.lazyPut<SignUpController>(
      () => SignUpController(
          Get.find<RegisterUseCase>(),
          Get.find<CreateCartUseCase>()
      ),
    );
  }
}
