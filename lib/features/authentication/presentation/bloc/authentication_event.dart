part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class LoginUserWithEmail extends AuthenticationEvent {
  final String email;
  final String password;

  const LoginUserWithEmail({this.email, this.password});

  @override
  List<Object> get props => [email, password];
}

class RegisterUserWithEmail extends AuthenticationEvent {
  final String name;
  final String email;
  final String password;

  const RegisterUserWithEmail({this.name, this.email, this.password});

  @override
  List<Object> get props => [name, email, password];
}

class LoggedIn extends AuthenticationEvent {
  final String token;

  const LoggedIn({@required this.token});

  @override
  List<Object> get props => [token];
}
