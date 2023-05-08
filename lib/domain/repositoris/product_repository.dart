import 'package:soc_grocery/data/models/response/base_response.dart';

abstract class ProductRepository {
  Future<BaseResponse> getListProductByCategory({required String category});
  Future<BaseResponse> getListProduct();
}
