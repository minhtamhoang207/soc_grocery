import 'package:get/get.dart';
import 'package:soc_grocery/data/repositories/cart_repository_impl.dart';
import 'package:soc_grocery/domain/usecases/cart/cart_usecase.dart';
import '../controllers/product_detail_controller.dart';

class ProductDetailBinding extends Bindings {
  @override
  void dependencies() {
    // Get.put(CartRepositoryImpl(cartService: Get.find()));
    Get.put<CartUseCases>(CartUseCases(Get.find<CartRepositoryImpl>()));
    Get.put<ProductDetailController>(ProductDetailController(Get.find()));
  }
}
