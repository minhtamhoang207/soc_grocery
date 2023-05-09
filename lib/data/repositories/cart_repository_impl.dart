import 'package:soc_grocery/data/datasources/remote/cart/cart_service.dart';
import 'package:soc_grocery/data/models/request/add_item_request.dart';
import 'package:soc_grocery/data/models/request/create_cart_request.dart';
import 'package:soc_grocery/data/models/request/quantity_request.dart';
import 'package:soc_grocery/data/models/response/base_response.dart';

import '../../domain/repositoris/cart_repository.dart';

class CartRepositoryImpl implements CartRepository {

  CartRepositoryImpl({required this.cartService});

  CartService cartService;

  @override
  Future<BaseResponse> addItemToCart({
    required String cartID,
    required AddItemRequest itemRequest
  }) async {
    final response = await cartService.addItemToCart(
        cartID: cartID,
        itemRequest: itemRequest
    );

    if (response.data != null) {
      return response;
    } else {
      throw Exception();
    }
  }

  @override
  Future<BaseResponse> createCart({required CreateCartRequest request}) async {
    final response = await cartService.createCart(request: request);

    if (response.data != null) {
      return response;
    } else {
      throw Exception();
    }
  }

  @override
  Future<BaseResponse> getCart() async {
    final response = await cartService.getCart();

    if (response.data != null) {
      return response;
    } else {
      throw Exception();
    }
  }

  @override
  Future<BaseResponse> deleteCartItem({
    required String cartID,
    required String productID
  }) async {
    try {
      final response = await cartService.deleteCartItem(
        cartID: cartID,
        productID: productID,
      );
      return response;
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<BaseResponse> updateCartItem({
    required String cartID,
    required String productID,
    required QuantityRequest quantityRequest
  }) async {
    try {
      final response = await cartService.updateCartItem(
          cartID: cartID,
          productID: productID,
          quantityRequest: quantityRequest
      );
      return response;
    } catch (e) {
      throw Exception();
    }
  }
}