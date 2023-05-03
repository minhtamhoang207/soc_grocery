import 'package:soc_grocery/data/models/request/login_google_request.dart';
import 'package:soc_grocery/data/models/request/login_request.dart';
import 'package:soc_grocery/data/models/request/register_request.dart';
import 'package:soc_grocery/data/models/response/base_response.dart';

abstract class AuthRepository {
  Future<BaseResponse> register({required RegisterRequest registerRequest});

  Future<BaseResponse> login({required LoginRequest loginRequest});

  Future<BaseResponse> loginGoogle({required LoginGoogleRequest loginGoogleRequest});
}
