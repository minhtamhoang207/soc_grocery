import 'package:soc_grocery/data/datasources/remote/product/product_service.dart';
import 'package:soc_grocery/data/models/response/base_response.dart';

import '../../domain/repositoris/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {

  ProductRepositoryImpl({required this.productService});

  ProductService productService;

  @override
  Future<BaseResponse> getListProduct() async {
    final response = await productService.getListProduct();

    if (response.data != null) {
      return response;
    } else {
      throw Exception();
    }
  }
}