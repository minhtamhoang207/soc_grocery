import 'package:soc_grocery/data/models/response/base_response.dart';

abstract class ProductRepository {
  Future<BaseResponse> getListProduct();
}
