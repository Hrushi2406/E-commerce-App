import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/auth_repository.dart';

class LoginUserWithFacebookUseCase implements Usecase<String, NoParams> {
  final AuthRepository authRepository;

  LoginUserWithFacebookUseCase(this.authRepository);

  @override
  Future<Either<Failure, String>> call(NoParams noParams) {
    return authRepository.loginUserWithFacebook();
  }
}
