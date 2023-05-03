import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:soc_grocery/app/config/app_constants.dart';
import 'package:soc_grocery/data/models/request/login_google_request.dart';
import 'package:soc_grocery/data/models/request/login_request.dart';
import 'package:soc_grocery/data/models/request/register_request.dart';
import 'package:soc_grocery/data/models/response/base_response.dart';

part 'auth_service.g.dart';

@RestApi(baseUrl: kBaseURl)
abstract class AuthService {
  factory AuthService(Dio dio, {String baseUrl}) = _AuthService;

  @POST('/auth/register')
  Future<BaseResponse> register({
    @Body() required RegisterRequest registerRequest
  });

  @POST('/auth/login')
  Future<BaseResponse> login({
    @Body() required LoginRequest loginRequest
  });

  @POST('/auth/google/login')
  Future<BaseResponse> loginWithGoogle({
    @Body() required LoginGoogleRequest loginGoogleRequest
  });
}
