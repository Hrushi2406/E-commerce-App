import 'package:dartz/dartz.dart';
import 'package:furnitur/core/errors/failures.dart';
import 'package:furnitur/core/network/network_info.dart';
import 'package:furnitur/features/home/data/models/product_model.dart';
import 'package:furnitur/features/search/data/data_sources/search_remote_data_source.dart';
import 'package:furnitur/features/search/domain/repositories/search_repository.dart';

class SearchRepositoryImpl implements SearchRepository {
  final SearchRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  SearchRepositoryImpl({this.remoteDataSource, this.networkInfo});

  @override
  Future<Either<Failure, List<ProductModel>>> getSearchResult(
    String query,
  ) async {
    // if (!await networkInfo.isConnected) {
    //   //return errorMessage
    //   return Left(ErrorHandler()
    //       .setError(errorMessage: "You are not connected to internet"));
    // }
    try {
      //Extract products from remote data source
      final List<ProductModel> _products =
          await remoteDataSource.getSearchResult(query);

      //return products
      return Right(_products);
    } catch (e) {
      print(e);
      //return errorMessage
      return Left(e);
    }
  }
}
