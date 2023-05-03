import 'package:dio/dio.dart';
import 'package:soc_grocery/app/core/usecases/param_use_case.dart';
import 'package:soc_grocery/data/models/request/login_request.dart';
import 'package:soc_grocery/data/models/response/base_response.dart';
import 'package:soc_grocery/data/models/response/user_response.dart';
import 'package:soc_grocery/domain/repositoris/auth_repository.dart';

import '../../../app/core/exceptions/exceptions.dart';

class LoginUseCase extends ParamUseCase<UserResponse, LoginRequest> {
  final AuthRepository _authRepository;

  LoginUseCase(this._authRepository);

  @override
  Future<UserResponse> execute(LoginRequest params) async {
    try {
      final response = await _authRepository.login(loginRequest: params);
      return UserResponse.fromJson(response.data);
    } on DioError catch (e) {
      throw createErrorEntity(e);
    } catch (e) {
      throw Exception('Unexpected Exception $e');
    }
  }
}