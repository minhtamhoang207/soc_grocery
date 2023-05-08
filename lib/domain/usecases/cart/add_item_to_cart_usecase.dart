import 'package:dio/dio.dart';
import 'package:soc_grocery/data/models/request/add_item_request.dart';

import '../../../app/core/exceptions/exceptions.dart';
import '../../repositoris/cart_repository.dart';

class AddToCartUseCase {
  final CartRepository _cartRepository;

  AddToCartUseCase(this._cartRepository);

  Future<void> execute({
    required String productID,
    required AddItemRequest addItemRequest
  }) async {
    try {
      await _cartRepository.addItemToCart(
          productID: productID,
          itemRequest: addItemRequest
      );
    } on DioError catch (e) {
      throw createErrorEntity(e);
    } catch (e) {
      throw Exception('Unexpected Exception $e');
    }
  }
}