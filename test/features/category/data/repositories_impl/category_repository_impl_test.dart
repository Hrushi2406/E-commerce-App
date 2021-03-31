//import 'package:flutter_test/flutter_test.dart';
//import 'package:furnitur/core/network/network_info.dart';
//import 'package:furnitur/core/utils/enums.dart';
//import 'package:furnitur/features/categories/data/data_sources/category_remote_data_source.dart';
//import 'package:furnitur/features/categories/data/repositories_impl/category_repository_impl.dart';
//import 'package:furnitur/features/home/data/models/product_model.dart';
//import 'package:mockito/mockito.dart';
//
//class MockCategoryRemoteDataSource extends Mock
//    implements CategoryRemoteDataSource {}
//
//class MockNetworkInfo extends Mock implements NetworkInfo {}
//
//void main() {
//  MockCategoryRemoteDataSource remoteDataSource;
//  MockNetworkInfo networkInfo;
//  CategoryRepositoryImpl categoryRepositoryImpl;
//
//  setUp(() {
//    remoteDataSource = MockCategoryRemoteDataSource();
//    networkInfo = MockNetworkInfo();
//    categoryRepositoryImpl = CategoryRepositoryImpl(
//      remoteDataSource: remoteDataSource,
//      networkInfo: networkInfo,
//    );
//  });
//
//  group('Get List of Products For Category', () {
//    final CategoryEnum _categoryEnum = CategoryEnum.Lamp;
//    final List<ProductModel> _products = [
//      ProductModel(
//        productId: 'ABCD',
//        name: 'lamp',
//        description: 'this is a lamp',
//        price: 2999,
//        imageUrl: 'https://thisisimageurl.com/',
//        colors: ['Red', 'Green', 'Blue'],
//        categories: ['lamp', 'vase'],
//        rating: 3,
//        noOfReviews: 12,
//        mainCategory: 'lamp',
//      ),
//    ];
//  });
//}
