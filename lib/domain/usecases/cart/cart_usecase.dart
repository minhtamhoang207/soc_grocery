import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:soc_grocery/data/models/request/quantity_request.dart';
import '../../../app/core/exceptions/exceptions.dart';
import '../../../data/models/request/add_item_request.dart';
import '../../repositoris/cart_repository.dart';

class CartUseCases {
  final CartRepository _cartRepository;

  CartUseCases(this._cartRepository);

  Future<void> addItem({
    required String productID,
    required AddItemRequest addItemRequest
  }) async {
    try {
      await _cartRepository.addItemToCart(
          cartID: '6458aec17a0b4b425766181f',
          itemRequest: addItemRequest
      );
    } on DioError catch (e) {
      throw createErrorEntity(e);
    } catch (e) {
      throw Exception('Unexpected Exception $e');
    }
  }

  Future<void> deleteItem({
    required String cartID,
    required String productID,
  }) async {
    try {
      await _cartRepository.deleteCartItem(
          cartID: '6458aec17a0b4b425766181f',
          productID: productID
      );
    } on DioError catch (e) {
      throw createErrorEntity(e);
    } catch (e) {
      throw Exception('Unexpected Exception $e');
    }
  }

  Future<void> updateItem({
    required String cartID,
    required String productID,
    required QuantityRequest quantityRequest
  }) async {
    try {
      await _cartRepository.updateCartItem(
          cartID: '6458aec17a0b4b425766181f',
          productID: productID,
          quantityRequest: quantityRequest
      );
      return;
    } on DioError catch (e) {
      throw createErrorEntity(e);
    } catch (e) {
      log(e.toString());
      throw Exception('Unexpected Exception $e');
    }
  }
}