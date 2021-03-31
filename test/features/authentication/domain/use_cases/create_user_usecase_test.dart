import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:furnitur/core/errors/failures.dart';
import 'package:furnitur/features/authentication/domain/repositories/auth_repository.dart';
import 'package:furnitur/features/authentication/domain/use_cases/create_user_use_case.dart';
import 'package:mockito/mockito.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  MockAuthRepository mockAuthRepository;
  CreateUserUseCase createUserUseCase;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    createUserUseCase = CreateUserUseCase(mockAuthRepository);
  });

  group('Login User with Email', () {
    final String name = 'ABCD';
    final String email = 'acd@gmail.com';
    final String password = '12345678';

    test(
      'should call createUser method from AuthRepository',
      () {
        //arrange

        //act
        createUserUseCase.call(Params(name, email, password));

        //assert
        verify(mockAuthRepository.createUser(name, email, password));
      },
    );

    test(
      'should return authId(String) on success ',
      () async {
        //arrange
        final String authId = 'BAVH456VCt7';
        when(mockAuthRepository.createUser(any, any, any))
            .thenAnswer((_) async => Right(authId));

        //act
        var result =
            await createUserUseCase.call(Params(name, email, password));

        //assert
        expect(result, Right(authId));
      },
    );

    test(
      'should return Failure on failure',
      () async {
        //arrange
        //! can return any type of Failure.
        when(mockAuthRepository.createUser(any, any, any))
            .thenAnswer((_) async => Left(ServerFailure()));

        //act
        var result =
            await createUserUseCase.call(Params(name, email, password));

        //assert
        expect(result, isA<Left>());
      },
    );
  });
}
