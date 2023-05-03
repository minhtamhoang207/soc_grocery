import 'package:dio/dio.dart';
import 'package:soc_grocery/app/core/usecases/no_param_usecase.dart';
import 'package:soc_grocery/app/core/usecases/param_use_case.dart';
import 'package:soc_grocery/data/models/request/register_request.dart';
import 'package:soc_grocery/data/models/response/category_response.dart';
import 'package:soc_grocery/data/models/response/user_response.dart';
import 'package:soc_grocery/domain/repositoris/auth_repository.dart';
import 'package:soc_grocery/domain/repositoris/category_repository.dart';

import '../../../app/core/exceptions/exceptions.dart';

class GetCategoryUseCase extends NoParamUseCase<List<CategoryResponse>> {
  final CategoryRepository _categoryRepository;

  GetCategoryUseCase(this._categoryRepository);

  @override
  Future<List<CategoryResponse>> execute() async {
    try {
      final response = await _categoryRepository.getListCategory();
      // List<CategoryResponse> listCategory =
      //     response.data.map((json) => CategoryResponse.fromJson(json)).toList();

      List<CategoryResponse> categoryList = (response.data as List)
          .map((item) => CategoryResponse.fromJson(item))
          .toList();

      return categoryList;
    } on DioError catch (e) {
      throw createErrorEntity(e);
    } catch (e) {
      throw Exception('Unexpected Exception $e');
    }
  }
}
