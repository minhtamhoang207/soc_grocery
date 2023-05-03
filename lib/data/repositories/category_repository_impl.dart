import 'package:soc_grocery/data/datasources/remote/category/category_service.dart';
import 'package:soc_grocery/data/models/response/base_response.dart';
import 'package:soc_grocery/domain/repositoris/category_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository {

  CategoryRepositoryImpl({required this.categoryService});

  CategoryService categoryService;

  @override
  Future<BaseResponse> getListCategory() async {
    final response = await categoryService.getListCategory();

    if (response.data != null) {
      return response;
    } else {
      throw Exception();
    }
  }

}