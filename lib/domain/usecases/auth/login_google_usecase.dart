import 'package:dio/dio.dart';
import 'package:soc_grocery/app/core/usecases/param_use_case.dart';
import 'package:soc_grocery/data/models/request/login_google_request.dart';
import 'package:soc_grocery/data/models/request/login_request.dart';
import 'package:soc_grocery/data/models/response/user_response.dart';
import 'package:soc_grocery/domain/repositoris/auth_repository.dart';

import '../../../app/core/exceptions/exceptions.dart';

class LoginGoogleUseCase extends ParamUseCase<UserResponse, LoginGoogleRequest> {
  final AuthRepository _authRepository;

  LoginGoogleUseCase(this._authRepository);

  @override
  Future<UserResponse> execute(LoginGoogleRequest params) async {
    try {
      final response = await _authRepository.loginGoogle(loginGoogleRequest: params);
      return UserResponse.fromJson(response.data);
    } on DioError catch (e) {
      throw createErrorEntity(e);
    } catch (e) {
      throw Exception('Unexpected Exception $e');
    }
  }
}