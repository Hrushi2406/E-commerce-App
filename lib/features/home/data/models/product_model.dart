import 'package:flutter/foundation.dart';
import 'package:furnitur/features/home/domain/entities/product.dart';

class ProductModel extends Product {
  ProductModel({
    @required String productId,
    @required String name,
    @required String description,
    @required int price,
    @required String imageUrl,
    @required List<String> colors,
    @required List<String> categories,
    @required int noOfReviews,
    @required int rating,
    @required String mainCategory,
  }) : super(
          productId: productId,
          name: name,
          description: description,
          price: price,
          imageUrl: imageUrl,
          colors: colors,
          categories: categories,
          noOfReviews: noOfReviews,
          rating: rating,
          mainCategory: mainCategory,
        );

  /// Returns a [ProductModel] from json
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
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

  /// Returns Map<String, dynamic> from ProductModel
  Map<String, dynamic> toJson() => {
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
