import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:furnitur/core/errors/failures.dart';
import 'package:furnitur/core/usecase/usecase.dart';
import 'package:furnitur/features/authentication/domain/repositories/auth_repository.dart';
import 'package:furnitur/features/authentication/domain/use_cases/login_user_with_google_use_case.dart';
import 'package:mockito/mockito.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  MockAuthRepository mockAuthRepository;
  LoginUserWithGoogleUseCase loginUserWithGoogleUseCase;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    loginUserWithGoogleUseCase = LoginUserWithGoogleUseCase(mockAuthRepository);
  });

  group('Login User with Google', () {
    test(
      'should call loginUserWithGoogle method from AuthRepository',
      () {
        //arrange

        //act
        loginUserWithGoogleUseCase.call(NoParams());

        //assert
        verify(mockAuthRepository.loginUserWithGoogle());
      },
    );

    test(
      'should return authId(String) on success ',
      () async {
        //arrange
        final String authId = 'BAVH456VCt7';
        when(mockAuthRepository.loginUserWithGoogle())
            .thenAnswer((_) async => Right(authId));

        //act
        var result = await loginUserWithGoogleUseCase.call(NoParams());

        //assert
        expect(result, Right(authId));
      },
    );

    test(
      'should return Failure on failure',
      () async {
        //arrange
        //! can return any type of Failure.
        when(mockAuthRepository.loginUserWithGoogle())
            .thenAnswer((_) async => Left(ServerFailure()));

        //act
        var result = await loginUserWithGoogleUseCase.call(NoParams());

        //assert
        expect(result, isA<Left>());
      },
    );
  });
}
