import 'package:dartz/dartz.dart';
import 'package:furnitur/core/errors/failures.dart';
import 'package:furnitur/core/usecase/usecase.dart';
import 'package:furnitur/features/cart/domain/entities/cart_item.dart';
import 'package:furnitur/features/cart/domain/repositories/cart_repository.dart';

class GetItemsInCartUseCase implements Usecase<List<CartItem>, NoParams> {
  final CartRepository cartRepository;

  GetItemsInCartUseCase(this.cartRepository);

  @override
  Future<Either<Failure, List<CartItem>>> call(NoParams noParam) {
    return cartRepository.getItemsInCart();
  }
}
