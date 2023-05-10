import 'package:get/get.dart';

import '../../../data/repositories/cart_repository_impl.dart';
import '../../../domain/usecases/cart/cart_usecase.dart';
import '../controllers/payment_controller.dart';

class PaymentBinding extends Bindings {
  @override
  void dependencies() {

    Get.put<CartUseCases>(CartUseCases(Get.find<CartRepositoryImpl>()));

    Get.lazyPut<PaymentController>(
      () => PaymentController(Get.find()),
    );
  }
}
