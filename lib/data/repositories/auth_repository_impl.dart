import 'package:dio/dio.dart';
import 'package:soc_grocery/app/core/exceptions/exceptions.dart';
import 'package:soc_grocery/data/datasources/remote/auth/auth_service.dart';
import 'package:soc_grocery/data/models/base_response.dart';
import 'package:soc_grocery/domain/repositoris/auth_repository.dart';

class AuthRepoImpl implements AuthRepository {
  AuthRepoImpl({required this.authService});

  AuthService authService;

  @override
  Future<BaseResponse> login() async {
    try {
      final response = await authService.login();
      return response;
    } on DioError catch(e) {
      throw createErrorEntity(e);
    } catch (e) {
      throw Exception('Unexpected Exception $e');
    }
  }

  @override
  Future<BaseResponse> register() async {
    try {
      final response = await authService.register();
      return response;
    } on DioError catch (e) {
      throw createErrorEntity(e);
    } catch (e) {
      throw Exception('Unexpected Exception $e');
    }
  }
}
