part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class FetchAllProducts extends ProductEvent {}

class FetchProductOfCategoryEvent extends ProductEvent {
  final CategoryEnum categoryEnum;

  FetchProductOfCategoryEvent({this.categoryEnum});

  @override
  List<Object> get props => [categoryEnum];
}

class FetchMultipleProductsByCategoryEvent extends ProductEvent {}
