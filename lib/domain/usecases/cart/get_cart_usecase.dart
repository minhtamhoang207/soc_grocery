import 'package:dio/dio.dart';
import 'package:soc_grocery/app/core/usecases/no_param_usecase.dart';
import 'package:soc_grocery/domain/repositoris/cart_repository.dart';
import '../../../app/core/exceptions/exceptions.dart';
import '../../../data/models/response/cart_response.dart';

class GetCartUseCase extends NoParamUseCase {
  final CartRepository _cartRepository;

  GetCartUseCase(this._cartRepository);

  @override
  Future<List<CartResponse>> execute() async {
    try {
      final response = await _cartRepository.getCart();

      List<CartResponse> cartList = (response.data as List)
          .map((item) => CartResponse.fromJson(item))
          .toList();

      return cartList;
    } on DioError catch (e) {
      throw createErrorEntity(e);
    } catch (e) {
      throw Exception('Unexpected Exception $e');
    }
  }
}
