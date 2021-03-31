import 'package:dartz/dartz.dart';
import 'package:furnitur/core/errors/failures.dart';
import 'package:furnitur/features/home/domain/entities/product.dart';

abstract class HomeRepository {
  /// Should return list of URL's of
  /// posters for special offers
  Future<Either<Failure, List<String>>> getSpecialOffersUrl();

  /// Should return list of For You
  /// products
  Future<Either<Failure, List<Product>>> getForYouProducts();
}
