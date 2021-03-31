import 'package:dartz/dartz.dart';
import 'package:furnitur/core/errors/failures.dart';
import 'package:furnitur/core/utils/enums.dart';
import 'package:furnitur/features/home/data/models/product_model.dart';

abstract class CategoryRepository {
  /// Will return List of [Product]'s
  /// for the given [Category]
  Future<Either<Failure, List<ProductModel>>> getProductsForCategory(
    CategoryEnum categoryEnum,
  );

  //Return all the available products
  Future<Either<Failure, List<ProductModel>>> getAllProducts();
}
