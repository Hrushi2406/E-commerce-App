import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:furnitur/core/errors/failures.dart';
import 'package:furnitur/core/usecase/usecase.dart';
import 'package:furnitur/features/authentication/domain/repositories/auth_repository.dart';
import 'package:furnitur/features/authentication/domain/use_cases/login_user_with_facebook_use_case.dart';
import 'package:mockito/mockito.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  MockAuthRepository mockAuthRepository;
  LoginUserWithFacebookUseCase loginUserWithFacebookUseCase;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    loginUserWithFacebookUseCase =
        LoginUserWithFacebookUseCase(mockAuthRepository);
  });

  group('Login User with Facebook', () {
    test(
      'should call loginUserWithFacebook method from AuthRepository',
      () {
        //arrange

        //act
        loginUserWithFacebookUseCase.call(NoParams());

        //assert
        verify(mockAuthRepository.loginUserWithFacebook());
      },
    );

    test(
      'should return authId(String) on success ',
      () async {
        //arrange
        final String authId = 'BAVH456VCt7';
        when(mockAuthRepository.loginUserWithFacebook())
            .thenAnswer((_) async => Right(authId));

        //act
        var result = await loginUserWithFacebookUseCase.call(NoParams());

        //assert
        expect(result, Right(authId));
      },
    );

    test(
      'should return Failure on failure',
      () async {
        //arrange
        //! can return any type of Failure.
        when(mockAuthRepository.loginUserWithFacebook())
            .thenAnswer((_) async => Left(ServerFailure()));

        //act
        var result = await loginUserWithFacebookUseCase.call(NoParams());

        //assert
        expect(result, isA<Left>());
      },
    );
  });
}
