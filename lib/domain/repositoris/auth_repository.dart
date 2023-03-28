import 'package:soc_grocery/data/models/base_response.dart';

abstract class AuthRepository {
  Future<BaseResponse> register();

  Future<BaseResponse> login();
}
