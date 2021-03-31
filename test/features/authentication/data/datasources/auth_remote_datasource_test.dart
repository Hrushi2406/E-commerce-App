import 'package:flutter_test/flutter_test.dart';
import 'package:furnitur/core/network_interface/server_interactor.dart';
import 'package:furnitur/features/authentication/data/data_sources/auth_remote_datasource.dart';
import 'package:mockito/mockito.dart';

class MockServerInteractor extends Mock implements ServerInteractor {}

void main() {
  MockServerInteractor server;
  AuthRemoteDatasourceImpl remoteDataSource;

  setUp(() {
    server = new MockServerInteractor();
    remoteDataSource = new AuthRemoteDatasourceImpl(server: server);
  });

  group("Login User", () {
    final token = "string";
    final body = {'email': 'hrushi@gmail.com', 'password': 'Hrushi@2406'};

    test(
      'should perform a post request with email and password',
      () async {
        //arrange
        when(
          server.postRequest(
            any,
            body: body,
          ),
        ).thenAnswer((_) => Future.value(token));
        //act
        remoteDataSource.loginUserWithEmail('hrushi@gmail.com', 'Hrushi@2406');
        //assert
        verify(
          server.postRequest(
            '/login',
            body: body,
          ),
        );
      },
    );

    test(
      'should set headers to default after receiving token on success',
      () async {
        //arrange
        when(
          server.postRequest(
            any,
            body: body,
          ),
        ).thenAnswer((_) => Future.value(token));
        //act
        await remoteDataSource.loginUserWithEmail(
            'hrushi@gmail.com', 'Hrushi@2406');
        // server.setDefaultHeaders({'Authorization': token});

        //assert
        verify(
          server.postRequest(
            '/login',
            body: body,
          ),
        );
        verify(server.setDefaultHeaders({'Authorization': token}));
      },
    );
    test(
      'should return a token if success',
      () async {
        //arrange
        when(
          server.postRequest(
            any,
            body: body,
          ),
        ).thenAnswer((_) => Future.value(token));

        //act
        final result = await remoteDataSource.loginUserWithEmail(
            'hrushi@gmail.com', 'Hrushi@2406');

        //assert
        expect(result, equals(token));
      },
    );
  });

  group("Register or Sign Up User", () {
    final token = "string";
    final body = {
      'name': 'Hrushi',
      'email': 'hrushi@gmail.com',
      'password': 'Hrushi@2406'
    };

    test(
      'should perform a post request with name, email and password',
      () async {
        //arrange
        when(
          server.postRequest(
            any,
            body: body,
          ),
        ).thenAnswer((_) => Future.value(token));
        //act
        remoteDataSource.registerUserWithEmail(
            'Hrushi', 'hrushi@gmail.com', 'Hrushi@2406');
        //assert
        verify(
          server.postRequest(
            '/signup',
            body: body,
          ),
        );
      },
    );

    test(
      'should return a token if success',
      () async {
        //arrange
        when(
          server.postRequest(
            any,
            body: body,
          ),
        ).thenAnswer((_) => Future.value(token));

        //act
        final result = await remoteDataSource.registerUserWithEmail(
            'Hrushi', 'hrushi@gmail.com', 'Hrushi@2406');

        //assert
        expect(result, equals(token));
      },
    );
  });
}
