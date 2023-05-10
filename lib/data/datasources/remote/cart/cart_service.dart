import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:soc_grocery/app/config/app_constants.dart';
import 'package:soc_grocery/data/models/request/add_item_request.dart';
import 'package:soc_grocery/data/models/request/create_cart_request.dart';
import 'package:soc_grocery/data/models/request/order_request.dart';
import 'package:soc_grocery/data/models/request/quantity_request.dart';
import 'package:soc_grocery/data/models/response/base_response.dart';

part 'cart_service.g.dart';

@RestApi(baseUrl: kBaseURl)
abstract class CartService {
  factory CartService(Dio dio, {String baseUrl}) = _CartService;

  @POST('/cart')
  Future<BaseResponse> createCart({
    @Body() required CreateCartRequest request
  });

  @GET('/cart')
  Future<BaseResponse> getCart();

  @POST('/cart/{cartID}/items')
  Future<BaseResponse> addItemToCart({
    @Path("cartID") required String cartID,
    @Body() required AddItemRequest itemRequest
  });
  
  @PUT('/cart/{id}/items/{productId}')
  Future<BaseResponse> updateCartItem({
      @Path("id") required String cartID,
      @Path("productId") required String productID,
      @Body() required QuantityRequest quantityRequest
  });

  @DELETE('/cart/{id}/items/{productId}')
  Future<BaseResponse> deleteCartItem({
    @Path("id") required String cartID,
    @Path("productId") required String productID,
  });

  @POST('/order')
  Future<BaseResponse> createOrder({
    @Body() required OrderRequest orderRequest
  });

  @GET('/order')
  Future<BaseResponse> getOrder();
}
