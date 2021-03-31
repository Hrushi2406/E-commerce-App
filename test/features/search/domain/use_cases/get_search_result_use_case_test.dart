import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:furnitur/core/errors/failures.dart';
import 'package:furnitur/features/home/domain/entities/product.dart';
import 'package:furnitur/features/search/domain/repositories/search_repository.dart';
import 'package:furnitur/features/search/domain/use_cases/get_search_result_use_case.dart';
import 'package:mockito/mockito.dart';

class MockSearchRepository extends Mock implements SearchRepository {}

void main() {
  MockSearchRepository mockSearchRepository;
  GetSearchResultUseCase getSearchResultUseCase;

  setUp(() {
    mockSearchRepository = MockSearchRepository();
    getSearchResultUseCase = GetSearchResultUseCase(mockSearchRepository);
  });

  group('Get Search Result', () {
    final String _query = 'lamp';
    final List<Product> _products = [
      Product(
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
        when(mockSearchRepository.getSearchResult(any))
            .thenAnswer((_) async => Right(_products));

        //act
        final result = await getSearchResultUseCase.call(Params(_query));

        //assert
        verify(mockSearchRepository.getSearchResult(_query));
        expect(result, Right(_products));
      },
    );

    test(
      'should return Failure on failure',
      () async {
        //arrange
        when(mockSearchRepository.getSearchResult(any))
            .thenAnswer((_) async => Left(ServerFailure()));

        //act
        final result = await getSearchResultUseCase.call(Params(_query));

        //assert
        verify(mockSearchRepository.getSearchResult(_query));
        expect(result, Left(ServerFailure()));
      },
    );
  });
}
