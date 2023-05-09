import 'dart:developer';

import 'package:get/get.dart';
import 'package:soc_grocery/presentation/explore/views/explore_view.dart';

import '../../../app/core/exceptions/exceptions.dart';
import '../../../data/models/request/add_item_request.dart';
import '../../../data/models/response/product_response.dart';
import '../../../domain/usecases/cart/cart_usecase.dart';
import '../../../domain/usecases/product/get_product_usecase.dart';

class ListProductController extends GetxController {
  ListProductController(this._getProductUseCase, this._cartUseCases);

  final CartUseCases _cartUseCases;

  final GetProductUseCase _getProductUseCase;
  Rx<List<ProductResponse>> listProduct = Rx([]);
  final status = RxStatus.empty().obs;
  final toastStatus = RxStatus.empty().obs;
  final CategoryArgument? category = Get.arguments;

  @override
  void onInit() async {
    getListProduct();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> getListProduct() async {
    try {
      status.value = RxStatus.loading();
      listProduct.value = await _getProductUseCase.execute(category?.id);
      status.value = RxStatus.success();
    } catch (e){
      log(e.toString());
      status.value = RxStatus.error('Đã xẩy ra lỗi');
    }
  }


  Future<void> addItem({required String productID}) async {
    try {
      toastStatus.value = RxStatus.loading();
      await _cartUseCases.addItem(
          productID: productID,
          addItemRequest: AddItemRequest(
              quantity: 1,
              productID: productID
          )
      );
      toastStatus.value = RxStatus.success();
    } on ErrorEntity catch (e) {
      log(e.message);
      toastStatus.value = RxStatus.error(e.message);
    } on Exception catch (e) {
      log(e.toString());
      toastStatus.value = RxStatus.error('Đã xảy ra lỗi');
    }
  }
}
