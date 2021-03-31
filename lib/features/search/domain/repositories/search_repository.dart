import 'package:dartz/dartz.dart';
import 'package:furnitur/core/errors/failures.dart';
import 'package:furnitur/features/home/domain/entities/product.dart';

abstract class SearchRepository {
  /// Will return Search result
  /// for given [query]
  Future<Either<Failure, List<Product>>> getSearchResult(String query);
}
