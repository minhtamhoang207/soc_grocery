import 'package:get/get.dart';

import '../../../domain/usecases/category/get_category_use_case.dart';
import '../controllers/explore_controller.dart';

class ExploreBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(GetCategoryUseCase(Get.find()));
    Get.put(ExploreController(Get.find()));
  }
}
