import 'package:furnitur/core/network_interface/server_interactor.dart';
import 'package:furnitur/features/home/data/models/product_model.dart';

abstract class HomeRepositoryRemoteDataSource {
  Future<List<ProductModel>> getForYouProducts();
  Future<List<String>> getSpecialOffersUrl();
}

class HomeRepositoryRemoteDataSourceImpl
    implements HomeRepositoryRemoteDataSource {
  ServerInteractor server;

  HomeRepositoryRemoteDataSourceImpl({this.server});

  @override
  Future<List<ProductModel>> getForYouProducts() async {
    //Making request to server
    final response = await server.getRequest('/forYouProducts');

    final List forYouProducts = response['forYouProducts'];

    //Create empty list of ProductModel
    List<ProductModel> listOfProducts = [];

    // //Conver the JSON into ProductModel
    forYouProducts.forEach((product) {
      listOfProducts.add(ProductModel.fromJson(product));
    });

    // //return the list of product Model
    return listOfProducts;
  }

  @override
  Future<List<String>> getSpecialOffersUrl() async {
    //Making request to server
    final response = await server.getRequest('/specialOffers');

    //Extract special offers from body
    final List specialOffers = List<String>.from(response['specialOffers']);

    //return the list of product Model
    return specialOffers;
  }
}
