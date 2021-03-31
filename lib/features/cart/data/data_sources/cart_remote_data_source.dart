import 'package:furnitur/core/network_interface/server_interactor.dart';
import 'package:furnitur/features/cart/data/models/cart_model.dart';
import 'package:furnitur/features/cart/domain/entities/cart_item.dart';
import 'package:furnitur/features/home/domain/entities/product.dart';

abstract class CartRemoteDataSource {
  //Add Item To Cart
  Future<void> addItemToCart(Product cartItem);

  //Delete Item from Cart
  Future<void> deleteItemFromCart(Product cartItem);

  //Get Items From Cart
  Future<List<CartItem>> getItemsInCart();
}

class CartRemoteDataSourceImpl extends CartRemoteDataSource {
  final ServerInteractor server;

  CartRemoteDataSourceImpl({this.server});

  @override
  Future<void> addItemToCart(Product cartItem) async {
    //Make post request to server
    await server.postRequest("/cart", body: {"productId": cartItem.productId});

    return;
  }

  @override
  Future<void> deleteItemFromCart(Product cartItem) async {
    //Make post request to server
    await server.deleteRequest("/cart/${cartItem.productId}");

    return;
  }

  @override
  Future<List<CartItem>> getItemsInCart() async {
    //Making request to server
    final response = await server.getRequest('/cart');

    final List cartProducts = response['cartProducts'];

    //Create empty list of ProductModel
    List<CartItem> listOfProducts = [];

    // //Conver the JSON into ProductModel
    cartProducts.forEach((product) {
      listOfProducts.add(CartItemModel.fromJson(product));
    });

    // //return the list of product Model
    return listOfProducts;
  }
}
