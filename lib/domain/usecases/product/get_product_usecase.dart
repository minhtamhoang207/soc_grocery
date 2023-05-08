import 'package:dio/dio.dart';
import 'package:soc_grocery/app/core/usecases/param_use_case.dart';
import 'package:soc_grocery/data/models/response/base_response.dart';
import 'package:soc_grocery/domain/repositoris/product_repository.dart';

import '../../../app/core/exceptions/exceptions.dart';
import '../../../data/models/response/product_response.dart';

class GetProductUseCase extends ParamUseCase<List<ProductResponse>, String?> {
  final ProductRepository _productRepository;

  GetProductUseCase(this._productRepository);

  @override
  Future<List<ProductResponse>> execute(String? params) async {
    try {
      final BaseResponse response;
      if(params == null || params.isEmpty) {
        response = await _productRepository.getListProduct();
      } else {
        response = await _productRepository.getListProductByCategory(category: params);
      }
      List<ProductResponse> productList = (response.data as List)
          .map((item) => ProductResponse.fromJson(item))
          .toList();
      return productList;
    } on DioError catch (e) {
      throw createErrorEntity(e);
    } catch (e) {
      throw Exception('Unexpected Exception $e');
    }
  }
}
