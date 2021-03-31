import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:furnitur/core/errors/failures.dart';
import 'package:furnitur/core/usecase/usecase.dart';
import 'package:furnitur/features/cart/domain/entities/cart_item.dart';
import 'package:furnitur/features/cart/domain/repositories/cart_repository.dart';

class DeleteItemFromCartUseCase implements Usecase<void, Params> {
  final CartRepository cartRepository;

  DeleteItemFromCartUseCase(this.cartRepository);

  @override
  Future<Either<Failure, void>> call(Params params) {
    return cartRepository.deleteItemFromCart(params.cartItem);
  }
}

class Params extends Equatable {
  final CartItem cartItem;

  Params(this.cartItem);

  @override
  List<Object> get props => [cartItem];
}
