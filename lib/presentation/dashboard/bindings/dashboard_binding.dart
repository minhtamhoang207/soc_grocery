import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:soc_grocery/data/repositories/product_repository_impl.dart';
import 'package:soc_grocery/domain/repositoris/category_repository.dart';
import 'package:soc_grocery/domain/usecases/category/get_category_use_case.dart';
import 'package:soc_grocery/domain/usecases/product/get_product_usecase.dart';
import 'package:soc_grocery/presentation/explore/controllers/explore_controller.dart';
import '../../../data/datasources/remote/category/category_service.dart';
import '../../../data/repositories/category_repository_impl.dart';
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

    Get.lazyPut<ShopController>(()
      => ShopController(Get.find()));

    Get.lazyPut<GetCategoryUseCase>(()
      => GetCategoryUseCase(Get.find<CategoryRepositoryImpl>()));

    Get.lazyPut<ExploreController>(()
      => ExploreController(Get.find()));

  }
}
