import 'package:equatable/equatable.dart';

///[Failure] is occurred when the app fails to
///perform a certain task.
abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

///[ServerFailure] occurs when the app fails to
///get the data from the server
class ServerFailure extends Failure {}

///[CacheFailure] occurs when the app fails to
///store the data locally on the device
class CacheFailure extends Failure {}

class ErrorHandler extends Failure {
  //Properties
  final String errorMessage;
  final String name;
  final String email;
  final String password;
  final String token;

  ErrorHandler({
    this.errorMessage,
    this.name,
    this.email,
    this.password,
    this.token,
  });

//Serialize data
  factory ErrorHandler.fromJson(Map<String, dynamic> errors) {
    return ErrorHandler(
      errorMessage: errors['errorMessage'],
      name: errors['errors']['name'],
      email: errors['errors']['email'],
      password: errors['errors']['password'],
      token: errors['errors']['token'],
    );
  }

  //To Create a custom error from app
  ErrorHandler setError({
    errorMessage = '',
    name = '',
    email = '',
    password = '',
    token = '',
  }) {
    return ErrorHandler(
      errorMessage: errorMessage,
      name: name,
      email: email,
      password: password,
      token: token,
    );
  }
}
