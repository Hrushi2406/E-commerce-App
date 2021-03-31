import 'package:flutter/cupertino.dart';
import 'package:furnitur/features/cart/domain/entities/cart_item.dart';

class CartItemModel extends CartItem {
  CartItemModel({
    @required String userId,
    @required int quantity,
    @required String name,
    @required String productId,
    @required String imageUrl,
    @required String mainCategory,
    @required int price,
    String description,
    List<String> colors,
    List<String> categories,
    int noOfReviews,
    int rating,
  }) : super(
          userId: userId,
          quantity: quantity,
          name: name,
          productId: productId,
          imageUrl: imageUrl,
          mainCategory: mainCategory,
          price: price,
          description: description,
          colors: colors,
          categories: categories,
          noOfReviews: noOfReviews,
          rating: rating,
        );

  /// Returns a [CartItemModel] from json
  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      userId: json['userId'],
      quantity: json['quantity'],
      productId: json['productId'],
      name: json['name'],
      description: json['description'],
      price: json['price'] as num,
      imageUrl: json['imageUrl'],
      colors: List<String>.from(json['colors']),
      categories: List<String>.from(json['categories']),
      noOfReviews: json['noOfReviews'] as num,
      rating: json['rating'] as num,
      mainCategory: json['mainCategory'],
    );
  }

  /// Returns Map<String, dynamic> from [CartItemModel]
  Map<String, dynamic> toJson() => {
        'userId': userId,
        'quantity': quantity,
        'productId': productId,
        'name': name,
        'description': description,
        'price': price,
        'imageUrl': imageUrl,
        'colors': colors,
        'categories': categories,
        'no_of_reviews': noOfReviews,
        'rating': rating,
        'mainCategory': mainCategory,
      };
}
