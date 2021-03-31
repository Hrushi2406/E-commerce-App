part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class GetCartItems extends CartEvent {}

class AddItemToCart extends CartEvent {
  final Product cartItem;

  AddItemToCart({this.cartItem});

  @override
  List<Object> get props => [cartItem];
}

class DeleteItemToCart extends CartEvent {
  final Product cartItem;

  DeleteItemToCart({this.cartItem});

  @override
  List<Object> get props => [cartItem];
}

class ChangeItemColor extends CartEvent {
  final int colorIndex;

  ChangeItemColor({this.colorIndex});

  @override
  List<Object> get props => [colorIndex];
}
