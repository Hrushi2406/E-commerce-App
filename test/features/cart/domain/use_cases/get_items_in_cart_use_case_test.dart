import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:furnitur/core/errors/failures.dart';
import 'package:furnitur/core/usecase/usecase.dart';
import 'package:furnitur/features/cart/domain/entities/cart_item.dart';
import 'package:furnitur/features/cart/domain/repositories/cart_repository.dart';
import 'package:furnitur/features/cart/domain/use_cases/get_items_in_cart_use_case.dart';
import 'package:mockito/mockito.dart';

class MockCartRepository extends Mock implements CartRepository {}

void main() {
  MockCartRepository mockCartRepository;
  GetItemsInCartUseCase getItemsInCartUseCase;

  setUp(() {
    mockCartRepository = MockCartRepository();
    getItemsInCartUseCase = GetItemsInCartUseCase(mockCartRepository);
  });

  group('Get items in cart', () {
    final List<CartItem> _items = [
      CartItem(
        userId: 'ABCD',
        quantity: 2,
        name: 'Duo Lamp',
        productId: 'ZXCV',
        imageUrl: 'image.com',
        mainCategory: 'lamp',
        price: 3999,
      ),
      CartItem(
        userId: 'ABCDEF',
        quantity: 1,
        name: 'Duo Lamp',
        productId: 'ZXCV',
        imageUrl: 'image.com',
        mainCategory: 'lamp',
        price: 2999,
      ),
    ];

    test(
      'should return List<CartItem> on success',
      () async {
        //arrange
        when(mockCartRepository.getItemsInCart())
            .thenAnswer((_) async => Right(_items));

        //act
        final result = await getItemsInCartUseCase.call(NoParams());

        //assert
        verify(mockCartRepository.getItemsInCart());
        expect(result, Right(_items));
      },
    );

    test(
      'should return Failure on failure',
      () async {
        //arrange
        when(mockCartRepository.getItemsInCart())
            .thenAnswer((_) async => Left(ServerFailure()));

        //act
        final result = await getItemsInCartUseCase.call(NoParams());

        //assert
        verify(mockCartRepository.getItemsInCart());
        expect(result, Left(ServerFailure()));
      },
    );
  });
}
