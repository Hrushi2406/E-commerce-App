part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeFailure extends HomeState {
  final ErrorHandler errorHandler;

  HomeFailure({this.errorHandler});
}

class HomeLoaded extends HomeState {
  final List<String> specialOffers;
  final List<ProductModel> forYouProducts;

  HomeLoaded({this.forYouProducts, this.specialOffers});
}
