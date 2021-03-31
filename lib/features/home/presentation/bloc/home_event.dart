part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class FetchHomeScreen extends HomeEvent {}

class GetForYouProducts extends HomeEvent {}

class GetSpecialOffers extends HomeEvent {}
