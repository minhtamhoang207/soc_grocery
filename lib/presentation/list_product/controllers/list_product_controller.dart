import 'dart:developer';

import 'package:get/get.dart';
import 'package:soc_grocery/presentation/explore/views/explore_view.dart';

import '../../../data/models/response/product_response.dart';
import '../../../domain/usecases/product/get_product_usecase.dart';

class ListProductController extends GetxController {
  ListProductController(this._getProductUseCase);

  final GetProductUseCase _getProductUseCase;
  Rx<List<ProductResponse>> listProduct = Rx([]);
  final status = RxStatus.empty().obs;
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
}
