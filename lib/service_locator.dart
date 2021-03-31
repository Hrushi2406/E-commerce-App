import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:furnitur/core/blocs/app_bloc/applevel_bloc.dart';
import 'package:furnitur/core/blocs/bloc/product_bloc.dart';
import 'package:furnitur/core/network/network_info.dart';
import 'package:furnitur/core/network_interface/server_interactor.dart';
import 'package:furnitur/features/authentication/data/data_sources/auth_local_datasource.dart';
import 'package:furnitur/features/authentication/data/data_sources/auth_remote_datasource.dart';
import 'package:furnitur/features/authentication/data/repositories_impl/auth_repository_impl.dart';
import 'package:furnitur/features/authentication/domain/repositories/auth_repository.dart';
import 'package:furnitur/features/authentication/domain/use_cases/create_user_use_case.dart';
import 'package:furnitur/features/authentication/domain/use_cases/login_user_with_email_use_case.dart';
import 'package:furnitur/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:furnitur/features/cart/data/data_sources/cart_remote_data_source.dart';
import 'package:furnitur/features/cart/domain/repositories/cart_repository.dart';
import 'package:furnitur/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:furnitur/features/categories/domain/use_cases/get_products_for_category_use_case.dart';
import 'package:furnitur/features/home/data/data_sources/home_repository_remote_data_source.dart';
import 'package:furnitur/features/home/data/repositories_impl/home_repository_impl.dart';
import 'package:furnitur/features/home/domain/repositories/home_repository.dart';
import 'package:furnitur/features/home/domain/use_cases/get_for_you_products.dart';
import 'package:furnitur/features/home/domain/use_cases/get_special_offers_url_use_case.dart';
import 'package:furnitur/features/home/presentation/bloc/home_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/cart/data/repositories_impl/cart_repository_impl.dart';
import 'features/categories/data/data_sources/category_remote_data_source.dart';
import 'features/categories/data/repositories_impl/category_repository_impl.dart';
import 'features/categories/domain/repositories/category_repository.dart';
import 'features/search/data/data_sources/search_remote_data_source.dart';
import 'features/search/data/repositories_impl/search_repository_impl.dart';
import 'features/search/domain/repositories/search_repository.dart';
import 'features/search/presentation/bloc/search_bloc.dart';

final locator = GetIt.instance;

Future<void> init() async {
  //Features
  //BLOC
  locator.registerFactory(() => AuthenticationBloc(authRepository: locator()));
  locator.registerFactory(() => HomeBloc(homeRepository: locator()));
  locator.registerFactory(() => ProductBloc(categoryRepository: locator()));
  locator.registerFactory(() => SearchBloc(searchRepository: locator()));
  locator.registerFactory(() => CartBloc(cartRepository: locator()));
  locator.registerFactory(() => ApplevelBloc(
        server: locator(),
        localDatasource: locator(),
      ));

  //UseCases
  locator.registerLazySingleton(() => LoginUserWithEmailUseCase(locator()));
  locator.registerLazySingleton(() => CreateUserUseCase(locator()));

  locator.registerLazySingleton(() => GetForYouProductsUseCase(locator()));
  locator.registerLazySingleton(() => GetSpecialOffersUrlUseCase(locator()));

  locator.registerLazySingleton(() => GetProductsForCategoryUseCase(locator()));

//Repository
  locator.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(
        localDataSource: locator(),
        remoteDataSource: locator(),
        networkInfo: locator(),
      ));

  locator.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(
        remoteDataSource: locator(),
        networkInfo: locator(),
      ));

  locator
      .registerLazySingleton<CategoryRepository>(() => CategoryRepositoryImpl(
            remoteDataSource: locator(),
            networkInfo: locator(),
          ));

  locator.registerLazySingleton<SearchRepository>(() => SearchRepositoryImpl(
        remoteDataSource: locator(),
        networkInfo: locator(),
      ));

  locator.registerLazySingleton<CartRepository>(() => CartRepositoryImpl(
        remoteDataSource: locator(),
        networkInfo: locator(),
      ));

  //Data Source
  locator.registerLazySingleton<AuthLocalDatasource>(
      () => AuthLocalDatasourceImpl(sharedPreferences: locator()));
  locator.registerLazySingleton<AuthRemoteDatasource>(
      () => AuthRemoteDatasourceImpl(server: locator()));

  locator.registerLazySingleton<HomeRepositoryRemoteDataSource>(
      () => HomeRepositoryRemoteDataSourceImpl(server: locator()));

  locator.registerLazySingleton<CategoryRemoteDataSource>(
      () => CategoryRemoteDataSourceImpl(server: locator()));

  locator.registerLazySingleton<SearchRemoteDataSource>(
      () => SearchRemoteDataSourceImpl(server: locator()));

  locator.registerLazySingleton<CartRemoteDataSource>(
      () => CartRemoteDataSourceImpl(server: locator()));

  //Core
  locator.registerLazySingleton(() => ServerInteractor());
  locator.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectionChecker: locator()));

  //External
  SharedPreferences prefs = await SharedPreferences.getInstance();
  locator.registerLazySingleton(() => prefs);
  locator.registerLazySingleton(() => DataConnectionChecker());
}
