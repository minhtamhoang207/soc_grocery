import 'package:get/get.dart';
import 'package:soc_grocery/data/repositories/product_repository_impl.dart';
import 'package:soc_grocery/domain/usecases/cart/cart_usecase.dart';
import 'package:soc_grocery/domain/usecases/cart/get_cart_usecase.dart';
import 'package:soc_grocery/domain/usecases/category/get_category_use_case.dart';
import 'package:soc_grocery/domain/usecases/product/get_product_usecase.dart';
import 'package:soc_grocery/presentation/explore/controllers/explore_controller.dart';
import '../../../data/repositories/cart_repository_impl.dart';
import '../../../data/repositories/category_repository_impl.dart';
import '../../cart/controllers/cart_controller.dart';
import '../../shop/controllers/shop_controller.dart';
import '../controllers/dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(
      () => DashboardController(),
    );

    Get.lazyPut<GetProductUseCase>(()
      => GetProductUseCase(Get.find<ProductRepositoryImpl>()));

    Get.lazyPut<CartUseCases>(() =>
        CartUseCases(Get.find<CartRepositoryImpl>()));

    Get.lazyPut<ShopController>(()
      => ShopController(Get.find(), Get.find()));

    Get.lazyPut<GetCategoryUseCase>(()
      => GetCategoryUseCase(Get.find<CategoryRepositoryImpl>()));

    Get.lazyPut<ExploreController>(()
      => ExploreController(Get.find()));
  }
}
