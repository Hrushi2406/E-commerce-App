import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/repositories/auth_repository.dart';
import '../data_sources/auth_local_datasource.dart';
import '../data_sources/auth_remote_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource remoteDataSource;
  final AuthLocalDatasource localDataSource;
  final NetworkInfo networkInfo;

  AuthRepositoryImpl({
    this.remoteDataSource,
    this.localDataSource,
    this.networkInfo,
  });

  @override
  Future<Either<Failure, String>> createUser(
    String name,
    String email,
    String password,
  ) async {
    // if (!await networkInfo.isConnected) {
    //   return Left(
    //       ErrorHandler(errorMessage: "You are not connected to internet"));
    // }

    try {
      //Extracting token from remote data source
      String token =
          await remoteDataSource.registerUserWithEmail(name, email, password);

      //cache the token to local data source
      await localDataSource.setAuthToken(token);

      //returning token
      return Right(token);
    } catch (e) {
      //Returning Failure
      print(e);
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, String>> loginUserWithEmail(
    String email,
    String password,
  ) async {
    // if (!await networkInfo.isConnected) {
    //   return Left(ErrorHandler()
    //       .setError(errorMessage: "You are not connected to internet"));
    // }

    try {
      //Extracting token from remote data source
      String token = await remoteDataSource.loginUserWithEmail(email, password);

      //cache the token to local data source
      await localDataSource.setAuthToken(token);

      //returning token
      return Right(token);
    } catch (e) {
      print(e);
      //Returning Failure
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, String>> loginUserWithFacebook() {
    // TODO: implement loginUserWithFacebook
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> loginUserWithGoogle() {
    // TODO: implement loginUserWithGoogle
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> getAuthToken() async {
    try {
      //Extracting token from remote data source
      String token = await localDataSource.getAuthToken();

      //cache the token to local data source
      await localDataSource.setAuthToken(token);

      //returning token
      return Right(token);
    } catch (e) {
      //Returning Error
      return Left(ErrorHandler(errorMessage: 'No Auth Token Found'));
    }
  }
}
