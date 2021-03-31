import 'package:furnitur/core/network_interface/server_interactor.dart';

abstract class AuthRemoteDatasource {
  //Logging In user
  Future<String> loginUserWithEmail(String email, String password);

  //registering user
  Future<String> registerUserWithEmail(
      String name, String email, String password);
}

class AuthRemoteDatasourceImpl extends AuthRemoteDatasource {
  ServerInteractor server;

  AuthRemoteDatasourceImpl({this.server});

  @override
  Future<String> loginUserWithEmail(String email, String password) async {
    //Making request to server
    final response = await server.postRequest(
      '/login',
      body: {'email': email, 'password': password},
    );

    String token = response['token'];

    //Set Headers
    server.setDefaultHeaders({'authorization': token});

    //returning token
    return token;
  }

  @override
  Future<String> registerUserWithEmail(
    String name,
    String email,
    String password,
  ) async {
    //Making request to server
    final response = await server.postRequest(
      '/signup',
      body: {'name': name, 'email': email, 'password': password},
    );

    String token = response['token'];

    //Set Headers
    server.setDefaultHeaders({'authorization': token});

    //returning token
    return token;
  }
}
