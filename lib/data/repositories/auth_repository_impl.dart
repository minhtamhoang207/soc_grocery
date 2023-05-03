import 'package:soc_grocery/data/datasources/remote/auth/auth_service.dart';
import 'package:soc_grocery/data/models/request/login_google_request.dart';
import 'package:soc_grocery/data/models/request/login_request.dart';
import 'package:soc_grocery/data/models/request/register_request.dart';
import 'package:soc_grocery/data/models/response/base_response.dart';
import 'package:soc_grocery/domain/repositoris/auth_repository.dart';

class AuthRepoImpl implements AuthRepository {
  AuthRepoImpl({required this.authService});

  AuthService authService;

  @override
  Future<BaseResponse> login({required LoginRequest loginRequest}) async {
    final response = await authService.login(loginRequest: loginRequest);

    if (response.data != null) {
      return response;
    } else {
      throw Exception();
    }
  }

  @override
  Future<BaseResponse> register(
      {required RegisterRequest registerRequest}) async {
    final response =
        await authService.register(registerRequest: registerRequest);

    if (response.data != null) {
      return response;
    } else {
      throw Exception();
    }
  }

  @override
  Future<BaseResponse> loginGoogle(
      {required LoginGoogleRequest loginGoogleRequest}) async {
    final response = await authService.loginWithGoogle(
        loginGoogleRequest: loginGoogleRequest);

    if (response.data != null) {
      return response;
    } else {
      throw Exception();
    }
  }
}
