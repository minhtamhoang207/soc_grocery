import 'package:get/get.dart';
import 'package:soc_grocery/domain/usecases/category/get_category_use_case.dart';

import '../../../data/models/response/category_response.dart';

class ExploreController extends GetxController {

  final GetCategoryUseCase _getCategoryUseCase;

  ExploreController(this._getCategoryUseCase);
  Rx<List<CategoryResponse>> listCategory = Rx([]);

  @override
  void onInit() async {
    listCategory.value = await _getCategoryUseCase.execute();
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
}
