import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:soc_grocery/app/config/app_constants.dart';
import 'package:soc_grocery/data/models/response/base_response.dart';

part 'product_service.g.dart';

@RestApi(baseUrl: kBaseURl)
abstract class ProductService {
  factory ProductService(Dio dio, {String baseUrl}) = _ProductService;

  @GET('/products')
  Future<BaseResponse> getListProduct();
}
