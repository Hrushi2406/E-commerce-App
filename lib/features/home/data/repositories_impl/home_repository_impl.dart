import 'package:dartz/dartz.dart';
import 'package:furnitur/core/errors/failures.dart';
import 'package:furnitur/core/network/network_info.dart';
import 'package:furnitur/features/home/data/data_sources/home_repository_remote_data_source.dart';
import 'package:furnitur/features/home/data/models/product_model.dart';
import 'package:furnitur/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRepositoryRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  HomeRepositoryImpl({this.remoteDataSource, this.networkInfo});

  /// Will return List<ProductModel> if
  /// connected to internet & no ServerFailure occurs
  @override
  Future<Either<Failure, List<ProductModel>>> getForYouProducts() async {
    //Checking If There is Internet Connection
    // if (!await networkInfo.isConnected) {
    //   //Returning Failure message
    //   return Left(ErrorHandler()
    //       .setError(errorMessage: "You are not connected to internet"));
    // }

    try {
      //Extracting Products from remote data source
      final List<ProductModel> _products =
          await remoteDataSource.getForYouProducts();

      //returning Products
      return Right(_products);
    } catch (e) {
      //Returning Failure message
      print(e);
      return Left(e);
    }
  }

  /// Will return List<<Map<String, dynamic>> if
  /// connected to internet & no ServerFailure occurs
  @override
  Future<Either<Failure, List<String>>> getSpecialOffersUrl() async {
    //Checking If There is Internet Connection
    // if (!await networkInfo.isConnected) {
    //   //Returning Failure message
    //   return Left(ErrorHandler()
    //       .setError(errorMessage: "You are not connected to internet"));
    // }
    try {
      //Extracting Special Offers from remote data source
      final List<String> specialOffers =
          await remoteDataSource.getSpecialOffersUrl();

      //Returning special Offers
      return Right(specialOffers);
    } catch (e) {
      //Returning Failure message
      print(e);
      return Left(e);
    }
  }
}
