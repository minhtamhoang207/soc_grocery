import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:soc_grocery/app/config/app_constants.dart';
import 'package:soc_grocery/data/models/response/base_response.dart';

part 'category_service.g.dart';

@RestApi(baseUrl: kBaseURl)
abstract class CategoryService {
  factory CategoryService(Dio dio, {String baseUrl}) = _CategoryService;

  @GET('/categories')
  Future<BaseResponse> getListCategory();
}
