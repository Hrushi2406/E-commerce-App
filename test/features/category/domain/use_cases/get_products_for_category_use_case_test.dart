import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:furnitur/core/errors/failures.dart';
import 'package:furnitur/core/utils/enums.dart';
import 'package:furnitur/features/categories/domain/repositories/category_repository.dart';
import 'package:furnitur/features/categories/domain/use_cases/get_products_for_category_use_case.dart';
import 'package:furnitur/features/home/domain/entities/product.dart';
import 'package:mockito/mockito.dart';

class MockCategoryRepository extends Mock implements CategoryRepository {}

void main() {
  MockCategoryRepository categoryRepository;
  GetProductsForCategoryUseCase getProductsForCategoryUseCase;

  setUp(() {
    categoryRepository = MockCategoryRepository();
    getProductsForCategoryUseCase =
        GetProductsForCategoryUseCase(categoryRepository);
  });

  group('Get Products For Category', () {
    final CategoryEnum _categoryEnum = CategoryEnum.Lamp;
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
        when(categoryRepository.getProductsForCategory(any))
            .thenAnswer((_) async => Right(_products));

        //act
        final result =
            await getProductsForCategoryUseCase.call(Params(_categoryEnum));

        //assert
        verify(categoryRepository.getProductsForCategory(_categoryEnum));
        expect(result, Right(_products));
      },
    );

    test(
      'should return Failure on failure',
      () async {
        //arrange
        when(categoryRepository.getProductsForCategory(any))
            .thenAnswer((_) async => Left(ServerFailure()));

        //act
        final result =
            await getProductsForCategoryUseCase.call(Params(_categoryEnum));

        //assert
        verify(categoryRepository.getProductsForCategory(_categoryEnum));
        expect(result, Left(ServerFailure()));
      },
    );
  });
}
