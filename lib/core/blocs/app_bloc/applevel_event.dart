part of 'applevel_bloc.dart';

abstract class ApplevelEvent extends Equatable {
  const ApplevelEvent();

  @override
  List<Object> get props => [];
}

class AppStarted extends ApplevelEvent {}

class SetAuthenticated extends ApplevelEvent {}

class SetUnauthenticated extends ApplevelEvent {}

class SetIsFirstTime extends ApplevelEvent {}

class SetTokenToDefaultHeaders extends ApplevelEvent {
  final String token;

  SetTokenToDefaultHeaders({this.token});

  @override
  List<Object> get props => [token];
}
