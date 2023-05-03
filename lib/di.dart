import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:soc_grocery/app/services/local_storage.dart';
import 'package:soc_grocery/data/datasources/remote/auth/auth_service.dart';
import 'package:soc_grocery/data/datasources/remote/category/category_service.dart';
import 'package:soc_grocery/data/datasources/remote/product/product_service.dart';
import 'package:soc_grocery/data/repositories/category_repository_impl.dart';
import 'package:soc_grocery/data/repositories/product_repository_impl.dart';

import 'app/services/rest_client.dart';

class DependencyInjection {
  static Future<void> init() async {
    await Get.putAsync(() => LocalStorageService().init());
    Get.put(RestClient().init());

    Get.put(CategoryService(Get.find<Dio>()), permanent: true);
    Get.put(CategoryRepositoryImpl(
        categoryService: Get.find<CategoryService>()),
        permanent: true
    );

    Get.put(ProductService(Get.find<Dio>()), permanent: true);
    Get.put(ProductRepositoryImpl(
        productService: Get.find<ProductService>()),
        permanent: true
    );

    // Get.put(GoogleSignIn());
    // Get.lazyPut(() => AuthenticationRepositoryIml());
    // Get.lazyPut(() => ArticleRepositoryIml());
  }
}
