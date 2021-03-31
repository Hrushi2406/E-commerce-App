import 'package:flutter/cupertino.dart';
import 'package:furnitur/features/home/domain/entities/product.dart';

class CartItem extends Product {
  final String userId;
  int quantity;

  CartItem({
    @required this.userId,
    @required this.quantity,
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

  @override
  List<Object> get props => [
        userId,
        quantity,
        productId,
        name,
        imageUrl,
        categories,
        mainCategory,
        price,
        description,
        colors,
        noOfReviews,
        rating,
      ];
}
