import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:furnitur/core/errors/exceptions.dart';
import 'package:furnitur/core/errors/failures.dart';
import 'package:furnitur/core/network/network_info.dart';
import 'package:furnitur/features/home/data/models/product_model.dart';
import 'package:furnitur/features/search/data/data_sources/search_remote_data_source.dart';
import 'package:furnitur/features/search/data/repositories_impl/search_repository_impl.dart';
import 'package:mockito/mockito.dart';

class MockSearchRemoteDataSource extends Mock
    implements SearchRemoteDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  MockSearchRemoteDataSource remoteDataSource;
  MockNetworkInfo networkInfo;
  SearchRepositoryImpl searchRepositoryImpl;

  setUp(() {
    remoteDataSource = MockSearchRemoteDataSource();
    networkInfo = MockNetworkInfo();
    searchRepositoryImpl = SearchRepositoryImpl(
      remoteDataSource: remoteDataSource,
      networkInfo: networkInfo,
    );
  });

  group('Get Search Result', () {
    final String _query = 'lamp';
    final List<ProductModel> _products = [
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
        when(remoteDataSource.getSearchResult(any))
            .thenAnswer((_) async => _products);

        //act
        final result = await searchRepositoryImpl.getSearchResult(_query);

        //assert
        verify(remoteDataSource.getSearchResult(_query));
        expect(result, Right(_products));
      },
    );

    test(
      'should return ServerFailure on failure',
      () async {
        //arrange
        when(networkInfo.isConnected).thenAnswer((_) async => true);
        when(remoteDataSource.getSearchResult(any))
            .thenThrow((_) async => ServerException());

        //act
        final result = await searchRepositoryImpl.getSearchResult(_query);

        //assert
        verify(remoteDataSource.getSearchResult(_query));
        expect(result, Left(ServerFailure()));
      },
    );

    test(
      'should return ServerFailure if not connected to internet',
      () async {
        //arrange
        when(networkInfo.isConnected).thenAnswer((_) async => false);

        //act
        final result = await searchRepositoryImpl.getSearchResult(_query);

        //assert
        verifyNever(remoteDataSource.getSearchResult(_query));
        expect(result, Left(ServerFailure()));
      },
    );
  });
}
