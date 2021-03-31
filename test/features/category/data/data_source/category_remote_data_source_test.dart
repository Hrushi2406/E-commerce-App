import 'package:flutter_test/flutter_test.dart';
import 'package:furnitur/core/network_interface/server_interactor.dart';
import 'package:furnitur/core/utils/enums.dart';
import 'package:furnitur/features/categories/data/data_sources/category_remote_data_source.dart';
import 'package:furnitur/features/home/data/models/product_model.dart';
import 'package:mockito/mockito.dart';

class MockServerInteractor extends Mock implements ServerInteractor {}

void main() {
  MockServerInteractor server;
  CategoryRemoteDataSourceImpl categoryRemoteDataSource;

  setUp(() {
    server = new MockServerInteractor();
    categoryRemoteDataSource = new CategoryRemoteDataSourceImpl(server: server);
  });

  group("Get For You Products", () {
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

    CategoryEnum category = CategoryEnum.Lamp;

    String categoryName = "lamp";

    test(
      'should perform a get request to server for a category products',
      () async {
        //arrange
        when(
          server.getRequest(any),
        ).thenAnswer((_) => Future.value({'products': _products}));
        //act
        categoryRemoteDataSource.getProductsForCategory(category);
        //assert
        verify(
          server.getRequest('/products/category/$categoryName'),
        );
      },
    );

    test(
      'should return list of product model when request is successfull',
      () async {
        //arrange
        when(
          server.getRequest(any),
        ).thenAnswer((_) => Future.value({'products': _products}));
        //act
        final result =
            await categoryRemoteDataSource.getProductsForCategory(category);
        //assert
        expect(result, equals(_products));
      },
    );
  });
}
