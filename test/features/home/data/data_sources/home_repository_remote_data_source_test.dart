import 'package:flutter_test/flutter_test.dart';
import 'package:furnitur/core/network_interface/server_interactor.dart';
import 'package:furnitur/features/home/data/data_sources/home_repository_remote_data_source.dart';
import 'package:furnitur/features/home/data/models/product_model.dart';
import 'package:mockito/mockito.dart';

class MockServerInteractor extends Mock implements ServerInteractor {}

void main() {
  MockServerInteractor server;
  HomeRepositoryRemoteDataSourceImpl homeRemoteDataSource;

  setUp(() {
    server = new MockServerInteractor();
    homeRemoteDataSource =
        new HomeRepositoryRemoteDataSourceImpl(server: server);
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

    test(
      'should perform a get request to server for ForYou products',
      () async {
        //arrange
        when(
          server.getRequest(any),
        ).thenAnswer((_) => Future.value({'forYouProducts': _products}));
        //act
        homeRemoteDataSource.getForYouProducts();
        //assert
        verify(
          server.getRequest('/forYouProducts'),
        );
      },
    );

    test(
      'should return list of product model when request is successfull',
      () async {
        //arrange
        when(
          server.getRequest(any),
        ).thenAnswer((_) => Future.value({'forYouProducts': _products}));
        //act
        final result = await homeRemoteDataSource.getForYouProducts();
        //assert
        expect(result, equals(_products));
      },
    );
  });

  group("Get Special Offers", () {
    List<Map<String, dynamic>> specialOffers = [
      {
        "categories": "table_chair",
        "offerId": "1",
        "imageUrl":
            "https://res.cloudinary.com/dbbkmv1rs/image/upload/v1592721798/furnitur/table_cx6jjh.png"
      },
    ];

    test(
      'should perform a get request to server for special offers ',
      () async {
        //arrange
        when(
          server.getRequest(any),
        ).thenAnswer((_) => Future.value({'specialOffers': specialOffers}));
        //act
        homeRemoteDataSource.getSpecialOffersUrl();
        //assert
        verify(
          server.getRequest('/specialOffers'),
        );
      },
    );

    test(
      'should return list of product model when request is successfull',
      () async {
        //arrange
        when(
          server.getRequest(any),
        ).thenAnswer((_) => Future.value({'specialOffers': specialOffers}));
        //act
        final result = await homeRemoteDataSource.getSpecialOffersUrl();
        //assert
        expect(result, equals(specialOffers));
      },
    );
  });
}
