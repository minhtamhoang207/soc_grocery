import 'package:dio/dio.dart';
import 'package:soc_grocery/app/core/usecases/no_param_usecase.dart';
import 'package:soc_grocery/data/models/response/category_response.dart';
import 'package:soc_grocery/domain/repositoris/product_repository.dart';

import '../../../app/core/exceptions/exceptions.dart';
import '../../../data/models/response/product_response.dart';

class GetProductUseCase extends NoParamUseCase<List<ProductResponse>> {
  final ProductRepository _productRepository;

  GetProductUseCase(this._productRepository);

  @override
  Future<List<ProductResponse>> execute() async {
    try {
      final response = await _productRepository.getListProduct();
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
