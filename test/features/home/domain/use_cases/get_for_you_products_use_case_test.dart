import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:furnitur/core/errors/failures.dart';
import 'package:furnitur/core/usecase/usecase.dart';
import 'package:furnitur/features/home/domain/entities/product.dart';
import 'package:furnitur/features/home/domain/repositories/home_repository.dart';
import 'package:furnitur/features/home/domain/use_cases/get_for_you_products.dart';
import 'package:mockito/mockito.dart';

class MockHomeRepository extends Mock implements HomeRepository {}

void main() {
  MockHomeRepository mockHomeRepository;
  GetForYouProductsUseCase getForYouProductsUseCase;

  setUp(() {
    mockHomeRepository = MockHomeRepository();
    getForYouProductsUseCase = GetForYouProductsUseCase(mockHomeRepository);
  });

  group('Get For You Products', () {
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
        when(mockHomeRepository.getForYouProducts())
            .thenAnswer((_) async => Right(_products));

        //act
        final result = await getForYouProductsUseCase.call(NoParams());

        //assert
        verify(mockHomeRepository.getForYouProducts());
        expect(result, Right(_products));
      },
    );

    test(
      'should return Failure on failure',
      () async {
        //arrange
        when(mockHomeRepository.getForYouProducts())
            .thenAnswer((_) async => Left(ServerFailure()));

        //act
        final result = await getForYouProductsUseCase.call(NoParams());

        //assert
        verify(mockHomeRepository.getForYouProducts());
        expect(result, Left(ServerFailure()));
      },
    );
  });
}
