import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/auth_repository.dart';

class CreateUserUseCase implements Usecase<String, Params> {
  final AuthRepository authRepository;

  CreateUserUseCase(this.authRepository);

  @override
  Future<Either<Failure, String>> call(Params params) {
    return authRepository.createUser(
        params.name, params.email, params.password);
  }
}

class Params extends Equatable {
  final String name;
  final String email;
  final String password;

  Params(
    this.name,
    this.email,
    this.password,
  );

  @override
  List<Object> get props => [name, email, password];
}
