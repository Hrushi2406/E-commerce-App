part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductFailure extends ProductState {
  final ErrorHandler errorHandler;

  ProductFailure({this.errorHandler});

  @override
  List<Object> get props => [errorHandler];
}

class ProductLoaded extends ProductState {
  final List<ProductModel> products;
  final ProductTypeEnum type;

  ProductLoaded({this.products, this.type});

  @override
  List<Object> get props => [products];
}

class CategoryProductLoaded extends ProductState {
  final List<ProductModel> products;

  CategoryProductLoaded({this.products});

  @override
  List<Object> get props => [products];
}

class AllProductsLoaded extends ProductState {
  final List<ProductModel> products;

  AllProductsLoaded({this.products});

  @override
  List<Object> get props => [products];
}
