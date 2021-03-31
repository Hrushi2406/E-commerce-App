import 'package:dartz/dartz.dart';
import 'package:furnitur/core/errors/failures.dart';
import 'package:furnitur/core/network/network_info.dart';
import 'package:furnitur/core/utils/enums.dart';
import 'package:furnitur/features/categories/data/data_sources/category_remote_data_source.dart';
import 'package:furnitur/features/categories/domain/repositories/category_repository.dart';
import 'package:furnitur/features/home/data/models/product_model.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  CategoryRepositoryImpl({
    this.remoteDataSource,
    this.networkInfo,
  });

  @override
  Future<Either<Failure, List<ProductModel>>> getProductsForCategory(
    CategoryEnum categoryEnum,
  ) async {
    // if (!await networkInfo.isConnected) {
    //   //return errorMessage
    //   return Left(ErrorHandler()
    //       .setError(errorMessage: "You are not connected to internet"));
    // }
    try {
      //Extract products from remote data source
      final List<ProductModel> _products =
          await remoteDataSource.getProductsForCategory(categoryEnum);

      //return produccts
      return Right(_products);
    } catch (e) {
      print(e);
      //return errorMessage
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, List<ProductModel>>> getAllProducts() async {
    // if (!await networkInfo.isConnected) {
    //   //return errorMessage
    //   return Left(ErrorHandler()
    //       .setError(errorMessage: "You are not connected to internet"));
    // }
    try {
      //Extract products from remote data source
      final List<ProductModel> _products =
          await remoteDataSource.getAllProducts();

      //return produccts
      return Right(_products);
    } catch (e) {
      print(e);
      //return errorMessage
      return Left(e);
    }
  }
}
