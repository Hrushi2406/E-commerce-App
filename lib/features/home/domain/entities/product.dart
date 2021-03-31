import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class Product extends Equatable {
  final String productId;
  final String name;
  final String description;
  final int price;
  final String imageUrl;
  final List<String> colors;
  final List<String> categories;
  final int noOfReviews;
  final int rating;
  final String mainCategory;

  Product({
    @required this.productId,
    @required this.name,
    @required this.description,
    @required this.price,
    @required this.imageUrl,
    @required this.colors,
    @required this.categories,
    @required this.noOfReviews,
    @required this.rating,
    @required this.mainCategory,
  });

  @override
  List<Object> get props => [
        productId,
        name,
        description,
        price,
        imageUrl,
        colors,
        categories,
        noOfReviews,
        rating,
        mainCategory,
      ];
}
