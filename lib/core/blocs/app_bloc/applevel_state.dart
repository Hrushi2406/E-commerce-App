part of 'applevel_bloc.dart';

abstract class ApplevelState extends Equatable {
  const ApplevelState();

  @override
  List<Object> get props => [];
}

class AppLevelIntial extends ApplevelState {}

class AppLevelAuthenticated extends ApplevelState {}

class AppLevelUnauthenticated extends ApplevelState {}

class AppFirstTime extends ApplevelState {}
