import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:furnitur/core/errors/failures.dart';
import 'package:furnitur/core/network/network_info.dart';
import 'package:furnitur/features/authentication/data/data_sources/auth_local_datasource.dart';
import 'package:furnitur/features/authentication/data/data_sources/auth_remote_datasource.dart';
import 'package:furnitur/features/authentication/data/repositories_impl/auth_repository_impl.dart';
import 'package:mockito/mockito.dart';

class MockAuthRemoteDataSource extends Mock implements AuthRemoteDatasource {}

class MockAuthLocalDataSource extends Mock implements AuthLocalDatasource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  AuthRepositoryImpl authRepository;
  MockAuthLocalDataSource localDataSource;
  MockAuthRemoteDataSource remoteDataSource;
  MockNetworkInfo networkInfo;

  setUp(() {
    remoteDataSource = new MockAuthRemoteDataSource();
    localDataSource = new MockAuthLocalDataSource();
    networkInfo = new MockNetworkInfo();
    authRepository = new AuthRepositoryImpl(
      localDataSource: localDataSource,
      remoteDataSource: remoteDataSource,
      networkInfo: networkInfo,
    );
  });

  group(
    "Login User With Email And Password",
    () {
      final token = "String";
      final body = {'email': 'hrushi@gmail.com', 'password': 'Hrushi@2406'};

      test(
        "should check if device is online",
        () async {
          //arrage
          when(networkInfo.isConnected).thenAnswer((_) async => true);

          //act
          authRepository.loginUserWithEmail("hrushi@gmail.com", "Hrushi@2406");

          //assert
          verify(networkInfo.isConnected);
        },
      );

      group(
        "device is online",
        () {
          setUp(() {
            when(networkInfo.isConnected).thenAnswer((_) async => true);
          });

          test(
            "should return a token when remote data source response is success",
            () async {
              //arrange
              when(remoteDataSource.loginUserWithEmail(any, any))
                  .thenAnswer((_) => Future.value(token));
              //act
              final result = await authRepository.loginUserWithEmail(
                  body['email'], body['password']);
              //assert
              verify(remoteDataSource.loginUserWithEmail(
                  body['email'], body['password']));
              expect(result, Right(token));
            },
          );

          test(
            "should Cache the token Locally when call to remote data source is successfull",
            () async {
              //arrange
              when(remoteDataSource.loginUserWithEmail(any, any))
                  .thenAnswer((_) => Future.value(token));
              //act
              await authRepository.loginUserWithEmail(
                  body['email'], body['password']);
              //assert
              verify(remoteDataSource.loginUserWithEmail(
                  body['email'], body['password']));
              verify(localDataSource.setAuthToken(token));
            },
          );

          test(
            "should return Failure of ErrorHandler when remote data source response is unsuccessfull",
            () async {
              //arrange
              when(remoteDataSource.loginUserWithEmail(any, any))
                  .thenThrow(ErrorHandler());
              //act
              final result = await authRepository.loginUserWithEmail(
                  body['email'], body['password']);
              //assert
              verify(remoteDataSource.loginUserWithEmail(
                  body['email'], body['password']));

              verifyZeroInteractions(localDataSource);
              expect(result, Left(ErrorHandler()));
            },
          );
        },
      );
      group(
        "device is offline",
        () {
          setUp(() {
            when(networkInfo.isConnected).thenAnswer((_) async => false);
          });
          test(
            "should return a Failure when remote data is called",
            () async {
              //arrange
              when(remoteDataSource.loginUserWithEmail(any, any))
                  .thenThrow(ErrorHandler());
              //act
              final result = await authRepository.loginUserWithEmail(
                  body['email'], body['password']);
              //assert
              verifyZeroInteractions(localDataSource);
              verifyZeroInteractions(remoteDataSource);
              expect(result, Left(ErrorHandler()));
            },
          );
        },
      );
    },
  );

  group(
    "Register User With Email and Password",
    () {
      final token = "String";
      final body = {
        'name': 'Hrushi',
        'email': 'hrushi@gmail.com',
        'password': 'Hrushi@2406'
      };

      test(
        "should check if device is online",
        () async {
          //arrage
          when(networkInfo.isConnected).thenAnswer((_) async => true);

          //act
          authRepository.createUser(
              "Hrushi", "hrushi@gmail.com", "Hrushi@2406");

          //assert
          verify(networkInfo.isConnected);
        },
      );

      group(
        "device is online",
        () {
          setUp(() {
            when(networkInfo.isConnected).thenAnswer((_) async => true);
          });

          test(
            "should return a token when remote data source response is success",
            () async {
              //arrange
              when(remoteDataSource.registerUserWithEmail(any, any, any))
                  .thenAnswer((_) => Future.value(token));
              //act
              final result = await authRepository.createUser(
                  body['name'], body['email'], body['password']);
              //assert
              verify(remoteDataSource.registerUserWithEmail(
                  body['name'], body['email'], body['password']));
              expect(result, Right(token));
            },
          );

          test(
            "should Cache the token Locally when call to remote data source is successfull",
            () async {
              //arrange

              when(remoteDataSource.registerUserWithEmail(any, any, any))
                  .thenAnswer((_) => Future.value(token));

              //act
              await authRepository.createUser(
                  body['name'], body['email'], body['password']);
              //assert
              verify(remoteDataSource.registerUserWithEmail(
                  body['name'], body['email'], body['password']));
              verify(localDataSource.setAuthToken(token));
            },
          );

          test(
            "should return Failure of ErrorHandler when remote data source response is unsuccessfull",
            () async {
              //arrange
              when(remoteDataSource.registerUserWithEmail(any, any, any))
                  .thenThrow(ErrorHandler());
              //act
              final result = await authRepository.createUser(
                  body['name'], body['email'], body['password']);
              //assert
              verify(remoteDataSource.registerUserWithEmail(
                  body['name'], body['email'], body['password']));

              verifyZeroInteractions(localDataSource);
              expect(result, Left(ErrorHandler()));
            },
          );
        },
      );
      group(
        "device is offline",
        () {
          setUp(() {
            when(networkInfo.isConnected).thenAnswer((_) async => false);
          });
          test(
            "should return a Failure when remote data is called",
            () async {
              //arrange
              when(remoteDataSource.registerUserWithEmail(any, any, any))
                  .thenThrow(ErrorHandler());
              //act
              final result = await authRepository.loginUserWithEmail(
                  body['email'], body['password']);
              //assert
              verifyZeroInteractions(localDataSource);
              verifyZeroInteractions(remoteDataSource);
              expect(result, Left(ErrorHandler()));
            },
          );
        },
      );
    },
  );
}
