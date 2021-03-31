import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';

abstract class AuthRepository {
  Future<Either<Failure, String>> loginUserWithEmail(
    String email,
    String password,
  );

  Future<Either<Failure, String>> loginUserWithGoogle();

  Future<Either<Failure, String>> loginUserWithFacebook();

  Future<Either<Failure, String>> createUser(
    String name,
    String email,
    String password,
  );

  Future<Either<Failure, String>> getAuthToken();
}
