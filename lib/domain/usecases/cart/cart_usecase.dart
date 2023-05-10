import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:soc_grocery/app/services/local_storage.dart';
import 'package:soc_grocery/data/models/request/order_request.dart';
import 'package:soc_grocery/data/models/request/quantity_request.dart';
import 'package:soc_grocery/data/models/response/payment_history.dart';
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
      final LocalStorageService local = Get.find();
      final cartID = await local.getCartID();
      await _cartRepository.addItemToCart(
          cartID: cartID ?? '',
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
      final LocalStorageService local = Get.find();
      final cartID = await local.getCartID();
      await _cartRepository.deleteCartItem(
          cartID: cartID ?? '',
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
      final LocalStorageService local = Get.find();
      final cartID = await local.getCartID();
      await _cartRepository.updateCartItem(
          cartID: cartID ?? '',
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

  Future<void> createOrder({
    required OrderRequest orderRequest
  }) async {
    try {
      final LocalStorageService local = Get.find();
      final cartID = await local.getCartID();
      await _cartRepository.createOrder(orderRequest: orderRequest);
    } on DioError catch (e) {
      throw createErrorEntity(e);
    } catch (e) {
      throw Exception('Unexpected Exception $e');
    }
  }

  Future<List<PaymentHistory>> getOrder() async {
    try {
      final LocalStorageService local = Get.find();
      final response = await _cartRepository.getOrder();

      List<PaymentHistory> list = (response.data as List)
          .map((item) => PaymentHistory.fromJson(item))
          .toList();
      return list;
    } on DioError catch (e) {
      throw createErrorEntity(e);
    } catch (e) {
      throw Exception('Unexpected Exception $e');
    }
  }
}