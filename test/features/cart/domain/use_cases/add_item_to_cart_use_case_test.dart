import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:furnitur/core/errors/failures.dart';
import 'package:furnitur/features/cart/domain/entities/cart_item.dart';
import 'package:furnitur/features/cart/domain/repositories/cart_repository.dart';
import 'package:furnitur/features/cart/domain/use_cases/add_item_to_cart_use_case.dart';
import 'package:mockito/mockito.dart';

class MockCartRepository extends Mock implements CartRepository {}

void main() {
  MockCartRepository mockCartRepository;
  AddItemToCartUseCase addItemToCartUseCase;

  setUp(() {
    mockCartRepository = MockCartRepository();
    addItemToCartUseCase = AddItemToCartUseCase(mockCartRepository);
  });

  group('Add item to cart', () {
    final CartItem _cartItem = CartItem(
      userId: 'ABCD',
      quantity: 2,
      name: 'Duo Lamp',
      productId: 'ZXCV',
      imageUrl: 'image.com',
      mainCategory: 'lamp',
      price: 3999,
    );

    test(
      'should return null on success',
      () async {
        //arrange
        when(mockCartRepository.addItemToCart(any))
            .thenAnswer((_) async => Right(null));

        //act
        final result = await addItemToCartUseCase.call(Params(_cartItem));

        //assert
        verify(mockCartRepository.addItemToCart(_cartItem));
        expect(result, Right(null));
      },
    );

    test(
      'should return Failure on failure',
      () async {
        //arrange
        when(mockCartRepository.addItemToCart(any))
            .thenAnswer((_) async => Left(ServerFailure()));

        //act
        final result = await addItemToCartUseCase.call(Params(_cartItem));

        //assert
        verify(mockCartRepository.addItemToCart(_cartItem));
        expect(result, Left(ServerFailure()));
      },
    );
  });
}
