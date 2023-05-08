import 'package:soc_grocery/data/models/request/add_item_request.dart';
import 'package:soc_grocery/data/models/request/create_cart_request.dart';

import '../../data/models/response/base_response.dart';

abstract class CartRepository {
  Future<BaseResponse> createCart({
    required CreateCartRequest request
  });
  Future<BaseResponse> getCart();
  Future<BaseResponse> addItemToCart({
    required String productID,
    required AddItemRequest itemRequest
  });
}