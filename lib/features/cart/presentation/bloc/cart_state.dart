part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartSuccess extends CartState {}

class CartFailure extends CartState {
  final ErrorHandler errorHandler;

  CartFailure({this.errorHandler});

  @override
  List<Object> get props => [errorHandler];
}

class CartLoaded extends CartState {
  final List<CartItem> cartItems;

  CartLoaded({this.cartItems});

  @override
  List<Object> get props => [cartItems];
}

class ItemColorChanged extends CartState {
  final int newIndex;

  ItemColorChanged({this.newIndex});

  @override
  List<Object> get props => [newIndex];
}
