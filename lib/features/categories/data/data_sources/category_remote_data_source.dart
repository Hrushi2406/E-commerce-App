import 'package:furnitur/core/errors/exceptions.dart';
import 'package:furnitur/core/network_interface/server_interactor.dart';
import 'package:furnitur/core/utils/enumToString.dart';
import 'package:furnitur/core/utils/enums.dart';
import 'package:furnitur/features/home/data/models/product_model.dart';

abstract class CategoryRemoteDataSource {
  /// Returns List of [ProductModel] on success
  /// and throws [ServerException] on failure
  Future<List<ProductModel>> getProductsForCategory(CategoryEnum categoryEnum);

  Future<List<ProductModel>> getAllProducts();
}

class CategoryRemoteDataSourceImpl implements CategoryRemoteDataSource {
  ServerInteractor server;

  CategoryRemoteDataSourceImpl({this.server});

  @override
  Future<List<ProductModel>> getProductsForCategory(
      CategoryEnum categoryEnum) async {
    //Convert Enum To String
    final String category = convertEnumToString(categoryEnum);

    //Making request to server
    final response = await server.getRequest('/products/category/$category');

    final List categoryProducts = response['products'];

    //Create empty list of ProductModel
    List<ProductModel> listOfProducts = [];

    //Conver the JSON into ProductModel
    categoryProducts.forEach((product) {
      listOfProducts.add(ProductModel.fromJson(product));
    });

    //return the list of product Model
    return listOfProducts;
  }

  @override
  Future<List<ProductModel>> getAllProducts() async {
    //Making request to server
    final response = await server.getRequest('/products');

    final List categoryProducts = response['products'];

    //Create empty list of ProductModel
    List<ProductModel> listOfProducts = [];

    //Conver the JSON into ProductModel
    categoryProducts.forEach((product) {
      listOfProducts.add(ProductModel.fromJson(product));
    });

    //return the list of product Model
    return listOfProducts;
  }
}
