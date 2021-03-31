import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/auth_repository.dart';

class LoginUserWithEmailUseCase implements Usecase<String, Params> {
  final AuthRepository authRepository;

  LoginUserWithEmailUseCase(this.authRepository);

  @override
  Future<Either<Failure, String>> call(Params params) {
    return authRepository.loginUserWithEmail(params.email, params.password);
  }
}

class Params extends Equatable {
  final String email;
  final String password;

  Params(
    this.email,
    this.password,
  );

  @override
  List<Object> get props => [email, password];
}
