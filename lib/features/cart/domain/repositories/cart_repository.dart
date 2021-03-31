import 'package:dartz/dartz.dart';
import 'package:furnitur/core/errors/failures.dart';
import 'package:furnitur/features/cart/domain/entities/cart_item.dart';
import 'package:furnitur/features/home/domain/entities/product.dart';

abstract class CartRepository {
  /// Will add the given item to cart
  ///
  /// Will Return [Failure] if failure
  /// occurred, otherwise null
  Future<Either<Failure, void>> addItemToCart(Product cartItem);

  /// Will return all the items
  /// present in cart
  ///
  /// Will Return [Failure] if failure
  /// occurred
  Future<Either<Failure, List<CartItem>>> getItemsInCart();

  /// Will delete given items from
  /// the cart
  ///
  /// Will Return [Failure] if failure
  /// occurred
  Future<Either<Failure, void>> deleteItemFromCart(Product cartItem);
}
