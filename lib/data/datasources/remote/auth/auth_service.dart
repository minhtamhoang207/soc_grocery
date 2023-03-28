import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:soc_grocery/app/config/app_constants.dart';
import 'package:soc_grocery/data/models/base_response.dart';

part 'auth_service.g.dart';

@RestApi(baseUrl: kBaseURl)
abstract class AuthService {
  factory AuthService(Dio dio, {String baseUrl}) = _AuthService;

  @POST('/auth/register')
  Future<BaseResponse> register();

  @POST('/auth/login')
  Future<BaseResponse> login();
}
