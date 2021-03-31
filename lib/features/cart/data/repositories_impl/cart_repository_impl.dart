import 'package:dartz/dartz.dart';
import 'package:furnitur/core/errors/failures.dart';
import 'package:furnitur/core/network/network_info.dart';
import 'package:furnitur/features/cart/data/data_sources/cart_remote_data_source.dart';
import 'package:furnitur/features/cart/domain/entities/cart_item.dart';
import 'package:furnitur/features/cart/domain/repositories/cart_repository.dart';
import 'package:furnitur/features/home/domain/entities/product.dart';

class CartRepositoryImpl implements CartRepository {
  final CartRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  CartRepositoryImpl({this.remoteDataSource, this.networkInfo});

  @override
  Future<Either<Failure, void>> addItemToCart(Product cartItem) async {
    // if (!await networkInfo.isConnected) {
    //   //return errorMessage
    //   return Left(ErrorHandler()
    //       .setError(errorMessage: "You are not connected to internet"));
    // }
    try {
      //Extract products from remote data source
      await remoteDataSource.addItemToCart(cartItem);

      //return products
      return Right("");
    } catch (e) {
      print(e);
      //return errorMessage
      return Left(ErrorHandler(errorMessage: 'failed to add item to cart'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteItemFromCart(Product cartItem) async {
    // if (!await networkInfo.isConnected) {
    //   //return errorMessage
    //   return Left(ErrorHandler()
    //       .setError(errorMessage: "You are not connected to internet"));
    // }
    try {
      //Extract products from remote data source
      await remoteDataSource.deleteItemFromCart(cartItem);

      //return products
      return Right(null);
    } catch (e) {
      print(e);
      //return errorMessage
      return Left(ErrorHandler(errorMessage: 'failed to delete item'));
    }
  }

  @override
  Future<Either<Failure, List<CartItem>>> getItemsInCart() async {
    // if (!await networkInfo.isConnected) {
    //   //return errorMessage
    //   return Left(ErrorHandler()
    //       .setError(errorMessage: "You are not connected to internet"));
    // }
    try {
      //Extract products from remote data source
      final List<CartItem> cartProducts =
          await remoteDataSource.getItemsInCart();

      //return products
      return Right(cartProducts);
    } catch (e) {
      print(e);
      //return errorMessage
      return Left(ErrorHandler(errorMessage: 'cannot get items'));
    }
  }
}
