import 'package:get/get.dart';
import 'package:soc_grocery/domain/usecases/cart/cart_usecase.dart';
import 'package:soc_grocery/domain/usecases/cart/get_cart_usecase.dart';

import '../../../data/repositories/cart_repository_impl.dart';
import '../controllers/cart_controller.dart';

class CartBinding extends Bindings {
  @override
  void dependencies() {

    Get.put<GetCartUseCase>(GetCartUseCase(Get.find<CartRepositoryImpl>()));
    Get.put<CartUseCases>(CartUseCases(Get.find<CartRepositoryImpl>()));

    Get.put<CartController>(CartController(
      Get.find(),
      Get.find()
    ));
  }
}
