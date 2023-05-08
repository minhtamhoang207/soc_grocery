import 'package:dio/dio.dart';
import 'package:soc_grocery/app/core/usecases/param_use_case.dart';
import 'package:soc_grocery/data/models/request/create_cart_request.dart';
import 'package:soc_grocery/domain/repositoris/cart_repository.dart';
import '../../../app/core/exceptions/exceptions.dart';

class CreateCartUseCase extends ParamUseCase<void, CreateCartRequest> {
  final CartRepository _cartRepository;

  CreateCartUseCase(this._cartRepository);

  @override
  Future<void> execute(CreateCartRequest params) async {
    try {
      await _cartRepository.createCart(request: params);
    } on DioError catch (e) {
      throw createErrorEntity(e);
    } catch (e) {
      throw Exception('Unexpected Exception $e');
    }
  }
}
