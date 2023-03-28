import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:soc_grocery/app/services/local_storage.dart';
import 'package:soc_grocery/data/datasources/remote/auth/auth_service.dart';

import 'app/services/rest_client.dart';
import 'data/repositories/auth_repository_impl.dart';

class DependencyInjection {
  static Future<void> init() async {
    await Get.putAsync(() => LocalStorageService().init());
    Get.put(RestClient().init());

    Get.lazyPut(() => AuthService(Get.find<Dio>()));
    Get.lazyPut(() => AuthRepoImpl(authService: Get.find<AuthService>()));
    // Get.put(GoogleSignIn());
    // Get.lazyPut(() => AuthenticationRepositoryIml());
    // Get.lazyPut(() => ArticleRepositoryIml());
  }
}