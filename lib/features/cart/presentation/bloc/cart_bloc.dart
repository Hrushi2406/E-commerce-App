import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:furnitur/core/errors/failures.dart';
import 'package:furnitur/features/cart/domain/entities/cart_item.dart';
import 'package:furnitur/features/cart/domain/repositories/cart_repository.dart';
import 'package:furnitur/features/home/domain/entities/product.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepository cartRepository;

  CartBloc({this.cartRepository}) : super(CartInitial());

  @override
  void onTransition(Transition<CartEvent, CartState> transition) {
    print(transition);
    super.onTransition(transition);
  }

  @override
  Stream<CartState> mapEventToState(
    CartEvent event,
  ) async* {
    if (event is GetCartItems) {
      //set loading
      yield CartLoading();

      //call the method
      final cartItemsOrFailure = await cartRepository.getItemsInCart();

      //handle product or failure
      yield* cartItemsOrFailure.fold(
        (failure) async* {
          yield CartFailure(errorHandler: failure);
        },
        (products) async* {
          if (products.length == 0) {
            yield CartFailure(
                errorHandler:
                    ErrorHandler().setError(errorMessage: "No Products found"));
            return;
          }
          yield CartLoaded(cartItems: products);
        },
      );
    } else if (event is AddItemToCart) {
//set loading
      yield CartLoading();

      //call the method
      final cartItemsOrFailure =
          await cartRepository.addItemToCart(event.cartItem);

      //handle product or failure
      yield* cartItemsOrFailure.fold(
        (failure) async* {
          yield CartFailure(errorHandler: failure);
        },
        (products) async* {
          yield CartSuccess();
        },
      );
    } else if (event is DeleteItemToCart) {
      //set loading
      yield CartLoading();

      //call the method
      final cartItemsOrFailure =
          await cartRepository.deleteItemFromCart(event.cartItem);

      //handle product or failure
      yield* cartItemsOrFailure.fold(
        (failure) async* {
          yield CartFailure(errorHandler: failure);
        },
        (products) async* {
          add(GetCartItems());
        },
      );
    } else if (event is ChangeItemColor) {
      yield ItemColorChanged(newIndex: event.colorIndex);
    }
  }
}
