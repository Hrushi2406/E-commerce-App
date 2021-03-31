import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:furnitur/core/errors/failures.dart';
import 'package:furnitur/features/authentication/domain/repositories/auth_repository.dart';
import 'package:furnitur/features/authentication/domain/use_cases/login_user_with_email_use_case.dart';
import 'package:mockito/mockito.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  MockAuthRepository mockAuthRepository;
  LoginUserWithEmailUseCase loginUserWithEmailUseCase;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    loginUserWithEmailUseCase = LoginUserWithEmailUseCase(mockAuthRepository);
  });

  group('Login User with Email', () {
    final String email = 'acd@gmail.com';
    final String password = '12345678';

    test(
      'should call loginUserWithEmail method from AuthRepository',
      () {
        //arrange

        //act
        loginUserWithEmailUseCase.call(Params(email, password));

        //assert
        verify(mockAuthRepository.loginUserWithEmail(email, password));
      },
    );

    test(
      'should return authId(String) on success ',
      () async {
        //arrange
        final String authId = 'BAVH456VCt7';
        when(mockAuthRepository.loginUserWithEmail(any, any))
            .thenAnswer((_) async => Right(authId));

        //act
        var result =
            await loginUserWithEmailUseCase.call(Params(email, password));

        //assert
        expect(result, Right(authId));
      },
    );

    test(
      'should return Failure on failure',
      () async {
        //arrange
        //! can return any type of Failure.
        when(mockAuthRepository.loginUserWithEmail(any, any))
            .thenAnswer((_) async => Left(ServerFailure()));

        //act
        var result =
            await loginUserWithEmailUseCase.call(Params(email, password));

        //assert
        expect(result, isA<Left>());
      },
    );
  });
}
