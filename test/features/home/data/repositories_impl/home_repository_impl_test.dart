import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:furnitur/core/errors/exceptions.dart';
import 'package:furnitur/core/errors/failures.dart';
import 'package:furnitur/core/network/network_info.dart';
import 'package:furnitur/features/home/data/data_sources/home_repository_remote_data_source.dart';
import 'package:furnitur/features/home/data/models/product_model.dart';
import 'package:furnitur/features/home/data/repositories_impl/home_repository_impl.dart';
import 'package:mockito/mockito.dart';

class MockHomeRepositoryRemoteDataSource extends Mock
    implements HomeRepositoryRemoteDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  MockHomeRepositoryRemoteDataSource remoteDataSource;
  MockNetworkInfo networkInfo;
  HomeRepositoryImpl homeRepositoryImpl;

  setUp(() {
    remoteDataSource = MockHomeRepositoryRemoteDataSource();
    networkInfo = MockNetworkInfo();
    homeRepositoryImpl = HomeRepositoryImpl(
      remoteDataSource: remoteDataSource,
      networkInfo: networkInfo,
    );
  });

  group('Get List of Products', () {
    List<ProductModel> _products = [
      ProductModel(
        productId: 'ABCD',
        name: 'lamp',
        description: 'this is a lamp',
        price: 2999,
        imageUrl: 'https://thisisimageurl.com/',
        colors: ['Red', 'Green', 'Blue'],
        categories: ['lamp', 'vase'],
        rating: 3,
        noOfReviews: 12,
        mainCategory: 'lamp',
      ),
    ];

    test(
      'should return List<Product> on success',
      () async {
        //arrange
        when(networkInfo.isConnected).thenAnswer((_) async => true);
        when(remoteDataSource.getForYouProducts())
            .thenAnswer((_) async => _products);

        //act
        final result = await homeRepositoryImpl.getForYouProducts();

        //assert
        verify(remoteDataSource.getForYouProducts());
        expect(result, Right(_products));
      },
    );

    test(
      'should return ServerFailure on failure',
      () async {
        //arrange
        when(networkInfo.isConnected).thenAnswer((_) async => true);
        when(remoteDataSource.getForYouProducts())
            .thenThrow((_) async => ServerException());

        //act
        final result = await homeRepositoryImpl.getForYouProducts();

        //assert
        verify(remoteDataSource.getForYouProducts());
        expect(result, Left(ServerFailure()));
      },
    );

    test(
      'should return ServerFailure if not connected to internet',
      () async {
        //arrange
        when(networkInfo.isConnected).thenAnswer((_) async => false);

        //act
        final result = await homeRepositoryImpl.getForYouProducts();

        //assert
        verifyNever(remoteDataSource.getForYouProducts());
        expect(result, Left(ServerFailure()));
      },
    );
  });

  group('Get List of Strings', () {
    final List<String> _specialOffersUrls = ["card", "Just", "Cards"];

    test(
      'should return List<String> on success',
      () async {
        //arrange
        when(networkInfo.isConnected).thenAnswer((_) async => true);
        when(remoteDataSource.getSpecialOffersUrl())
            .thenAnswer((_) async => _specialOffersUrls);

        //act
        final result = await homeRepositoryImpl.getSpecialOffersUrl();

        //assert
        verify(remoteDataSource.getSpecialOffersUrl());
        expect(result, Right(_specialOffersUrls));
      },
    );

    test(
      'should return ServerFailure on failure',
      () async {
        //arrange
        when(networkInfo.isConnected).thenAnswer((_) async => true);
        when(remoteDataSource.getSpecialOffersUrl())
            .thenThrow((_) async => ServerException());

        //act
        final result = await homeRepositoryImpl.getSpecialOffersUrl();

        //assert
        verify(remoteDataSource.getSpecialOffersUrl());
        expect(result, Left(ServerFailure()));
      },
    );

    test(
      'should return ServerFailure if not connected to internet',
      () async {
        //arrange
        when(networkInfo.isConnected).thenAnswer((_) async => false);

        //act
        final result = await homeRepositoryImpl.getSpecialOffersUrl();

        //assert
        verifyNever(remoteDataSource.getSpecialOffersUrl());
        expect(result, Left(ServerFailure()));
      },
    );
  });
}
