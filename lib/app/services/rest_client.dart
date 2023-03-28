import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:soc_grocery/app/config/app_constants.dart';
import 'package:soc_grocery/app/services/local_storage.dart';

class RestClient extends GetxService {

  Dio init() {
    final dio = Dio()
      ..options = BaseOptions(baseUrl: kBaseURl);
    dio.interceptors.addAll([
      AppInterceptors(),
      PrettyDioLogger(
          requestHeader: false,
          responseHeader: false,
          requestBody: true,
          responseBody: true,
          error: true,
          compact: true,
          maxWidth: 90
      )
    ]);
    return dio;
  }
}

class AppInterceptors implements Interceptor {
  @override
  void onRequest(RequestOptions options,
      RequestInterceptorHandler handler) async {
    LocalStorageService prefs = Get.find<LocalStorageService>();
    final token = await prefs.getToken();
    options.headers.putIfAbsent('Authorization', () => 'Bearer $token');
    return handler.next(options);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    handler.next(err);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }
}