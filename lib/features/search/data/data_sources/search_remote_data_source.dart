import 'package:furnitur/core/errors/exceptions.dart';
import 'package:furnitur/core/network_interface/server_interactor.dart';
import 'package:furnitur/features/home/data/models/product_model.dart';
import 'package:furnitur/features/home/domain/entities/product.dart';

abstract class SearchRemoteDataSource {
  /// Will return List of [Product] on
  /// success and will throw [ServerException]
  /// on failure
  Future<List<ProductModel>> getSearchResult(String query);
}

class SearchRemoteDataSourceImpl extends SearchRemoteDataSource {
  final ServerInteractor server;

  SearchRemoteDataSourceImpl({this.server});

  @override
  Future<List<ProductModel>> getSearchResult(String query) async {
    //Make request to server
    final response = await server.getRequest('/products/search?search=$query');

    //extracting list
    final List categoryProducts = response['searchResults'];

    //Create empty list of ProductModel
    List<ProductModel> listOfProducts = [];

    //Convert the JSON into ProductModel
    categoryProducts.forEach((product) {
      listOfProducts.add(ProductModel.fromJson(product));
    });

    //return the list of product Model
    return listOfProducts;
  }
}
