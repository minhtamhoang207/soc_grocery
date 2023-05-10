import 'package:soc_grocery/data/models/request/add_item_request.dart';
import 'package:soc_grocery/data/models/request/create_cart_request.dart';
import 'package:soc_grocery/data/models/request/order_request.dart';
import 'package:soc_grocery/data/models/request/quantity_request.dart';

import '../../data/models/response/base_response.dart';

abstract class CartRepository {
  Future<BaseResponse> createCart({
    required CreateCartRequest request
  });

  Future<BaseResponse> getCart();

  Future<BaseResponse> addItemToCart({
    required String cartID,
    required AddItemRequest itemRequest
  });

  Future<BaseResponse> updateCartItem({
    required String cartID,
    required String productID,
    required QuantityRequest quantityRequest
  });

  Future<BaseResponse> deleteCartItem({
    required String cartID,
    required String productID,
  });

  Future<BaseResponse> createOrder({
    required OrderRequest orderRequest
  });

  Future<BaseResponse> getOrder();
}