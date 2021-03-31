import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:furnitur/core/errors/failures.dart';
import 'package:furnitur/features/authentication/domain/repositories/auth_repository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthRepository authRepository;

  //Constructor
  AuthenticationBloc({
    this.authRepository,
  }) : super(AuthenticationInitial());

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is LoginUserWithEmail) {
      //Add Loading State
      yield AuthenticationLoading();

      final tokenOrFailure =
          await authRepository.loginUserWithEmail(event.email, event.password);

      //Handle State
      yield* tokenOrFailure.fold((failure) async* {
        yield AuthenticationFailure(errorHandler: failure);
      }, (token) async* {
        yield AuthenticatedUser();
      });
    } else if (event is RegisterUserWithEmail) {
      //Add Loading State
      yield AuthenticationLoading();

      final tokenOrFailure = await authRepository.createUser(
        event.name,
        event.email,
        event.password,
      );

      //Handle State
      yield* tokenOrFailure.fold((failure) async* {
        yield AuthenticationFailure(errorHandler: failure);
      }, (token) async* {
        yield AuthenticatedUser();
      });
    }
  }

  handleFold(tokenOrFailure) async {
    return tokenOrFailure.fold((failure) async* {
      yield AuthenticationFailure(errorHandler: failure);
    }, (token) async* {
      yield AuthenticatedUser();
    });
  }
}
