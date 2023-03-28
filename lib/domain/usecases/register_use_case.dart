import 'package:soc_grocery/app/core/usecases/no_param_usecase.dart';
import 'package:soc_grocery/data/models/base_response.dart';
import 'package:soc_grocery/domain/repositoris/auth_repository.dart';

class RegisterUseCase extends NoParamUseCase<BaseResponse> {
  final AuthRepository _authRepository;

  RegisterUseCase(this._authRepository);

  @override
  Future<BaseResponse> execute() {
    return _authRepository.register();
  }
}